-------------------------------------------------------------------------------
--                                                                           --
--  Ada Interface to the X Window System and Motif(tm)/Lesstif               --
--  Copyright (c) 1996-2000 Hans-Frieder Vogt                                --
--                                                                           --
--  Adabindx is free software; you can redistribute it and/or modify it      --
--  under the terms of the GNU General Public License as published by the    --
--  Free Software Foundation; either version 2 of the License, or (at your   --
--  option) any later version.                                               --
--                                                                           --
--  This program is distributed in the hope that it will be useful, but      --
--  WITHOUT ANY WARRANTY; without even the implied warranty of               --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     --
--  See the GNU General Public License for more details.                     --
--                                                                           --
--  You should have received a copy of the GNU General Public License        --
--  along with this program; if not, write to the                            --
--  Free Software Foundation, Inc.,                                          --
--  59 Temple Place - Suite 330,                                             --
--  Boston, MA 02111-1307, USA.                                              --
--                                                                           --
--  As a special exception, if other files instantiate generics from this    --
--  unit, or you link this unit with other files to produce an executable,   --
--  this unit does not by itself cause the resulting executable to be        --
--  covered by the GNU General Public License. This exception does not       --
--  however invalidate any other reasons why the executable file might be    --
--  covered by the GNU General Public License.                               --
--                                                                           --
--  X Window System is copyrighted by the X Consortium                       --
--  Motif(tm)       is copyrighted by the Open Software Foundation, Inc.     --
--                  and by The Open Group                                    --
--                                                                           --
--                                                                           --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--
-- HISTORY:
--          June 20, 1998 begin of history
--
-------------------------------------------------------------------------------

with Ada.Unchecked_Conversion,
     Interfaces.C,
     X_Toolkit.Internal;
package body Xm_Widgets.Primitive.CS_Text is
 
-- UseMotif2.0
--! 
--!    function To_Callback_Struct (Pointer : in Xt_Pointer)
--!       return Xm_CS_Text_Verify_Callback_Struct_Access is
--! 
--!       function To_CS is
--!          new To_Generic_Callback_Struct_Access (Xm_CS_Text_Verify_Callback_Struct,
--!             Xm_CS_Text_Verify_Callback_Struct_Access,
--!             Callback_Reason_Array_Type'(1 => Cr_Value_Changed,
--! 	                                2 => Cr_Focus,
--! 	                                3 => Cr_Losing_Focus,
--! 					4 => Cr_Modifying_Text_Value,
--! 				        5 => Cr_Moving_Insert_Cursor));
--!    begin
--!       return To_CS (Pointer);
--!    end To_Callback_Struct;
--!    pragma Inline (To_Callback_Struct);
--! 
--! 
--! 
--!    function Xm_Is_CS_Text (W : in Widget) return Boolean is
--!    begin
--!       return Xt_Is_Subclass (W, Xm_CS_Text_Widget_Class);
--!    end Xm_Is_CS_Text;
--! 
--! 
--!    function Xm_Create_CS_Text
--!      (Parent   : in  Widget;
--!       Name     : in  String;
--!       Arglist  : in  Arg_List := Null_Arg_List)
--!       return Widget is
--!       function XmCreateCSText
--!         (Parent : in Widget;
--!          Name   : in System.Address;
--!          Args   : in X_Toolkit.Internal.Arg_Rec_Access;
--!          Count  : in Cardinal)
--!          return Widget;
--!       pragma Import (C, XmCreateCSText, "XmCreateCSText");
--! 
--!       Name_String : constant Interfaces.C.Char_Array
--!                   := Interfaces.C.To_C (Name, Append_Nul => True);
--!    begin
--!       return XmCreateCSText (Parent,
--!                              Name_String'Address,
--!                              X_Toolkit.Internal.Hook (Arglist),
--!                              Cardinal (Length (Arglist)));
--!    end Xm_Create_CS_Text;
--! 
--! 
--!    function Xm_Create_Scrolled_CS_Text
--!      (Parent   : in  Widget;
--!       Name     : in  String;
--!       Arglist  : in  Arg_List := Null_Arg_List)
--!       return Widget is
--!       function XmCreateScrolledCSText
--!         (Parent : in Widget;
--!          Name   : in System.Address;
--!          Args   : in X_Toolkit.Internal.Arg_Rec_Access;
--!          Count  : in Cardinal)
--!          return Widget;
--!       pragma Import (C, XmCreateScrolledCSText, "XmCreateScrolledCSText");
--! 
--!       Name_String : constant Interfaces.C.Char_Array
--!                   := Interfaces.C.To_C (Name, Append_Nul => True);
--!    begin
--!       return XmCreateScrolledCSText (Parent,
--!                              Name_String'Address,
--!                              X_Toolkit.Internal.Hook (Arglist),
--!                              Cardinal (Length (Arglist)));
--!    end Xm_Create_Scrolled_CS_Text;
--! 
--! 
--!    procedure Xm_CS_Text_Read
--!      (W         : in     Widget;
--!       From_Pos  : in     Xm_Text_Position;
--!       To_Pos    : in     Xm_Text_Position;
--!       Value     :    out Xm_String) is
--!       procedure XmCSTextRead
--!         (W         : in  Widget;
--!          From_Pos  : in  Xm_Text_Position;
--!          To_Pos    : in  Xm_Text_Position;
--!          Value     : in  System.Address);
--!       pragma Import (C, XmCSTextRead, "XmCSTextRead");
--!    begin
--!       XmCSTextRead (W, From_Pos, To_Pos, Value'Address);
--!    end Xm_CS_Text_Read;
--!    pragma Inline (Xm_CS_Text_Read);
--! 
--! 
--!    function Xm_CS_Text_Get_Editable (W : in Widget) return Boolean is
--!       function XmCSTextGetEditable (W : in Widget) return Xt_Boolean;
--!       pragma Import (C, XmCSTextGetEditable, "XmCSTextGetEditable");
--!    begin
--!       return XmCSTextGetEditable (W) = Xt_Boolean'(True);
--!    end Xm_CS_Text_Get_Editable;
--! 
--! 
--!    procedure Xm_CS_Text_Set_Editable
--!      (W        : in Widget;
--!       Editable : in Boolean) is
--!       procedure XmCSTextSetEditable
--!         (W        : in Widget;
--!          Editable : in Xt_Boolean);
--!       pragma Import (C, XmCSTextSetEditable, "XmCSTextSetEditable");
--!    begin
--!       XmCSTextSetEditable (W, To_Xt_Boolean (Editable));
--!    end Xm_CS_Text_Set_Editable;
--! 
--! 
--!    procedure Xm_CS_Text_Get_Selection_Position
--!      (W      : in     Widget;
--!       Left   :    out Xm_Text_Position;
--!       Right  :    out Xm_Text_Position) is
--!       function XmCSTextGetSelectionPosition
--!         (W      : in Widget;
--!          Left   : in System.Address;
--!          Right  : in System.Address)
--! 	 return Xt_Boolean;
--!       pragma Import (C, XmCSTextGetSelectionPosition, "XmCSTextGetSelectionPosition");
--!    begin
--!       if XmCSTextGetSelectionPosition (W, Left'Address, Right'Address) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text;
--!       end if;
--!    end Xm_CS_Text_Get_Selection_Position;
--! 
--! 
--!    procedure Xm_CS_Text_Copy
--!      (W      : in Widget;
--!       Time   : in X_Lib.Server_Time) is
--!       function XmCSTextCopy
--!         (W      : in Widget;
--!          Time   : in X_Lib.Server_Time)
--! 	 return Xt_Boolean;
--!       pragma Import (C, XmCSTextCopy, "XmCSTextCopy");
--!    begin
--!       if XmCSTextCopy (W, Time) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text;
--!       end if;
--!    end Xm_CS_Text_Copy;
--! 
--! 
--!    procedure Xm_CS_Text_Cut
--!      (W      : in Widget;
--!       Time   : in X_Lib.Server_Time) is
--!       function XmCSTextCut
--!         (W      : in Widget;
--!          Time   : in X_Lib.Server_Time)
--! 	 return Xt_Boolean;
--!       pragma Import (C, XmCSTextCut, "XmCSTextCut");
--!    begin
--!       if XmCSTextCut (W, Time) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text;
--!       end if;
--!    end Xm_CS_Text_Cut;
--! 
--! 
--!    procedure Xm_CS_Text_Paste (W      : in Widget) is
--!       function XmCSTextPaste (W : in Widget) return Xt_Boolean;
--!       pragma Import (C, XmCSTextPaste, "XmCSTextPaste");
--!    begin
--!       if XmCSTextPaste (W) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text;
--!       end if;
--!    end Xm_CS_Text_Paste;
--! 
--! 
--!    procedure Xm_CS_Text_Remove (W      : in Widget) is
--!       function XmCSTextRemove (W      : in Widget) return Xt_Boolean;
--!       pragma Import (C, XmCSTextRemove, "XmCSTextRemove");
--!    begin
--!       if XmCSTextRemove (W) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text;
--!       end if;
--!    end Xm_CS_Text_Remove;
--! 
--! 
--!    procedure Xm_CS_Text_Pos_To_XY
--!      (W        : in     Widget;
--!       Pos      : in     Xm_Text_Position;
--!       X, Y     :    out X_Lib.Position) is
--!       function XmCSTextPosToXY
--!         (W        : in Widget;
--!          Pos      : in Xm_Text_Position;
--!          X, Y     : in System.Address)
--! 	 return Xt_Boolean;
--!       pragma Import (C, XmCSTextPosToXY, "XmCSTextPosToXY");
--!    begin
--!       if XmCSTextPosToXY (W, Pos, X'Address, Y'Address) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text;
--!       end if;
--!    end Xm_CS_Text_Pos_To_XY;
--! 
--! 
--!    procedure Xm_CS_String_Find_String
--!      (W         : in     Widget;
--!       Start     : in     Xm_Text_Position;
--!       Str       : in     String;
--!       Direction : in     Xm_String_Direction;
--!       Position  :    out Xm_Text_Position) is
--!       function XmCSStringFindString
--!         (W         : in  Widget;
--!          Start     : in  Xm_Text_Position;
--!          Str       : in  System.Address;
--!          Direction : in  Xm_String_Direction;
--!          Position  : in  System.Address)
--! 	 return Xt_Boolean;
--!       pragma Import (C, XmCSStringFindString, "XmCSTextFindString");
--!       Search_String : constant Interfaces.C.Char_Array
--!                     := Interfaces.C.To_C (Str, Append_Nul => True);
--!    begin
--!       if XmCSStringFindString (W, Start, Search_String'Address, Direction,
--!                                Position'Address) = Xt_Boolean'(False) then
--!          raise Xm_Error_CS_Text_Not_Found;
--!       end if;
--!    end Xm_CS_String_Find_String;
--!  
--! 
--!  
--!    procedure Xm_CS_Text_Set_Add_Mode
--!      (W         : in Widget;
--!       State     : in Boolean) is
--!       procedure XmCSTextSetAddMode
--!         (W         : in Widget;
--!          State     : in Xt_Boolean);
--!       pragma Import (C, XmCSTextSetAddMode, "XmCSTextSetAddMode");
--!    begin
--!       XmCSTextSetAddMode (W, To_Xt_Boolean (State));
--!    end Xm_CS_Text_Set_Add_Mode;
--! 
--! 
--!    function Xm_CS_Text_Paste_Link (W : in Widget) return Boolean is
--!       function XmCSTextPasteLink (W : in Widget) return Xt_Boolean;
--!       pragma Import (C, XmCSTextPasteLink, "XmCSTextPasteLink");
--!    begin
--!       return XmCSTextPasteLink (W) = Xt_Boolean'(True);
--!    end Xm_CS_Text_Paste_Link;
--! 
--! 
--!    function Xm_CS_Text_Copy_Link
--!      (W    : in Widget;
--!       Time : in X_Lib.Server_Time) return Boolean is
--!       function XmCSTextCopyLink
--!         (W    : in Widget;
--!          Time : in X_Lib.Server_Time) return Xt_Boolean;
--!       pragma Import (C, XmCSTextCopyLink, "XmCSTextCopyLink");
--!    begin
--!       return XmCSTextCopyLink (W, Time) = Xt_Boolean'(True);
--!    end Xm_CS_Text_Copy_Link;
--! 
--! 
--!    function To_Integer is
--!       new Ada.Unchecked_Conversion (Edit_Mode, Short_Short_Unsigned);
--! 
--!    procedure Append_Set (List  : in out Arg_List;
--!                          Name  : in     Xt_N_Resource_String;
--!                          Value : in     Edit_Mode) is
--!    begin
--!       Append_Set (List   => List,
--!                   Name   => Name,
--!                   Value  => Integer (To_Integer (Value)));
--!    end Append_Set;
--!    pragma Inline (Append_Set);
--! 
--! 
--!    procedure Append_Get (List  : in out Arg_List;
--!                          Name  : in     Xt_N_Resource_String;
--!                          Value :    out Edit_Mode) is
--!    begin
--!       Append_Set (List   => List,
--!                   Name   => Name,
--!                   Value  => Value'Address);
--!    end Append_Get;
--!    pragma Inline (Append_Get);
--! 
--! 
-- EndMotif2.0

end Xm_Widgets.Primitive.CS_Text;
