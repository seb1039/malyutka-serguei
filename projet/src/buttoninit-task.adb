package body ButtonInit.Task is

   task body Button_Monitor is
      
   begin
      loop
         My_Button.Button.Wait_Press;
         ReverseDir;
         ChangeColor;
      end loop;
   end Button_Monitor;

end ButtonInit.Task;
