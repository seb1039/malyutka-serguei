with Libm_Single;   use Libm_Single;
with Ada.Real_Time; use Ada.Real_Time;
with stm32.rng.interrupts; use stm32.rng.interrupts;
with hal; use hal;

package body dmqh is

   procedure Init_Body
     (B            : Bodies_Enum;
      Cases        : Case_T;
      X            : Float;
      Y            : Float)

   is
   begin

      Bodies (B).Set_Data
        ((Pos          => (X,Y),
          Cases        => Case_T));

   end Init_Body;


   protected body P_Body is

      function Get_Data return Body_Type is
      begin
         return Data;
      end Get_Data;

      procedure Set_Data (B : Body_Type) is
      begin
         Data := B;
      end Set_Data;

   end P_Body;

   protected body Dispatch_Tasks is
      procedure Get_Next_Body (B : out Bodies_Enum) is
      begin
         B := Current;
         if Current /= Bodies_Enum'Last then
            Current := Bodies_Enum'Succ (Current);
         end if;
      end Get_Next_Body;
   end Dispatch_Tasks;

end dmqh;
