
--  This algorithm was adapted from GNAT.Heap_Sort_G (see g-hesorg.ad[sb]).

with System;

procedure Ada_Containers_Generic_Constrained_Array_Sort
  (Container : in out Array_Type)
is
   type T is range System.Min_Int .. System.Max_Int;

   function To_Index (J : T) return Index_Type;
   pragma Inline (To_Index);

   procedure Sift (S : T);

   A : Array_Type renames Container;

   --------------
   -- To_Index --
   --------------

   function To_Index (J : T) return Index_Type is
      K : constant T'Base := Index_Type'Pos (A'First) + J - T'(1);
   begin
      return Index_Type'Val (K);
   end To_Index;

   Max  : T := A'Length;
   Temp : Element_Type;

   ----------
   -- Sift --
   ----------

   procedure Sift (S : T) is
      C   : T := S;
      Son : T;

   begin
      loop
         Son := 2 * C;

         exit when Son > Max;

         declare
            Son_Index : Index_Type := To_Index (Son);

         begin
            if Son < Max then
               if A (Son_Index) < A (Index_Type'Succ (Son_Index)) then
                  Son := Son + 1;
                  Son_Index := Index_Type'Succ (Son_Index);
               end if;
            end if;

            A (To_Index (C)) := A (Son_Index);  -- Move (Son, C);
         end;

         C := Son;
      end loop;

      while C /= S loop
         declare
            Father      : constant T := C / 2;
            Father_Elem : Element_Type renames A (To_Index (Father));

         begin
            if Father_Elem < Temp then           -- Lt (Father, 0)
               A (To_Index (C)) := Father_Elem;  -- Move (Father, C)
               C := Father;

            else
               exit;
            end if;
         end;
      end loop;

      A (To_Index (C)) := Temp; -- Move (0, C);
   end Sift;

--  Start of processing for Generic_Constrained_Array_Sort

begin
   for J in reverse 1 .. Max / 2 loop
      Temp := Container (To_Index (J)); --  Move (J, 0);
      Sift (J);
   end loop;

   while Max > 1 loop
      declare
         Max_Elem : Element_Type renames A (To_Index (Max));
      begin
         Temp := Max_Elem;         --  Move (Max, 0);
         Max_Elem := A (A'First);  --  Move (1, Max);
      end;

      Max := Max - 1;
      Sift (1);
   end loop;
end Ada_Containers_Generic_Constrained_Array_Sort;
