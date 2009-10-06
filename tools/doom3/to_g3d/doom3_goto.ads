package Doom3_Goto is

    type Small_Integer is range -32_000 .. 32_000;

    type Goto_Entry is record
        Nonterm  : Small_Integer;
        Newstate : Small_Integer;
    end record;

  --pragma suppress(index_check);

    subtype Row is Integer range -1 .. Integer'Last;

    type Goto_Parse_Table is array (Row range <>) of Goto_Entry;

    Goto_Matrix : constant Goto_Parse_Table :=
       ((-1,-1)  -- Dummy Entry.
-- State  0
,(-7,5),(-6,4),(-4,3),(-3,1),(-2,8)
-- State  3
,(-12,13),(-11,12),(-10,11),(-9,10),(-8,9),(-5,18)
-- State  9
,(-12,13),(-11,12),(-10,11),(-9,10),(-8,9),(-5,21)
-- State  16
,(-42,24)
-- State  17
,(-51,25)
-- State  27
,(-13,31)
-- State  28
,(-36,32)
-- State  34
,(-52,38)
-- State  35
,(-14,39)
-- State  37
,(-44,41),(-43,43)
-- State  38
,(-56,45),(-55,44),(-53,46)
-- State  39
,(-15,48)
-- State  41
,(-44,41),(-43,50)
-- State  42
,(-45,51)
-- State  44
,(-56,45),(-55,44),(-53,53)
-- State  45
,(-57,55)
-- State  46
,(-54,56)
-- State  48
,(-18,57),(-16,59)
-- State  54
,(-26,62),(-25,65)
-- State  57
,(-18,57),(-16,68)
-- State  59
,(-17,70)
-- State  61
,(-46,72)
-- State  62
,(-60,73)
-- State  65
,(-26,74)
-- State  66
,(-58,75)
-- State  69
,(-19,76)
-- State  71
,(-39,78),(-37,80)
-- State  73
,(-26,82)
-- State  74
,(-59,83)
-- State  78
,(-39,78),(-37,86)
-- State  79
,(-26,62),(-25,87)
-- State  80
,(-41,88),(-38,90)
-- State  81
,(-47,91)
-- State  82
,(-61,92)
-- State  85
,(-20,94)
-- State  87
,(-40,95)
-- State  88
,(-41,88),(-38,96)
-- State  91
,(-49,98),(-48,100)
-- State  92
,(-26,101)
-- State  98
,(-49,98),(-48,104)
-- State  99
,(-26,62),(-25,105)
-- State  102
,(-21,106)
-- State  105
,(-50,107)
-- State  106
,(-24,108),(-22,110)
-- State  108
,(-24,108),(-22,112)
-- State  109
,(-26,62),(-25,113)
-- State  110
,(-32,115),(-31,114),(-23,117)
-- State  113
,(-26,118)
-- State  115
,(-33,119)
-- State  116
,(-34,120)
-- State  118
,(-27,122)
-- State  119
,(-32,115),(-31,123)
-- State  122
,(-26,125)
-- State  124
,(-35,126)
-- State  125
,(-28,127)
-- State  127
,(-26,129)
-- State  129
,(-26,130)
-- State  130
,(-26,131)
-- State  131
,(-29,132)
-- State  132
,(-30,134)
);
--  The offset vector
GOTO_OFFSET : array (0.. 138) of Integer :=
(0,
5,5,5,11,11,11,11,11,11,17,17,17,17,17,17,17,18,
19,19,19,19,19,19,19,19,19,19,20,21,21,21,21,21,21,
22,23,23,25,28,29,29,31,32,32,35,36,37,37,39,39,39,
39,39,39,41,41,41,43,43,44,44,45,46,46,46,47,48,48,
48,49,49,51,51,52,53,53,53,53,55,57,59,60,61,61,61,
62,62,63,65,65,65,67,68,68,68,68,68,68,70,72,72,72,
73,73,73,74,76,76,78,80,83,83,83,84,84,85,86,86,87,
89,89,89,90,90,91,92,92,93,93,94,95,96,97,97,97,97,
97, 97);

subtype Rule        is Natural;
subtype Nonterminal is Integer;

   Rule_Length : array (Rule range  0 ..  78) of Natural := (2,
1,1,2,1,1,1,3,2,0,1,1,1,1,0,0,0,10,1,0,2,0,0,0,0,10,2,1,0,0,0,12,4,0,1,0,0,3,
1,0,0,5,0,12,2,0,0,4,2,0,1,0,7,2,1,0,0,0,7,2,1,0,4,0,0,0,8,2,1,0,0,5,0,5,0,
0,5,1,1);
   Get_LHS_Rule: array (Rule range  0 ..  78) of Nonterminal := (-1,
-2,-2,-3,-4,-4,-6,-7,-5,-5,-8,-8,-8,-8,-13,
-14,-17,-9,-15,-15,-16,-16,-19,-20,-21,-18,-22,-22,-27,
-28,-29,-24,-30,-30,-23,-23,-33,-31,-31,-34,-35,-32,-36,
-10,-37,-37,-40,-39,-38,-38,-41,-42,-11,-43,-43,-45,-46,
-47,-44,-48,-48,-50,-49,-51,-52,-54,-12,-53,-53,-56,-58,
-55,-59,-57,-60,-61,-25,-26,-26);
end Doom3_Goto;
