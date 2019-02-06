pragma Warnings (Off);
pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is


   GNAT_Version : constant String :=
                    "GNAT Version: Community 2018 (20180523-73)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  interfaces.c%s
   --  system%s
   --  ada.exceptions%s
   --  ada.exceptions%b
   --  interfaces.stm32%s
   --  interfaces.stm32.pwr%s
   --  system.bb%s
   --  system.bb.board_parameters%s
   --  system.bb.cpu_specific%s
   --  system.bb.mcu_parameters%s
   --  system.bb.mcu_parameters%b
   --  system.machine_code%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.semihosting%s
   --  system.semihosting%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.secondary_stack%b
   --  ada.tags%s
   --  ada.tags%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.unsigned_types%s
   --  interfaces.stm32.rcc%s
   --  system.stm32%s
   --  system.bb.parameters%s
   --  system.stm32%b
   --  system.multiprocessors%s
   --  system.bb.time%s
   --  system.bb.timing_events%s
   --  system.bb.protection%s
   --  system.bb.interrupts%s
   --  system.bb.board_support%s
   --  system.multiprocessors%b
   --  system.multiprocessors.spin_locks%s
   --  system.multiprocessors.spin_locks%b
   --  system.bb.cpu_primitives%s
   --  system.bb.cpu_primitives.context_switch_trigger%s
   --  system.bb.cpu_primitives.context_switch_trigger%b
   --  system.bb.board_support%b
   --  system.multiprocessors.fair_locks%s
   --  system.bb.threads%s
   --  system.bb.threads.queues%s
   --  system.bb.threads.queues%b
   --  system.bb.interrupts%b
   --  system.bb.cpu_primitives%b
   --  system.os_interface%s
   --  system.multiprocessors.fair_locks%b
   --  system.bb.time%b
   --  system.bb.timing_events%b
   --  system.bb.protection%b
   --  system.bb.threads%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.task_primitives.operations%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.real_time.delays%s
   --  ada.real_time.delays%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  display%s
   --  stm32f4%s
   --  stm32f4.dma%s
   --  stm32f4.dma%b
   --  stm32f4.fmc%s
   --  stm32f4.fmc%b
   --  stm32f4.rcc%s
   --  stm32f4.rcc%b
   --  stm32f4.gpio%s
   --  stm32f4.syscfg%s
   --  stm32f4.syscfg%b
   --  stm32f4.gpio%b
   --  stm32f4.i2c%s
   --  stm32f4.i2c%b
   --  stm32f4.spi%s
   --  stm32f4.spi%b
   --  stm32f4.timers%s
   --  stm32f4.timers%b
   --  stm32f4.usarts%s
   --  stm32f4.usarts%b
   --  stm32f429_discovery%s
   --  stm32f429_discovery%b
   --  stm32f4.sdram%s
   --  stm32f4.sdram%b
   --  stm32f4.lcd%s
   --  stm32f4.lcd%b
   --  stm32f4.touch_panel%s
   --  stm32f4.touch_panel%b
   --  screen_interface%s
   --  screen_interface%b
   --  fonts%s
   --  fonts%b
   --  display.basic%s
   --  display.basic%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;
