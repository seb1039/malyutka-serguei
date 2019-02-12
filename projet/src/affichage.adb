package body Affichage is
      
   --Procédure a  appeler 
   procedure Coup_Joue(Dir : Direction) is
   begin
      Maj_Grille(Dir => Dir);
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
                  Decalage(Co => I,
                           Li => J,
                           Dir => Dir);
               end loop;
            end loop;
         when Bas =>
            for I in Coord loop
               for J in Coord loop
                  Decalage(Co => I,
                           Li => J,
                           Dir => Dir);
               end loop;
            end loop;
         when Gauche =>
            for I in Coord loop
               for J in Coord loop
                  Decalage(Co => J,
                           Li => I,
                           Dir => Dir);
               end loop;
            end loop;
         when Droite =>
            for I in reverse Coord loop
               for J in Coord loop
                  Decalage(Co => J,
                           Li => I,
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
      co : Col;
      li : Lin;
      tmp : Valeur;
   begin
      loop
         Initialize_RNG;
         co := Col(Random mod 5 + 1);
         li := Lin(Random mod 5 + 1);
         exit when Est_Libre(co, li);
      end loop;
      if Random mod 2 = 0 then
         tmp := 2;
      else 
         tmp := 4;
      end if;        
      My_Grill(co,li).Val := tmp;
   end Ajout_Case;
   
   --Sera appelé par Ajout_Case
   --Retourne vrai si la case dont la position indiquée est libre
   function Est_Libre(co : Col; li : Lin) return Boolean is
   begin
      return My_Grill(co, li).Val = 1;
   end Est_Libre;
   
   --Sera appelé par Ajout_Case
   --Retourne vrai si la grille est pleine
   function Est_Finie return Boolean is
   begin
      for i in Col loop
         for j in Lin loop
            if Est_Libre(i,j) /= True then
               return True;
            end if;
         end loop;
      end loop;
      return False;        
   end Est_Finie;
      
   --Sert a  décaler une cell
   procedure Decalage(Co : Col; Li : Lin; Dir : Direction) is
      tmp : Valeur := My_Grill(Co, Li).Val;
   begin
      case Dir is
      when Haut =>
         -- Si la case au-dessus est vide alors décalage vers le haut
         if Co > 2 and Est_Libre(Co, Li) then
            My_Grill(Co - 1, Li).Val := tmp;
            My_Grill(Co - 1, Li).Val := 1;
            -- Si la case au-dessus a la même valeur alors décalage vers le haut
            -- et la nouvelle case double sa valeur
         elsif Co > 2 and My_Grill(Co - 1, Li).Val = tmp then
            My_Grill(Co - 1,Li).Val := tmp * 2;
            My_Grill(Co - 1,Li).Val := 1;
            Maj_Couleur(pos_ancienne => (Co, Li),
                        pos_nouvelle => (Co - 1, Li));
         end if;
      when Bas =>
         -- Si la case en-dessous est vide alors décalage vers la bas
         if Co < 4 and My_Grill(Co + 1, Li).Val = 1 then
            My_Grill(Co + 1,Li).Val := tmp;
            My_Grill(Co + 1,Li).Val := 1;
            -- Si la case en-dessous a la même valeur alors décalage vers la bas
            -- et la nouvelle case double sa valeur
         elsif Co < 4 and My_Grill(Co + 1, Li).Val = tmp then
            My_Grill(Co + 1, Li).Val := tmp * 2;
            My_Grill(Co + 1, Li).Val := 1;
            Maj_Couleur(pos_ancienne => (Co, Li),
                        pos_nouvelle => (Co, Li));
         end if;
      when Gauche =>
         -- Si la case à gauche est vide alors décalage vers la gauche
         if Li > 2 and My_Grill(Co, Li - 1).Val = 1 then
            My_Grill(Co, Li - 1).Val := tmp;
            My_Grill(Co, Li - 1).Val := 1;
            -- Si la case à gauche a la même valeur alors décalage vers le gauche
            -- et la nouvelle case double sa valeur
         elsif Li > 2 and My_Grill(Co, Li + 1).Val = tmp then
            My_Grill(Co, Li - 1).Val := tmp * 2;
            My_Grill(Co, Li - 1).Val := 1;
            Maj_Couleur(pos_ancienne => (Co, Li),
                        pos_nouvelle => (Co, Li - 1));
         end if;
      when Droite =>
         -- Si la case à droite est vide alors décalage vers la droite
         if Li < 4 and My_Grill(Co, Li + 1).Val = 1 then
            My_Grill(Co, Li + 1).Val := tmp;
            My_Grill(Co, Li + 1).Val := 1;
            -- Si la case au-dessus a la même valeur alors décalage vers le haut
            -- et la nouvelle case double sa valeur
         elsif Li < 4 and My_Grill(Co, Li + 1).Val = tmp then
            My_Grill(Co, Li + 1).Val := tmp * 2;
            My_Grill(Co, Li + 1).Val := 1;
            Maj_Couleur(pos_ancienne => (Co, Li),
                        pos_nouvelle => (Co, Li));
         end if;
      end case;
   end Decalage;
   
end Affichage;
