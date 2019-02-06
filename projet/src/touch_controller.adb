with Display.Basic; use Display.Basic;

package body touch_controller is

   task body touch_monitor is
      
   begin
      My_Cursor := Get_Cursor_Status;
      if My_Cursor.Pressed then
         Draw_Sphere(Canvas   => Canvas,
                     Position => (0.0,0.0,0.0),
                     Radius   => 7.5,
                     Color    => Blue);
      end if;
   end touch_monitor ;
   
end touch_controller;
