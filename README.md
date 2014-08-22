Install the opentxs library with the Python binding
----------------------

    $ cmake .. -DPYTHON=ON
    $ make -j4
    $ sudo make install


Setting up Robotframework
----------------------
Install Robot Framework:

    $ pip install robotframework


Install the Robot Framework IDE (optional):

    $ pip install robotframework-ride 


Run tests
----------------------

### Usign RIDE (recommended)
Start RIDE, open directory, tick the tests you want to run, click run.

### From command line

Execute all tests:
    $ pybot .

