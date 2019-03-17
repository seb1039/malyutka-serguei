with Display;       use Display;
with Display.Basic; use Display.Basic;
with Affichage;     use Affichage;

package dmqh is

   type Bodies_Enum is
     (c11,c21,c31,c41,
      c12,c22,c32,c42,
      c13,c23,c33,c43,
      c14,c24,c34,c44);

   procedure Init_Body
     (B            : Bodies_Enum;
      Cases        : Case_T;
      X            : Float;
      Y            : Float);

private

   type Position is record
      X : Float := 0.0;
      Y : Float := 0.0;
   end record;


   type Body_Type is record
      Pos          : Position;
      Cases        : Case_T;
   end record;

   protected Dispatch_Tasks is
      procedure Get_Next_Body (B : out Bodies_Enum);
   private
      Current : Bodies_Enum := Bodies_Enum'First;
   end Dispatch_Tasks;


   protected type P_Body is
      function Get_Data return Body_Type;
      procedure Set_Data (B : Body_Type);
   private
      Data : Body_Type;
   end P_Body;

   type Bodies_Array is array (Bodies_Enum) of P_Body;
   Bodies : Bodies_Array;

end dmqh;
