/** Section is row or column of controls
	Control is Gui element (Button,Text,Edit etc.) OR another Container (Tab, Groupbox)

*/
Class Section_vgui{

	Bbox	:= ""
	Controls	:= []
	_type	:= "control"	; type of container`s control "ui|container|control"
	_layout	:= "row"
	;_layout	:= "column"
	;_origin	:= {}	; origin of current section (Row|Column)
	;_pos	:= {}
	_next_pos	:= {}	; position of next control

	/** addControlToSection
	*/
	addControl($Control){
		;Dump($Control, "Control", 1)
		this.Controls.push(&$Control)
	}
	/** addToSection
	*/
	addContainer($Container){
		;Dump($Container, "Container", 1)
		this.Controls.push($Container)
	}
	/** Set layout of Control in section
		@param "row|column" $layout
	*/
	layout($layout){
		this._layout := $layout
		return this
	}
	/** type
	*/
	type($type){
		this._type := $type
		;Dump(this._type, "this._type", 1)
		return this
	}
	/** sort
	*/
	sortControls(){
		this.Bbox := new Bbox_vgui()
		For $c, $item in this.Controls
			this.moveControl($item)
		return this.Bbox
		;.remove(this._origin)
	}
	/** origin
	*/
	origin($origin){
		this._origin	:= $origin
		return this
	}
	/** next RENAME TO _next_pos
	*/
	nextPosition($next){
		this._next_pos	:= $next
		return this
	}
	/** control
	*/
	control($ctr_addr){
		return % Object($ctr_addr)
	}

	/** move Control to position of new section_vgui or behind previous control

	*/
	moveControl($item){
		$Control	:= isObject($item) ? this.control($item._ctr_addr) :this.control($item)

		$control_type	:= isObject($item)	? "groupbox" : "control"
		$hwnd_ctrl	:= $Control.hwnd

		this._next_pos.y += ($Control._Options.get("y")?$Control._Options.get("y"):0)   ;+ $_GUI_margin[this._type].y()
		this._next_pos.x += ($Control._Options.get("x")?$Control._Options.get("x"):0)   ;+ $_GUI_margin[this._type].y()

		$xp := this._next_pos.x
		$yp := this._next_pos.y

		$Control.move($xp, $yp)

		if($control_type=="groupbox")
			this._sortSectionsInGroupBox($item)

		this._addLabelTextAlign($Control)
		this._getNextControlPosition($Control)
	}
	/** _update CurrenPos
		@param hwnd $hwnd of Groupbox|Control
	*/
	_getNextControlPosition($Control){
		GuiControlGet, $control_pos, Pos, % $Control.hwnd

		;$label	:= $Control._label==1
		$label	:= $Control._is_label
		this._next_pos.x	+= this._layout != "row"	? 0 : $control_posW + ($label?5:$_GUI_margin[this._type].x()) ; Add margin after first element of section, remove margin if label
		this._next_pos.y	+= this._layout == "row"	? 0 : $control_posH + ($label?2:$_GUI_margin[this._type].y())

		this.Bbox.add({"x": $control_posX + $control_posW, "y": $control_posY + $control_posH})
	}
	/** Add text align right to label
		If layout of controls is row
	*/
	_addLabelTextAlign($Control){
		if($Control._is_label && this._layout == "row")
			$Control.GuiControl("+right")
	}
	/** _sortSectionsInGroupBox
	*/
	_sortSectionsInGroupBox($Container){
		;if(isObject($Container))
		$Container.setOriginByPosition()
				  .sortSections()
				  .resizeContainerToBBox()
	}
	/** _SectionsLast
	*/
	_ControlLast(){
		return % this.Controls[this.Controls.MaxIndex()]
	}



}
