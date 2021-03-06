-----------------------------------------------------------------------------
--  This file contains the body, please refer to specification (.ads file)
-----------------------------------------------------------------------------

with Interfaces;
with GLUT.Windows;              use GLUT.Windows;
with Ada.Characters.Handling;   use Ada.Characters.Handling;
with System;
with Ada.Unchecked_Conversion;

package body GLUT.Devices is

   -- current_Window : - for accessing the current GLUT window
   --                  - used by GLUT callbacks to determine the Window to which a callback event relates.
   --

   function current_Window return Windows.Window_view
   is
      function to_Window is new Ada.Unchecked_Conversion (System.Address, Windows.Window_view);
   begin
      return to_Window (GLUT.GetWindowData);
   end current_Window;

   -- Keyboard
   --

   function current_Keyboard return p_Keyboard
   is
      the_current_Window : constant Windows.Window_view := current_Window;
   begin
      if the_current_Window = null then
         return default_Keyboard'Access;
      else
         return GLUT.Windows.Keyboard (the_current_Window);
      end if;
   end current_Keyboard;

  procedure Affect_modif_key( modif_code: Integer ) is
    use Interfaces;
    m: constant Unsigned_32:= Unsigned_32( modif_code );
  begin
    current_Keyboard.modif_set( GLUT.ACTIVE_SHIFT ):= (m and GLUT.ACTIVE_SHIFT) /= 0;
    current_Keyboard.modif_set( GLUT.ACTIVE_CTRL  ):= (m and GLUT.ACTIVE_CTRL) /= 0;
    current_Keyboard.modif_set( GLUT.ACTIVE_ALT   ):= (m and GLUT.ACTIVE_ALT) /= 0;
  end Affect_modif_key;

  procedure Update_modifier_keys is
  begin
    Affect_modif_key( GLUT.GetModifiers );
    --  During a callback, GetModifiers may be called
    --  to determine the state of modifier keys
    --  when the keystroke generating the callback occurred.
  end Update_modifier_keys;

  -- GLUT Callback procedures --

  procedure Key( k: GLUT.Key_type; x,y: Integer ) is
  pragma Unreferenced (x, y);

  begin
    current_Keyboard.normal_set( To_Upper(Character'Val(k)) ):= True;   -- key k is pressed
    Update_modifier_keys;
  end Key;

  procedure Key_up( k: GLUT.Key_type; x,y: Integer ) is
  pragma Unreferenced (x, y);
  begin
    current_Keyboard.normal_set( To_Upper(Character'Val(k)) ):= False;  -- key k is unpressed
    Update_modifier_keys;
  end Key_up;

  procedure Special_key( k: Integer; x,y: Integer ) is
  pragma Unreferenced (x, y);
  begin
    current_Keyboard.special_set( k ):= True;  -- key k is pressed
    Update_modifier_keys;
  end Special_key;

  procedure Special_key_up( k: Integer; x,y: Integer ) is
  pragma Unreferenced (x, y);
  begin
    current_Keyboard.special_set( k ):= False; -- key k is unpressed
    Update_modifier_keys;
  end Special_key_up;

   -- Mouse
   --

  function current_Mouse return p_Mouse
  is
     the_current_Window : constant Windows.Window_view := current_Window;
  begin
     if the_current_Window = null then
        return default_Mouse'Access;
     else
        return GLUT.Windows.Mouse (the_current_Window);
     end if;
  end current_Mouse;

  procedure Mouse_Event( button, state, x,y: Integer ) is
  -- When a user presses and releases mouse buttons in the window,
  -- each press and each release generates a mouse callback.
  begin
    current_Mouse.mx:= x;
    current_Mouse.my:= y;
    if button in current_Mouse.button_state'Range then -- skip extra buttons (wheel, etc.)
      current_Mouse.button_state( button ) := state = GLUT.DOWN; -- Joli, non ?
    end if;
    Update_modifier_keys;
  end Mouse_Event;

  procedure Motion( x, y: Integer ) is
  --  The motion callback for a window is called when the mouse moves within the
  --  window while one or more mouse buttons are pressed.
  begin
    current_Mouse.mx:= x;
    current_Mouse.my:= y;
  end Motion;

  procedure Passive_Motion( x, y: Integer ) is
  --  The passive motion callback for a window is called when
  --  the mouse moves within the window while no mouse buttons are pressed.
  begin
    current_Mouse.mx:= x;
    current_Mouse.my:= y;
  end Passive_Motion;

   -- Initialize
   --

  procedure Initialize is
  begin
    IgnoreKeyRepeat(1);
    KeyboardFunc(      Key'Address                   );
    KeyboardUpFunc(    Key_up'Address                );
    SpecialFunc(       Special_key'Address           );
    SpecialUpFunc(     Special_key_up'Address        );
    MouseFunc(         Mouse_Event'Address           );
    MotionFunc(        Motion'Address                );
    PassiveMotionFunc( Passive_Motion'Address        );
  end Initialize;

   -- User input management
   --

  function Strike_once( c: Character;
                        kb : access Keyboard:= default_Keyboard'Access) return Boolean
  is
  begin
    if kb.normal_set(c) then
      if kb.normal_set_mem(c) then
        return False; -- already a reported strike
      else
        kb.normal_set_mem(c):= True; -- key is now recorded as pressed
        return True;
      end if;
    else
      kb.normal_set_mem(c):= False; -- unpressed -> next strike allowed
      return False;
    end if;
  end Strike_once;

  function Strike_once( special: Integer;
                        kb : access Keyboard:= default_Keyboard'Access) return Boolean
  is
  begin
    if special not in Special_key_set'Range then
      return False;
    else
      if kb.special_set(special) then
        if kb.special_set_mem(special) then
          return False; -- already a reported strike
        else
          kb.special_set_mem(special):= True; -- key is now recorded as pressed
          return True;
        end if;
      else
        kb.special_set_mem(special):= False; -- unpressed -> next strike allowed
        return False;
      end if;
    end if;
  end Strike_once;

end GLUT.Devices;
