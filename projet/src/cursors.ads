with Display.Basic; use Display.Basic;
with Affichage; use Affichage;

package Cursors is
   
   procedure Update_Cursor;
   function Cursor_Is_Pressed return Boolean;
   function Get_Cursor_Direction return Direction;
   
private
   
   Current_Cursor : Cursor_T;
   function Get_Cursor_Position return Screen_Point;
   
end Cursors;
