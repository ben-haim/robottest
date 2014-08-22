import os
import sys
import atexit

import opentxs

        
# OT MADE EASY  (high-level API)
#
# This object handles all the request/response going on with
# any servers, plus all the retries and synchronization. It's
# the 'High-level API'. See OT_ME.h for the complete set of
# high-level API functions.
#global OTME = None lclc

class opentxsRobot:
    def __init__(self):
        opentxs.OTAPI_Wrap_AppInit()
        opentxs.OTAPI_Wrap_LoadWallet()
        
        self._status = ''
    
    
    ################## Client Side Only Tests ##################
    def count_server_contracts(self):
            return opentxs.OTAPI_Wrap_GetServerCount()

    ################## Client-Server Tests    ##################
#lclc EXPORT bool    make_sure_enough_trans_nums (const long nNumberNeeded, const std::string &SERVER_ID, const std::string &NYM_ID)

    def register_nym(self, server, nym):
            OTME = opentxs.OT_ME()
            return OTME.register_nym(str(server), str(nym)) #returns string

    def check_user(self, server, my_nym, his_nym):  ## get users public key
            OTME = opentxs.OT_ME()
            return OTME.check_user(str(server), str(my_nym), str(his_nym)) #returns int

    def create_pseudonym(self, keybits, nym_id_source, alt_location):
            OTME = opentxs.OT_ME()
            return OTME.create_pseudonym(int(keybits), str(nym_id_source), str(alt_location)) #returns string


    ################## Verify Message Answer  ##################
    def verify_message(self, msg):
            OTME = opentxs.OT_ME()
            return str(OTME.VerifyMessageSuccess(msg))
            
            #Error cases (A successful message can still contain a failed transaction.):
            #if result < 0:
            #    print 'Error in check nym. Is the server running? Is the test data in ~/.ot ?'
            #elif result == 0:
            #    print 'Failure in check nym. Is the test data in ~/.ot ?'
            #elif result == 1:
            #    print 'Success in check nym.'
            #else:
            #    print 'Unexpected return value in check nym.'


    def status_should_be(self, expected_status):
        if expected_status != self._status:
            raise AssertionError("Expected status to be '%s' but was '%s'"
                                  % (expected_status, self._status))


def exit_handler():
    opentxs.OTAPI_Wrap_AppCleanup()

atexit.register(exit_handler)
