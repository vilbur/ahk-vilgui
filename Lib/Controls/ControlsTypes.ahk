/** Class Controls
*/
Class ControlsTypes_vgui{

	_groupbox_layout := "row" ; store last used layout of group box for nex groupboxes

	/** GroupBox
	*/
	groupBox($value:=""){
		$groupbox := new GroupBox_vgui(this).value($value)
		$groupbox.layout(this._groupbox_layout)
		return %$groupbox%
	}
	/*---------------------------------------
		MAIN CONTROLS
	-----------------------------------------
	*/
	/** text
	*/
	text($value:=""){
		return % new Text_vgui(this).value($value)
	}
	/** button
	*/
	Button($value:=""){
		;MsgBox,262144,, Button,2
		return % new Button_vgui(this).value($value)
	}
	/** edit
	*/
	edit($value:=""){
		;MsgBox,262144,, edit,2
		return % new Edit_vgui(this).value($value)
	}
	/** checkbox
	*/
	checkbox($value:=""){
		return % new Checkbox_vgui(this).value($value)
	}
	/** listView
	*/
	listView($value:=""){
		return % new ListView_vgui(this).items($value)
	}
	/*---------------------------------------
		ITEM TYPES
	-----------------------------------------
	*/
	/** dropdown
	*/
	dropdown($items:=""){
		;return % new Dropdown_vgui(this).items($items)
		return % new Dropdown_vgui(this).items($items)
	}
	/** radio
	*/
	radio($items:=""){
		return % new Radio_vgui(this).items($items)
	}
	/** ListBox
	*/
	ListBox($items:=""){
		return % new ListBox_vgui(this).items($items)
	}
	/** ListBoxView
	*/
	ListBoxView($items:=""){
		return % new ListBoxView_vgui(this).items($items)
	}
	/*---------------------------------------
		PATH
	-----------------------------------------
	*/
	/** file
	*/
	file($value:=""){
		return % new File_vgui(this).value($value)
	}
	/** folder
	*/
	folder($value:=""){
		return % new Folder_vgui(this).value($value)
	}
	/*---------------------------------------
		LABEL
	-----------------------------------------
	*/
	/** label
	*/
	label($value:=""){
		return % new Label_vgui(this).value($value)
	}
	/** Keypress
	*/
	Keypress($value:=""){
		;MsgBox,262144,, Keypress,2
		;return % this.edit()
		;.type("Edit")
		;return % new Edit_vgui(this).value($value).type("Edit")
		return % new Keypress_vgui(this).value($value)
	}
}
