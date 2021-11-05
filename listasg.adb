
package body ListasG is

   procedure Crear_Vacia (L: out Lista) is
   begin
      L.Cont:= 0;
   end Crear_Vacia;

   function El_Iesimo(L: in Lista; I: Natural) return Tipo_NL is
   begin
      return L.Info(I);
   end El_Iesimo;

   function Esta (L: in Lista; N: in Tipo_NL) return Boolean is
      I : Integer := 1;
   begin
      while I <= L.Cont and then precede(L.Info(I), N) loop
         I := I+1;
      end loop;
      return I <= L.Cont and then L.Info(I) = N;
   end Esta;

   function Es_Vacia (L: in Lista) return Boolean is
   begin
      return L.Cont = 0;
   end Es_Vacia;

   function Capacidad (L: in Lista) return Integer is
   begin
      return Max;
   end Capacidad;

   function Num_Elementos (L : in Lista) return Integer is
   begin
      return L.Cont;
   end;

   procedure Colocar (L : in out Lista; E: in Tipo_NL) is
      Ins : Integer := 1;
   begin
      while Ins <= L.Cont and then precede(L.Info(Ins), E)loop
         Ins := Ins + 1;
      end loop;
      L.Info(Ins+1..L.Cont+1) := L.Info(Ins..L.Cont);
      L.Cont := L.Cont + 1;
      L.Info(Ins) := E;
   end Colocar;

   procedure Borrar_Iesimo(L : in out Lista; I:Natural) is
   begin
      L.Info(I..L.Cont-1) := L.Info(I+1..L.Cont);
      L.Cont := L.Cont-1;
   end Borrar_Iesimo;

   function Igual (L1, L2 : in Lista)  return Boolean is
   begin
      return L1.Cont = L2.Cont and then L1.Info(1..L1.Cont) = L2.Info(1..L2.Cont);
   end Igual;

   procedure Copiar (L1 : out Lista; L2 : in Lista) is
   begin
      L1.Cont := L2.Cont;
      L1.Info(1 .. L1.Cont) := L2.Info(1 .. L1.Cont);
   END Copiar;


end ListasG;

