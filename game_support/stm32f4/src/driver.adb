------------------------------------------------------------------------------
--                                                                          --
--                             GNAT EXAMPLE                                 --
--                                                                          --
--             Copyright (C) 2014, Free Software Foundation, Inc.           --
--                                                                          --
-- GNAT is free software;  you can  redistribute it  and/or modify it under --
-- terms of the  GNU General Public License as published  by the Free Soft- --
-- ware  Foundation;  either version 3,  or (at your option) any later ver- --
-- sion.  GNAT is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                     --
--                                                                          --
-- As a special exception under Section 7 of GPL version 3, you are granted --
-- additional permissions described in the GCC Runtime Library Exception,   --
-- version 3.1, as published by the Free Software Foundation.               --
--                                                                          --
-- You should have received a copy of the GNU General Public License and    --
-- a copy of the GCC Runtime Library Exception along with this program;     --
-- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    --
-- <http://www.gnu.org/licenses/>.                                          --
--                                                                          --
-- GNAT was originally developed  by the GNAT team at  New York University. --
-- Extensive contributions were provided by Ada Core Technologies Inc.      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Real_Time;    use Ada.Real_Time;
with Screen_Interface;
with Railroad;

package body Driver is

   ----------------
   -- Controller --
   ----------------

   task body Controller is
      Period : constant Time_Span := Milliseconds (60);
      --  arbitrary, but directly affects how fast the trains move
      --  and how quickly the screen responds to touch

      Next_Start : Time := Clock + Seconds (1);

      Current  : Screen_Interface.Touch_State;
      Previous : Screen_Interface.Touch_State;
   begin
      delay until Next_Start;

      Screen_Interface.Initialize;
      Railroad.Initialize;

      Current  := Screen_Interface.Get_Touch_State;
      Previous := Current;

      loop
         Current := Screen_Interface.Get_Touch_State;

         if Current.Touch_Detected /= Previous.Touch_Detected then
            if Current.Touch_Detected then
               Railroad.On_Touch ((Current.X, Current.Y));
            end if;
            Previous := Current;
         end if;

         Railroad.Simulation_Step;
         Railroad.Draw;

         Next_Start := Next_Start + Period;
         delay until Next_Start;
      end loop;
   end Controller;

end Driver;
