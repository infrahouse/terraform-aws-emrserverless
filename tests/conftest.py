import logging

from infrahouse_core.logging import setup_logging

# "303467602807" is our test account
TEST_ACCOUNT = "303467602807"
# TEST_ROLE_ARN = "arn:aws:iam::303467602807:role/sqs-ecs-tester"
DEFAULT_PROGRESS_INTERVAL = 10
TERRAFORM_ROOT_DIR = "test_data"


LOG = logging.getLogger(__name__)


setup_logging(LOG, debug=True)


# Pytest hooks
# More details on
# https://pytest-with-eric.com/hooks/pytest-hooks/#Test-Running-runtest-Hooks
def pytest_runtest_logstart(nodeid, location):
    """Log when a test starts."""
    LOG.info(f"TEST STARTED: {nodeid}")


def pytest_runtest_logfinish(nodeid, location):
    """Log when a test finishes."""
    LOG.info(f"TEST ENDED: {nodeid}")
