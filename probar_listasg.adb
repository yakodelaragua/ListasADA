with ListasG, Ada.Integer_Text_IO, Ada.Text_IO, prece;
use Ada.Integer_Text_IO, Ada.Text_IO;

PROCEDURE Probar_ListasG IS

package Listas_Enteros200 is new ListasG(Max => 200, Tipo_NL => Integer, Precede => Prece);

   procedure Cargar_De_Teclado (L: out Listas_Enteros200.Lista) is
      N: Integer;
   begin
      Listas_Enteros200.Crear_Vacia (L);
      Put_Line("Se va a crear una lista de enteros con los numeros que indique.");
      Put_Line("Acabe con ctrl-Z");

      while not End_Of_File loop
         Get(N);
         Listas_Enteros200.Colocar(L, N);
      end loop;
      Put_Line("ha terminado la lectura de los numeros de la lista");
   end Cargar_De_Teclado;

   procedure Escribir(L: Listas_Enteros200.Lista) is
   begin
      Put("Lista: ");
      for I in 1..Listas_Enteros200.Num_Elementos(L) loop
         Put(Listas_Enteros200.El_Iesimo(L, I), Width =>1);
         Put(' ');
      end loop;
      New_Line;
   end Escribir;

   procedure Vaciar(L: in out Listas_Enteros200.Lista) is
   begin
      Put_Line("Voy a vaciar la lista borrando uno a uno los elementos");
      Put("Elimino el: ");
      while not Listas_Enteros200.Es_Vacia(L) loop
         Put(Listas_Enteros200.El_Iesimo(L, 1), 0);
         Put("  ");
         Listas_Enteros200.Borrar_Iesimo(L, 1);
      end loop;
      New_Line;
   end Vaciar;

   L1, L2: Listas_Enteros200.Lista;
begin
   Cargar_De_Teclado(L1);
   New_Line;

   Escribir(L1);
   New_Line;
   Put_Line("El primer numero de la lista es " & Integer'Image(Listas_Enteros200.El_Iesimo(L1, 1)));
   Put_Line("La lista tiene " & Integer'Image(Listas_Enteros200.Num_Elementos(L1)) & " elementos");
   Put_Line("La lista tiene una capacidad de " & Integer'Image(Listas_Enteros200.Capacidad(L1)) & " elementos");

   if Listas_Enteros200.Esta(L1, 4)
         then Put_Line("El numero 4 esta en la lista");
   else Put_Line("El numero 4 NO esta en la lista");
   end if;

   New_Line;
   Put_Line("Creamos una nueva lista.");
   Cargar_De_Teclado(L2);
   Escribir(L2);
   if Listas_Enteros200.Igual(L1, L2)
         then Put_Line("Las listas son iguales");
   else
      Put_Line("Las listas son distintas");
   end if;

   New_Line;

   Listas_Enteros200.Copiar(L1, L2);
   Put_Line("la ultima lista copiada es");
   Escribir(L1);
   New_Line;

   if not Listas_Enteros200.Es_Vacia(L1) then
      Vaciar(L1);
      if Listas_Enteros200.Es_Vacia(L1) then
         Put_Line("La Lista Ahora Si Es Vacia");
      end if;
   end if;

   Put_Line("Fin del programa de prueba");

end Probar_ListasG;

