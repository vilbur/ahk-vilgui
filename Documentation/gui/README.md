### Create gui

## Methods
__show__( string __$options__ )  
// show gui  

__close__()  
//  close gui window, let script running  

__exit__()  
// exit script  

__submit__()  
// submit gui  

## Options methods

__options__( string __$options__ )  
// wrapper for [ahk function](https://autohotkey.com/docs/commands/Gui.htm#Options)  
// @param __$options__ strings from documentation  

__size__( int __$width__, int __$height__ )  
// set size of gui  

__autosize__()  
// resize GUI by its content, gui is autosized on init  

__resizeable__( boolean __$toggle__:=true )  
//  make gui resizable, default is unresizable gui  

__minSize__( int __$width__:=128, int __$height__:=128 )  
// set minimal size of gui  

__maxSize__( int __$width__, int __$height__ )  
// set maximal size of gui  

__fixedWidth__( int __$width__ )  
// set fixed with of gui  

__alwaysOnTop__( boolean __$toggle__:=true )  
// set window always on top  

__center__( string __$xy__ )  
// center gui on display  
// @param __$xy__ "x|y"  


``` php  

/* GUI setup 1  
*/  
$Gui1 := new VilGUIv3("Gui1")  

$Gui1.show()  
	.alwaysOnTop()	; default false  
	.resizeable()	; default unresizable  
	.minSize("500", "500" )	; min size of gui if resizable  
	.maxSize("1000", "1000" )	; max size of gui if resizable  
	.size(360, 720)	; initial size of gui ( width, height )  
	.center("x")	; center to monitor on init horizontal  
	.center("y")	; center to monitor on init vertically  

/* GUI setup 2  
*/  
$Gui2 := new VilGUIv3("Gui2")  

$Gui2.show()  
	.resizeable()  
	.autosize()	; autoresize gui by content  
	.fixedWidth()	; with of gui is fixed  
```  