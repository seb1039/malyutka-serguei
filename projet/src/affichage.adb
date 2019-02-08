package body Affichage is
      
   --Procédure a  appeler 
   procedure Coup_Joue(Dir : Direction) is
   begin
      exit;
   end Coup_Joue;
   
   
   --Sert a  la Mise a  jour du score
   procedure Maj_Score(Val : Valeur) is
   begin
      My_Score := My_Score + Val;
   end Maj_Score; 
   
   --Sert a  la Mise a  jour de la grille avant ajout d'une case
   procedure Maj_Grille(Dir : Direction) is
   begin
      case Dir is
         when Haut =>
            for I in Coord loop
               for J in reverse Coord loop
                  Decalage((X =>I,
                            Y =>J),
                           Dir => Dir);
               end loop;
            end loop;
         when Bas =>
            for I in Coord loop
               for J in Coord loop
                  Decalage((X =>I,
                            Y =>J),
                           Dir => Dir);
               end loop;
            end loop;
         when Gauche =>
            for I in Coord loop
               for J in Coord loop
                  Decalage((X =>J,
                            Y =>I),
                           Dir => Dir);
               end loop;
            end loop;
         when Droite =>
            for I in reverse Coord loop
               for J in Coord loop
                  Decalage((X =>J,
                            Y =>I),
                           Dir => Dir);
               end loop;
            end loop;
      end case;
   end Maj_Grille;
   
   --Sert a  la Mise a  jour de la couleur d'une case
   procedure Maj_Couleur(pos_ancienne, pos_nouvelle : Position) is
   begin
      My_Grill(pos_ancienne.X, pos_ancienne.Y).Coul := Red;
      My_Grill(pos_nouvelle.X, pos_nouvelle.Y).Coul := Red;
   end Maj_Couleur;
   
   --Sert a  l'ajout d'une case sur la grille
   procedure Ajout_Case is
   begin
      exit;
   end Ajout_Case;
   
   --Sera appelé par Ajout_Case
   --Retourne vrai si la case dont la position indiquée est libre
   function Est_Libre(Pos : Position) return Boolean is
   begin
      return My_Grill(Pos.X,Pos.Y).Val = 1;
   end Est_Libre;
      
   --Sert a  décaler une cell
   procedure Decalage(Pos : Position; Dir : Direction) is
      tmp : Valeur := My_Grill(Pos.X, Pos.Y).Val;
      new_Coord : Position;
   begin
      case Dir is
      when Haut =>
         -- Si la case au-dessus est vide alors décalage vers le haut
         if Pos.X > 2 and Est_Libre((Pos.X - 1, Pos.Y)) then
            My_Grill(Pos.X-1,Pos.Y).Val := tmp;
            My_Grill(Pos.X-1,Pos.Y).Val := 1;
            -- Si la case au-dessus a la même valeur alors décalage vers le haut
            -- et la nouvelle case double sa valeur
         elsif Pos.X > 2 and My_Grill(Pos.X - 1, Pos.Y).Val = tmp then
            My_Grill(Pos.X-1,Pos.Y).Val := tmp * 2;
            My_Grill(Pos.X-1,Pos.Y).Val := 1;
            Maj_Couleur(pos_ancienne => (Pos.X,Pos.Y),
                        pos_nouvelle => (Pos.X-1,Pos.Y));
         end if;
      when Bas =>
            -- Si la case en-dessous est vide alors décalage vers la bas
            if Pos.X < 4 and My_Grill(Pos.X+1, Pos.Y).Val = 1 then
            My_Grill(Pos.X+1,Pos.Y).Val := tmp;
            My_Grill(Pos.X+1,Pos.Y).Val := 1;
            -- Si la case en-dessous a la même valeur alors décalage vers la bas
            -- et la nouvelle case double sa valeur
         elsif Pos.X < 4 and My_Grill(Pos.X+1,Pos.Y).Val = tmp then
            My_Grill(Pos.X+1,Pos.Y).Val := tmp * 2;
            My_Grill(Pos.X+1,Pos.Y).Val := 1;
            Maj_Couleur(pos_ancienne => (Pos.X,Pos.Y),
                        pos_nouvelle => (Pos.X+1,Pos.Y));
         end if;
      when Gauche =>
         -- Si la case à gauche est vide alors décalage vers la gauche
         if Pos.Y > 2 and My_Grill(Pos.X, Pos.Y - 1).Val = 1 then
            My_Grill(Pos.X,Pos.Y-1).Val := tmp;
            My_Grill(Pos.X,Pos.Y-1).Val := 1;
            -- Si la case à gauche a la même valeur alors décalage vers le gauche
            -- et la nouvelle case double sa valeur
         elsif Pos.Y > 2 and My_Grill(Pos.X,Pos.Y + 1).Val = tmp then
            My_Grill(Pos.X,Pos.Y-1).Val := tmp * 2;
            My_Grill(Pos.X,Pos.Y-1).Val := 1;
            Maj_Couleur(pos_ancienne => (Pos.X,Pos.Y),
                        pos_nouvelle => (Pos.X,Pos.Y-1));
         end if;
      when Droite =>
         -- Si la case à droite est vide alors décalage vers la droite
         if Pos.Y < 4 and My_Grill(Pos.X, Pos.Y + 1).Val = 1 then
            My_Grill(Pos.X,Pos.Y + 1).Val := tmp;
            My_Grill(Pos.X,Pos.Y + 1).Val := 1;
            -- Si la case au-dessus a la même valeur alors décalage vers le haut
            -- et la nouvelle case double sa valeur
         elsif Pos.X < 4 and My_Grill( Pos.X, Pos.Y + 1).Val = tmp then
               My_Grill(Pos.X,Pos.Y + 1).Val := tmp * 2;
               My_Grill(Pos.X,Pos.Y + 1).Val := 1;
               Maj_Couleur(pos_ancienne => (Pos.X,Pos.Y),
                           pos_nouvelle => (Pos.X,Pos.Y+1));
            end if;
         end case;
   end Decalage;
   
end Affichage;
