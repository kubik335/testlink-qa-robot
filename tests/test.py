#! /usr/bin/env python

"""Runner Script for Robot Framework SeleniumLibrary

Tests are run by giving a path to the tests to be executed as an argument to
this script. Possible Robot Framework options are given before the path.

Examples:
  tests.py login_tests                        # Run all tests in a directory
  tests.py login_tests/valid_login.text       # Run tests in a specific file
  tests.py --variable BROWSER:IE login_tests  # Override variable
  tests.py -v BROWSER:IE -v DELAY:0.25 login_tests

By default tests are executed with Firefox browser, but this can be changed
by overriding the `BROWSER` variable as illustrated above. Similarly it is
possible to slow down the test execution by overriding the `DELAY` variable
with a non-zero value.

Running the tests requires that Robot Framework, Selenium2Library, Python, and
Java to be installed.
"""

import os
import sys
from tempfile import TemporaryFile
from subprocess import Popen, call, STDOUT

try:
    import Selenium2Library
except ImportError, e:
    print 'Importing Selenium2Library module failed (%s).' % e
    print 'Please make sure you have Selenium2Library properly installed.'
    print 'See INSTALL.rst for troubleshooting information.'
    sys.exit(1)


ROOT = os.path.dirname(os.path.abspath(__file__))
DEMOAPP = os.path.join(ROOT, 'demoapp', 'server.py')


def run_tests(args):
    #start_demo_application()
    call(['pybot'] + args, shell=(os.sep == '\\'))
    #stop_demo_application()

def start_demo_application():
    Popen(['python', DEMOAPP, 'start'], stdout=TemporaryFile(), stderr=STDOUT)

def stop_demo_application():
    call(['python', DEMOAPP, 'stop'], stdout=TemporaryFile(), stderr=STDOUT)

def print_help():
    print __doc__

def print_usage():
    print 'Usage: tests.py [options] datasource'
    print '   or: tests.py demoapp start|stop'
    print '   or: tests.py help'


if __name__ == '__main__':
    action = {'demoapp-start': start_demo_application,
              'demoapp-stop': stop_demo_application,
              'help': print_help,
              '': print_usage}.get('-'.join(sys.argv[1:]))
    if action:
        action()
    else:
        run_tests(sys.argv[1:])

