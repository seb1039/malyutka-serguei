package body Partie is

   task body Touch_Task is

      Current_cursor : Cursor_T := Get_Cursor_Status;

   begin
      Init_Partie;
      Dir : Direction;
      loop
         if Current_cursor.Pressed then
            -- 1) Regarder le sens du mouvement
            -- 2) Si sens reconnu
            --    i) Coup_Joue(Dir => Dir);
            --    ii) Print_Grill
            -- 3) Sinon null; -- et retour dans la boucle
            null;
         end if;
      end loop;
   end Touch_Task;

end Partie;
