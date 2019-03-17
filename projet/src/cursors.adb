package body Cursors is
   
   procedure Update_Cursor is
   begin
      Current_Cursor := Get_Cursor_Status;
   end Update_Cursor;

   function Cursor_Is_Pressed return Boolean is
   begin
      return Current_Cursor.Pressed;
   end Cursor_Is_Pressed;

   function Get_Cursor_Direction return Direction is
      pos : Screen_Point := Get_Cursor_Position;
   begin
      if pos.X < 0 and pos.Y > 0 then
         if abs pos.X < pos.Y then
            return Gauche;
         else
            return Haut;
         end if;
      elsif pos.X > 0 and pos.Y > 0 then
         if pos.X < pos.Y then
            return Haut;
         else
            return Droite;
         end if;
      elsif pos.X > 0 and pos.Y < 0 then
         if pos.X < abs pos.Y then
            return Bas;
         else
            return Droite;
         end if;
      else
         if pos.X < pos.Y then
            return Gauche;
         else
            return Bas;
         end if;
      end if;
   end Get_Cursor_Direction;

   function Get_Cursor_Position return Screen_Point is
      pos : Screen_Point;
   begin
      Current_Cursor := Get_Cursor_Status;
      pos.X := Current_Cursor.Position.X - 100;
      pos.Y := -(Current_Cursor.Position.Y - 150);
      return pos;
   end Get_Cursor_Position;

end Cursors;
