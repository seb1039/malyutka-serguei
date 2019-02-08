
package Affichage is
   
   subtype Score is Natural;
   subtype Valeur is Natural;
   type Coord is range 1 .. 4;
      
   type Position is record
      X : Coord;
      Y : Coord;
   end record;
   
   -- Par défaut, une case à pour valeur 1. Ainsi, si une case a pour valeur 1,
   -- c'est qu'elle est vide.
   type Case_T is record
      Val : Valeur := 1;
      Pos : Position;
   end record;
   
   -- type Col is array (Coord) of Case_T;
   -- type Lin is array (Coord) of Case_T;
   
   type Grill_Index is range 1 .. Coord'Last;
   

   -- +---+---+---+---+
   -- |1,1|2,1|3,1|4,1|
   -- +---+---+---+---+
   -- |1,2|2,2|3,2|4,2|
   -- +---+---+---+---+
   -- |1,3|2,3|3,3|4,3|
   -- +---+---+---+---+
   -- |1,4|2,4|3,4|4,4|
   -- +---+---+---+---+
   
   type Grill is array(Position) of Case_T;
   
   -- My_Grill est la grille qu'on devrait utiliser
   My_Grill : Grill;
   
   -- La Direction est la direction vers laquelle on glisse
   type Direction is (Haut, Bas, Gauche, Droite);
      
   --Procédure a  appeler 
   procedure Coup_Joue(Dir : Direction);
   
private
   
   --Sert a  la Mise a  jour du score
   procedure Maj_Score; 
   
   --Sert a  la Mise a  jour du score affiché
   procedure Maj_Score_Affiche;
   
   --Sert a  la Mise a  jour de la grille avant ajout d'une case
   procedure Maj_Grille;
   
   --Sert a  l'ajout d'une case sur la grille
   procedure Ajout_Case;
   
   --Sera appelé par Ajout_Case
   --Retourne vrai si la case dont la position indiquée est libre
   function Est_Libre(Pos : Position) return Boolean;
   
   --Sert a  décaler une cell
   procedure Decalage(Pos : Position; Dir : Direction);

   
end package;

  
