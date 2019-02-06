pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E005 : Short_Integer; pragma Import (Ada, E005, "ada__real_time_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "stm32f4__fmc_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "stm32f4__i2c_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "stm32f4__spi_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "stm32f429_discovery_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "stm32f4__sdram_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "stm32f4__lcd_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "stm32f4__touch_panel_E");
   E077 : Short_Integer; pragma Import (Ada, E077, "screen_interface_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "fonts_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "display__basic_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      Ada.Real_Time'Elab_Body;
      E005 := E005 + 1;
      STM32F4.FMC'ELAB_SPEC;
      E103 := E103 + 1;
      E087 := E087 + 1;
      E097 := E097 + 1;
      Stm32f429_Discovery'Elab_Spec;
      Stm32f429_Discovery'Elab_Body;
      E093 := E093 + 1;
      E091 := E091 + 1;
      STM32F4.LCD'ELAB_SPEC;
      E089 := E089 + 1;
      E079 := E079 + 1;
      E077 := E077 + 1;
      E074 := E074 + 1;
      Display.Basic'Elab_Body;
      E068 := E068 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\obj\display.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-dma.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-fmc.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-rcc.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-syscfg.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-gpio.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-i2c.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-spi.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-timers.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-usarts.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f429_discovery.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-sdram.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-lcd.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\stm32f4-touch_panel.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\screen_interface.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\fonts.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\obj\display-basic.o
   --   C:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\projet\obj\main.o
   --   -LC:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\projet\obj\
   --   -LC:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\projet\obj\
   --   -LC:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\obj\
   --   -LC:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\gnat_sdl\obj\
   --   -LC:\Users\Milie\Desktop\EIDD\3A\TempsReelADA\base\game_support\stm32f4\obj\
   --   -LC:\gnat\2018-arm-elf\arm-eabi\lib\gnat\ravenscar-sfp-stm32f429disco\adalib\
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;
