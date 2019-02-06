
package Affichage is
        
   subtype Score is Integer;
   type Coord is range 1 .. 4;
      
   type Position is record
      X : Coord;
      Y : Coord;
   end record;
   
   type Case_T is record
      Value : Score;
      Pos : Position;
   end record;
   
   -- type Col is array (Coord) of Case_T;
   -- type Lin is array (Coord) of Case_T;
   
   type Grill_Index is range 1 .. Coord'Last;
   
   type Grill is array(Position) of Case_T;
   
   -- My_Grill est la grille qu'on devrait utiliser
   My_Grill : Grill;
   
   type Direction is (Haut, Bas, Gauche, Droite);
      
   --Procédure à appeler 
   procedure Coup_Joue(Dir : Direction);
   
private
   
   --Sert à la Mise à jour du score
   procedure Maj_Score; 
   
   --Sert à la Mise à jour du score affiché
   procedure Maj_Score_Affiche;
   
   --Sert à la Mise à jour de la grille avant ajout d'une case
   procedure Maj_Grille;
   
   --Sert à l'ajout d'une case sur la grille
   procedure Ajout_Case;
   
   --Sera appelé par Ajout_Case
   --Retourne vrai si la case dont la coordonnéeindiquée est libre
   function Est_Libre(Coo : Coord) return Boolean;
   
   --Sert à décaler une cell
   procedure Decalage(Coo : Coord; Dir : Direction);

   
end package;

  
