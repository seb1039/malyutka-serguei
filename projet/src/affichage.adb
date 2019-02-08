package body Affichage is
      
   --Procédure a  appeler 
   procedure Coup_Joue(Dir : Direction) is
   begin
      case Dir is:
         when Haut => 
            for I in reverse Coord loop
               for J in Coord loop
                  Decalage(Position(I,J),Dir);
               end loop;
            end loop;
         when Bas =>
            for I in Coord loop
               for J in Coord loop
                  Decalage(Position(I,J),Dir);
               end loop;
            end loop;
         when Gauche =>
            for I in Coord loop
               for J in Coord loop
                  Decalage(Position(J,I),Dir);
               end loop;
            end loop;
         when Droite =>
            for I in reverse Coord loop
               for J in Coord loop
                  Decalage(Position(J,I),Dir);
               end loop;
            end loop;
      end case;
   end Coup_Joue;
   
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
   function Est_Libre(Pos : Position) return Boolean is
   begin
      return My_Grill(Pos).Value = 1;
   end function;
      
   --Sert a  décaler une cell
   procedure Decalage(Pos : Position; Dir : Direction) is
      tmp : Case_T := My_Grill(Pos);
      new_Coord : Position;
   begin
      case Dir
      when Haut =>
         if Pos.X > 2 and My_Grill((Pos.X, Pos.Y)).Val = 1 then
            
         end if;
      when Bas =>
      when Gauche =>
      when Droite =>
   end case;
   
     
   end Decalage;
   
   
end package;
