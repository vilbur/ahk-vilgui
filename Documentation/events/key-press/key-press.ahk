#SingleInstance force
#Include %A_LineFile%\..\..\..\gui\lib\gui-construct.ahk

$Gui.Events.Key
	.onEscape("callbackKeyPress", "onEscape param", "Custom") 
	.onEscape("close")
	
	.onEnter("callbackKeyPress", "onEnter param", "Custom") 
	.onEnter("close")

	.on("Space", "callbackKeyPress", "on Space param", "Custom") 

/** callbackKeyPress
*/
callbackKeyPress($Event:="", $params*)
{
	MsgBox,262144,callbackKeyPress, % $params[1] "`n" $params[2] "`n" $params[3],5
	$Event.message()
}


#Include %A_LineFile%\..\..\..\gui\lib\gui-create.ahk