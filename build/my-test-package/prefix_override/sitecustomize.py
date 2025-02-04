import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/home/christian/dev_ws/src/kridt-bot/install/my-test-package'
