------------------------------------------------------------------------------
--                                                                          --
--                Hardware Abstraction Layer for STM32 Targets              --
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

--  This file provides definitions for the STM32F4 (ARM Cortex M4F
--  from ST Microelectronics) Inter-Integrated Circuit (I2C) facility.

package STM32F4.I2C is

   type I2C_Port is limited private;

   type I2C_Device_Mode is
     (I2C_Mode,
      SMBusDevice_Mode,
      SMBusHost_Mode);

   for I2C_Device_Mode use
     (I2C_Mode         => 16#0000#,
      SMBusDevice_Mode => 16#0002#,
      SMBusHost_Mode   => 16#000A#);

   type I2C_Duty_Cycle is
     (DutyCycle_16_9,
      DutyCycle_2);

   for I2C_Duty_Cycle use
     (DutyCycle_16_9 => 16#4000#,
      DutyCycle_2    => 16#BFFF#);

   type I2C_Acknowledgement is (Ack_Disable, Ack_Enable);

   for I2C_Acknowledgement use
     (Ack_Enable  => 16#0400#,
      Ack_Disable => 16#0000#);

   type I2C_Direction is (Transmitter, Receiver);

   type I2C_Acknowledge_Address is
     (AcknowledgedAddress_7bit,
      AcknowledgedAddress_10bit);

   for I2C_Acknowledge_Address use
     (AcknowledgedAddress_7bit  => 16#4000#,
      AcknowledgedAddress_10bit => 16#C000#);

   procedure Configure
     (Port        : in out I2C_Port;
      Clock_Speed : Word;
      Mode        : I2C_Device_Mode;
      Duty_Cycle  : I2C_Duty_Cycle;
      Own_Address : Half_Word;
      Ack         : I2C_Acknowledgement;
      Ack_Address : I2C_Acknowledge_Address)
     with Post => Port_Enabled (Port);

   type I2C_State is (Enabled, Disabled);

   procedure Set_State (Port : in out I2C_Port; State : I2C_State);

   function Port_Enabled (Port : I2C_Port) return Boolean;

   procedure Generate_Start (Port : in out I2C_Port; State : I2C_State);

   procedure Generate_Stop (Port : in out I2C_Port; State : I2C_State);

   procedure Send_7Bit_Address
     (Port      : in out I2C_Port;
      Address   : Byte;
      Direction : I2C_Direction);

   procedure Send_Data (Port : in out I2C_Port; Data : Byte);

   function Read_Data (Port : I2C_Port) return Byte;

   type I2C_Status_Flag is
     (Start_Bit,
      Address_Sent,
      Byte_Transfer_Finished,
      Address_Sent_10bit,
      Stop_Detection,
      Rx_Data_Register_Not_Empty,
      Tx_Data_Register_Empty,
      Bus_Error,
      Arbitration_Lost,
      Ack_Failure,
      Overrun, -- also for underrun
      Packet_Error,
      Timeout,
      SMB_Alert,
      Master_Slave_Mode,
      Busy,
      Transmitter_Receiver_Mode,
      General_Call,
      SMB_Default,
      SMB_Host,
      Dual_Flag);

   function Status (Port : I2C_Port; Flag : I2C_Status_Flag) return Boolean;

   subtype Clearable_I2C_Status_Flag is
     I2C_Status_Flag range Bus_Error .. SMB_Alert;

   procedure Clear_Status
     (Port   : in out I2C_Port;
      Target : Clearable_I2C_Status_Flag);

   procedure Clear_Address_Sent_Status (Port : in out I2C_Port);

   procedure Clear_Stop_Detection_Status (Port : in out I2C_Port);

   procedure Wait_For_State
     (Port     : I2C_Port;
      Queried  : I2C_Status_Flag;
      State    : I2C_State;
      Time_Out : Natural := 1_000_000);  -- milliseconds

   I2C_Timeout : exception;
   --  Raised by Wait_For_Flag

   procedure Set_Ack_Config (Port : in out I2C_Port; State : I2C_State);

   type I2C_Nack_Position is (Next, Current);

   procedure Set_Nack_Config (Port : in out I2C_Port; Pos : I2C_Nack_Position);

   procedure Start
     (Port      : in out I2C_Port;
      Address   : Byte;
      Direction : I2C_Direction);

   function Read_Ack (Port : in out I2C_Port) return Byte;

   function Read_Nack (Port : in out I2C_Port) return Byte;

   procedure Write (Port : in out I2C_Port; Data : Byte);

   procedure Stop (Port : in out I2C_Port);

   type I2C_Interrupt is
     (Error_Interrupt,
      Event_Interrupt,
      Buffer_Interrupt);

   for I2C_Interrupt use
     (Error_Interrupt   => 16#0100#,
      Event_Interrupt   => 16#0200#,
      Buffer_Interrupt  => 16#0400#);

   procedure Enable_Interrupt
     (Port   : in out I2C_Port;
      Source : I2C_Interrupt)
     with Post => Enabled (Port, Source);

   procedure Disable_Interrupt
     (Port   : in out I2C_Port;
      Source : I2C_Interrupt)
     with Post => not Enabled (Port, Source);

   function Enabled
     (Port   : in out I2C_Port;
      Source : I2C_Interrupt)
     return Boolean;

private

   type I2C_Port is record
      CR1       : Half_Word;
      Reserved1 : Half_Word;
      CR2       : Half_Word;
      Reserved2 : Half_Word;
      OAR1      : Half_Word;
      Reserved3 : Half_Word;
      OAR2      : Half_Word;
      Reserved4 : Half_Word;
      DR        : Half_Word;
      Reserved5 : Half_Word;
      SR1       : Half_Word;
      Reserved6 : Half_Word;
      SR2       : Half_Word;
      Reserved7 : Half_Word;
      CCR       : Half_Word;
      Reserved8 : Half_Word;
      TRISE     : Half_Word;
      Reserved9 : Half_Word;
      FLTR      : Half_Word;
      Reserved0 : Half_Word;
   end record
     with Volatile, Size => 20 * 16;

   for I2C_Port use record
      CR1       at 0  range 0 .. 15;
      Reserved1 at 2  range 0 .. 15;
      CR2       at 4  range 0 .. 15;
      Reserved2 at 6  range 0 .. 15;
      OAR1      at 8  range 0 .. 15;
      Reserved3 at 10 range 0 .. 15;
      OAR2      at 12 range 0 .. 15;
      Reserved4 at 14 range 0 .. 15;
      DR        at 16 range 0 .. 15;
      Reserved5 at 18 range 0 .. 15;
      SR1       at 20 range 0 .. 15;
      Reserved6 at 22 range 0 .. 15;
      SR2       at 24 range 0 .. 15;
      Reserved7 at 26 range 0 .. 15;
      CCR       at 28 range 0 .. 15;
      Reserved8 at 30 range 0 .. 15;
      TRISE     at 32 range 0 .. 15;
      Reserved9 at 34 range 0 .. 15;
      FLTR      at 36 range 0 .. 15;
      Reserved0 at 38 range 0 .. 15;
   end record;

   CR1_PE        : constant := 16#0001#; --  Peripheral Enable
   CR1_SMBUS     : constant := 16#0002#; --  SMBus Mode
   CR1_SMBTYPE   : constant := 16#0008#; --  SMBus Type
   CR1_ENARP     : constant := 16#0010#; --  ARP Enable
   CR1_ENPEC     : constant := 16#0020#; --  PEC Enable
   CR1_ENGC      : constant := 16#0040#; --  General Call Enable
   CR1_NOSTRETCH : constant := 16#0080#; --  Clock Stretching Disable (Slave mode)
   CR1_START     : constant := 16#0100#; --  Start Generation
   CR1_STOP      : constant := 16#0200#; --  Stop Generation
   CR1_ACK       : constant := 16#0400#; --  Acknowledge Enable
   CR1_POS       : constant := 16#0800#; --  Acknowledge/PEC Position (for data reception)
   CR1_PEC       : constant := 16#1000#; --  Packet Error Checking
   CR1_ALERT     : constant := 16#2000#; --  SMBus Alert
   CR1_SWRST     : constant := 16#8000#; --  Software Reset

   CR1_Clear_Mask : constant := 16#FBF5#;

   CR2_FREQ      : constant := 16#003F#; --  Peripheral Clock Frequency bits

   CCR_CCR       : constant := 16#0FFF#; --  Clock Control Register
   CCR_FS        : constant := 16#8000#;  -- Master Mode Selection fast/std

   I2C_OAR1_ADD0 : constant := 16#0001#;
   I2C_OAR1_ADD1 : constant := 16#0002#;
   I2C_OAR1_ADD2 : constant := 16#0004#;
   I2C_OAR1_ADD3 : constant := 16#0008#;
   I2C_OAR1_ADD4 : constant := 16#0010#;
   I2C_OAR1_ADD5 : constant := 16#0020#;
   I2C_OAR1_ADD6 : constant := 16#0040#;
   I2C_OAR1_ADD7 : constant := 16#0080#;
   I2C_OAR1_ADD8 : constant := 16#0100#;
   I2C_OAR1_ADD9 : constant := 16#0200#;

   I2C_Direction_Transmitter : constant := 16#00#;
   I2C_Direction_Receiver    : constant := 16#01#;

end STM32F4.I2C;
