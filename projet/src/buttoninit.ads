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
--                                                                          --
--                                                                          --
--                                                                          --
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

--  This file provides declarations for the blue user button on the STM32F4
--  Discovery board from ST Microelectronics.

with Ada.Interrupts.Names;
with Ada.Real_Time; use Ada.Real_Time;
with System;

package ButtonInit is
   pragma Elaborate_Body;

   --  Implement Button as a protected object with one entry Wait_Press that
   --  will be used to know when the button has been pressed thanks to a
   --  boolean barrier.
   --  The button interrupt is Ada.Interrupts.Names.EXTI0_Interrupt
   protected Button is

      procedure Interrupt_Handler;
      pragma Attach_Handler (Interrupt_Handler,
                             Ada.Interrupts.Names.EXTI0_Interrupt);

      entry Wait_Press;

   private
      Is_Handled : Boolean := False;

   end Button;

end ButtonInit;