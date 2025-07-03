import json
from os import path as osp
from pprint import pprint
from textwrap import dedent
from time import sleep

from infrahouse_core.aws import get_client
from pytest_infrahouse import terraform_apply

from tests.conftest import (
    LOG,
    TERRAFORM_ROOT_DIR,
)


def test_module(
    test_role_arn,
    keep_after,
    aws_region,
):

    terraform_module_dir = osp.join(TERRAFORM_ROOT_DIR, "emrserverless")
    with open(osp.join(terraform_module_dir, "terraform.tfvars"), "w") as fp:
        fp.write(
            dedent(
                f"""
                    region              = "{aws_region}"
                    """
            )
        )
        if test_role_arn:
            fp.write(
                dedent(
                    f"""
                    role_arn        = "{test_role_arn}"
                    """
                )
            )

    with terraform_apply(
        terraform_module_dir,
        destroy_after=not keep_after,
        json_output=True,
    ) as tf_output:
        LOG.info("%s", json.dumps(tf_output, indent=4))
        application_id = tf_output["application_id"]["value"]
        exec_role_arn = tf_output["job_role_arn"]["value"]
        storage_bucket_name = tf_output["storage_bucket_name"]["value"]
        client = get_client("emr-serverless", role_arn=test_role_arn, region=aws_region)
        response = client.start_job_run(
            applicationId=application_id,
            executionRoleArn=exec_role_arn,
            jobDriver={
                "sparkSubmit": {
                    "entryPoint": f"s3://{storage_bucket_name}/scripts/wordcount.py",
                    "entryPointArguments": [f"s3://{storage_bucket_name}/output"],
                    "sparkSubmitParameters": " ".join(
                        [
                            "--conf",
                            "spark.executor.cores=1",
                            "--conf",
                            "spark.executor.memory=4g",
                            "--conf",
                            "spark.driver.cores=1",
                            "--conf",
                            "spark.driver.memory=4g",
                            "--conf",
                            "spark.executor.instances=1",
                        ]
                    ),
                }
            },
        )
        print(json.dumps(response, indent=4))
        job_run_id = response["jobRunId"]
        job_run_state = None
        while job_run_state != "SUCCESS":
            response = client.get_job_run(
                applicationId=application_id, jobRunId=job_run_id
            )
            pprint(response)
            job_run_state = response["jobRun"]["state"]
            if job_run_state in ["FAILED", "CANCELLING", "CANCELLED"]:
                raise RuntimeError("Job didn't succeed")
            sleep(3)
