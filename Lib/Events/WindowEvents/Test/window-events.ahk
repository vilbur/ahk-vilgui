#SingleInstance force
#Include %A_LineFile%\..\..\..\..\Gui\Test\gui-setup\gui-construct.ahk

$Gui.Events.Window
	.on("created",	"callbackWindow", "On created")
	.on("close",	"callbackWindow", "On close")	
	.on("focus",	"callbackWindow", "On focus")
	.on("blur",	"callbackWindow", "On blur")
	
	.on("size",	"callbackWindow", "On size")
	.on("move",	"callbackWindow", "On move")		
	.on("sizedmoved",	"callbackWindow", "On sizedmoved")	
	

/** callbackWindow
*/
callbackWindow($Event:="", $params*)
{
	$Event.message(1)
}

#Include %A_LineFile%\..\..\..\..\Gui\Test\gui-setup\gui-create.ahk