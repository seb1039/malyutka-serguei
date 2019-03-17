with ButtonInit; use ButtonInit;

package body ButtonInit.InfinityLoop is

   task body Button_Monitor is

   begin
      loop
         Button.Wait_Press;
         Init_Partie;
      end loop;
   end Button_Monitor;

end ButtonInit.InfinityLoop;
