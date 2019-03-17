-----------------------------------------------------------------------
--                              Ada Labs                             --
--                                                                   --
--                 Copyright (C) 2008-2019, AdaCore                  --
--                                                                   --
-- Labs is free  software; you can redistribute it and/or modify  it --
-- under the terms of the GNU General Public License as published by --
-- the Free Software Foundation; either version 2 of the License, or --
-- (at your option) any later version.                               --
--                                                                   --
-- This program is  distributed in the hope that it will be  useful, --
-- but  WITHOUT ANY WARRANTY;  without even the  implied warranty of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details. You should have received --
-- a copy of the GNU General Public License along with this program; --
-- if not,  write to the  Free Software Foundation, Inc.,  59 Temple --
-- Place - Suite 330, Boston, MA 02111-1307, USA.                    --
-----------------------------------------------------------------------

with Display;       use Display;
with Display.Basic; use Display.Basic;
with Ada.Real_Time; use Ada.Real_Time;
with Affichage; use Affichage;
with Cursors; use Cursors;
with ButtonInit; use ButtonInit;
with ButtonInit.InfinityLoop; use ButtonInit.InfinityLoop;
with dmqh; use dmqh;

--with Last_Chance_Handler; pragma Unreferenced (Last_Chance_Handler);

procedure Main is
   Width       : constant := 240.0;
   Height      : constant := 320.0;

   Next    : Time;
   Period  : constant Time_Span := Milliseconds (40);

   --  reference to the application window
   Window : Window_Id;

   --  reference to the graphical canvas associated with the application window
   Canvas : Canvas_Id;

   --New
   My_Cursor : Cursor_T;

begin
   Window :=
     Create_Window
       (Width  => Integer (Width),
        Height => Integer (Height),
        Name   => "Projet 2048");
   Canvas := Get_Canvas (Window);

   Next := Clock + Period;

   --On initialise la partie
   Init_Partie;

   --Tant qu'on n'est pas mort, on joue
   while not Is_Killed loop

      -- Mise à jour du Curseur
      Update_Cursor;
      if Cursor_Is_Pressed then

         Swap_Buffers (Window);
         Coup_Joue(Get_Cursor_Direction);

         -- 1) Affichage de la grille
         -- 2) Affichage du score

         Init_Body
           (B            => c11,
            Cases        => My_Grill(1,1),
            X            => -106.0,
            Y            => -104.0);

         Init_Body
           (B            => c21,
            Cases        => My_Grill(2,1),
            X            => -53.0,
            Y            => -104.0);

         Init_Body
           (B            => c31,
            Cases        => My_Grill(3,1),
            X            => 0.0,
            Y            => -104.0);

         Init_Body
           (B            => c41,
            Cases        => My_Grill(4,1),
            X            => 53.0,
            Y            => -104.0);

         Init_Body
           (B            => c12,
            Cases        => My_Grill(1,2),
            X            => -106.0,
            Y            => -52.0);

         Init_Body
           (B            => c22,
            Cases        => My_Grill(2,2),
            X            => -53.0,
            Y            => -52.0);

         Init_Body
           (B            => c32,
            Cases        => My_Grill(3,2),
            X            => 0.0,
            Y            => -52.0);

         Init_Body
           (B            => c42,
            Cases        => My_Grill(4,2),
            X            => 53.0,
            Y            => -52.0);

         Init_Body
           (B            => c13,
            Cases        => My_Grill(1,3),
            X            => -106.0,
            Y            => 0.0);

         Init_Body
           (B            => c23,
            Cases        => My_Grill(2,3),
            X            => -53.0,
            Y            => 0.0);

         Init_Body
           (B            => c33,
            Cases        => My_Grill(3,3),
            X            => 0.0,
            Y            => 0.0);

         Init_Body
           (B            => c43,
            Cases        => My_Grill(4,3),
            X            => 53.0,
            Y            => 0.0);

         Init_Body
           (B            => c14,
            Cases        => My_Grill(1,4),
            X            => -106.0,
            Y            => 52.0);

         Init_Body
           (B            => c24,
            Cases        => My_Grill(2,4),
            X            => -53.0,
            Y            => 52.0);

         Init_Body
           (B            => c34,
            Cases        => My_Grill(3,4),
            X            => 0.0,
            Y            => 52.0);

         Init_Body
           (B            => c44,
            Cases        => My_Grill(4,4),
            X            => 53.0,
            Y            => 52.0);

      end if;

      delay until Next;
      Next := Next + Period;

   end loop;

end Main;
