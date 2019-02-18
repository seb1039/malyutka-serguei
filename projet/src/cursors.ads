with Display.Basic; use Display.Basic;
with Affichage; use Affichage;

package Cursors is
   
   Cursor : Cursor_T := Get_Cursor_Status;
   
   type Swap_Cursor_T is record
      Dir : Direction;
      Is_Defined : Boolean;
   end record;
   
   
end Cursors;
