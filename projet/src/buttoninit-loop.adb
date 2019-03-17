with Affichage; use Affichage;

package body ButtonInit.Loop is

      task body Button_Monitor is
      begin
         loop
            Button.Wait_Press;
            Init_Partie;
         end loop
      end Button_Monitor;

   end ButtonInit.Loop;
