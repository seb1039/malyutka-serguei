with Display.Basic; use Display.Basic;
with Display; use Display;

package Affichage is
   
   --
   -- NOTE AU LECTEUR DE CE COMMENTAIRE : Il faut qu'on ait un package qui
   -- initialise la partie d'un point de vue moteur et graphique.
   -- En faire un qui lancerait les deux?
   --   
   
   subtype Score is Natural;
   My_Score : Score := 0;
     
   subtype Valeur is Natural;
   
   type Coord is range 1 .. 4;
   subtype Col is Coord;
   subtype Lin is Coord;
   
   type Position is record
      X : Coord;
      Y : Coord;
   end record;
   
   -- Par défaut, une case à pour valeur 1. Ainsi, si une case a pour valeur 1,
   -- c'est qu'elle est vide.
   type Case_T is record
      Val : Valeur := 1;
      Coul : RGBA_T;
   end record;
   
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
   
   type Grill is array(Col,Lin) of Case_T;
   
   -- My_Grill est la grille qu'on devrait utiliser
   My_Grill : Grill;
   
   -- La Direction est la direction vers laquelle on glisse
   type Direction is (Haut, Bas, Gauche, Droite);
      
   --Procédure a  appeler 
   procedure Coup_Joue(Dir : Direction);
   
private
   
   --Sert a  la Mise a  jour du score
   procedure Maj_Score(val : Valeur); 
   
   --Sert a  la Mise a  jour de la grille avant ajout d'une case
   procedure Maj_Grille(Dir : Direction);
   
   --Sert a  la Mise a  jour de la couleur d'une case
   procedure Maj_Couleur(pos_ancienne, pos_nouvelle : Position); 
   
   --Sert a  l'ajout d'une case sur la grille
   procedure Ajout_Case;
   
   --Sera appelé par Ajout_Case
   --Retourne vrai si la case dont la position indiquée est libre
   function Est_Libre(Pos : Position) return Boolean;
   
   --Sert a  décaler une cell
   procedure Decalage(Pos : Position; Dir : Direction);

   
end Affichage;

  
