GENERIC
   Max: IN Integer;
   TYPE Tipo_NL IS private;
  with FUNCTION Precede(T, N: IN Tipo_NL) RETURN Boolean;

package ListasG is

   type Lista is limited private;     -- Tipo lista ordenada según operación precede

   procedure Crear_Vacia (L: out Lista);
   -- Post: crea la lista L vacia

   function El_Iesimo(L : in Lista; I: Natural) return Tipo_NL;
   -- Pre: L es una lista ordenada crecientemente con, al menos, i elementos. 1<=I<= Num_Elementos(L)
   -- Post: devuelve el iesimo elemento de la lista L,

   function Esta (L: in Lista; N: in Tipo_NL) return Boolean;
   -- Post: True sii C esta en la lista L

   function Es_Vacia (L: in Lista) return Boolean;
   -- Pre: L es una lista ordenada crecientemente
   -- Post: True sii la lista L es vacia

   function Capacidad (L: in Lista) return Integer;
   --    Pre: L lista ordenadas crecientemente

   --    Post: numero máximo de elementos de la list

   function Num_Elementos (L: in Lista) return Integer;
   --    Pre: L lista ordenadas crecientemente
   --    Post: numero de elementos de la lista

   procedure Colocar (L: in out Lista; E: in Tipo_NL);
   -- Pre: L es una lista No llena ordenada crecientemente
   -- Post: Coloca en orden creciente el elemento E en L

   procedure Borrar_Iesimo(L: in out Lista; I:Natural);
   -- Pre: L es una lista ordenada crecientemente con al menos I elementos. 1<=I<= Num_Elementos(L)
   -- Post: Elimina el iesimo elemento de L quedando la lista ordenada.

   function Igual (L1, L2 : in Lista) return Boolean;
   --    Pre: L1 y L2 son listas ordenadas crecientemente
   --    Post: True sii L1 y L2 son iguales (representan listas iguales)

   procedure Copiar (L1: out Lista; L2: in Lista);
   -- Pre: L2 es lista ordenada crecientemente
   -- Post: L1 es una lista ordenada copia de L2.

  -- function precede(S, M: in Integer) return boolean;

   private

   --Max : Constant Integer := 100;
   type Vector is Array (1.. Max) of Tipo_NL;
   type Lista is
      record
         Info      : Vector;
         Cont: integer range 0..Max := 0;
      end record;
end ListasG;
