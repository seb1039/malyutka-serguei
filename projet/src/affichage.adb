package body Affichage is
      
   --Procédure à appeler 
   procedure Coup_Joue(Dir : Direction) is
   begin
      case Dir is:
         when Haut =>
        for I in Coord loop
           Decalage(Coord(I,))
        end loop;
         when Bas =>
         when Gauche =>
         when Droite =>
      end case;
   end Coup_Joue;


   
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
   
end package;

  
