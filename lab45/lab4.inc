/*****************************************************************************

		Copyright (c) 5091inc

 Project:  laba4
 FileName: LABA4.INC
 Purpose:  Project's global declarations
 Written by: Volkov Anton
 Comments:
*****************************************************************************/

constants
%BEGIN_CONST Project configuration constants, Code automatically updated!
  use_3dctrl = 1
%END_CONST

include "vpi.con"
include "vpi.dom"
include "vpi.pre"


/*****************************************************************************
			User's Declarations
*****************************************************************************/
global domains
  DB_SELECTOR = browselist_db	% For treebrowser tool
  FILE = fileselector1; fileselector2 % To be edited


include "lab4.pre"
