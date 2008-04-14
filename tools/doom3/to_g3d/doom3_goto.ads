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
,(-41,24)
-- State  17
,(-50,25)
-- State  27
,(-13,31)
-- State  34
,(-51,38)
-- State  35
,(-14,39)
-- State  37
,(-43,41),(-42,43)
-- State  38
,(-54,45),(-53,44),(-52,46)
-- State  39
,(-15,48)
-- State  41
,(-43,41),(-42,50)
-- State  42
,(-44,51)
-- State  44
,(-54,45),(-53,44),(-52,53)
-- State  45
,(-55,55)
-- State  48
,(-18,57),(-16,59)
-- State  54
,(-27,62),(-26,65)
-- State  57
,(-18,57),(-16,67)
-- State  59
,(-17,69)
-- State  60
,(-38,70),(-36,72)
-- State  61
,(-45,73)
-- State  62
,(-58,74)
-- State  65
,(-27,75)
-- State  66
,(-56,76)
-- State  68
,(-19,77)
-- State  70
,(-38,70),(-36,79)
-- State  71
,(-27,62),(-26,80)
-- State  72
,(-40,81),(-37,83)
-- State  74
,(-27,85)
-- State  75
,(-57,86)
-- State  80
,(-39,89)
-- State  81
,(-40,81),(-37,90)
-- State  84
,(-46,92)
-- State  85
,(-59,93)
-- State  88
,(-20,95)
-- State  92
,(-48,97),(-47,99)
-- State  93
,(-27,100)
-- State  97
,(-48,97),(-47,102)
-- State  98
,(-27,62),(-26,103)
-- State  101
,(-21,104)
-- State  103
,(-49,105)
-- State  104
,(-25,106),(-22,108)
-- State  106
,(-25,106),(-22,110)
-- State  107
,(-27,62),(-26,111)
-- State  108
,(-23,112)
-- State  111
,(-27,113)
-- State  112
,(-32,114),(-24,116)
-- State  113
,(-28,117)
-- State  114
,(-33,118)
-- State  115
,(-34,119)
-- State  117
,(-27,121)
-- State  118
,(-32,114),(-24,122)
-- State  121
,(-29,124)
-- State  123
,(-35,125)
-- State  124
,(-27,126)
-- State  126
,(-27,128)
-- State  128
,(-27,129)
-- State  129
,(-30,130)
-- State  130
,(-31,132)
);
--  The offset vector
GOTO_OFFSET : array (0.. 136) of Integer :=
(0,
5,5,5,11,11,11,11,11,11,17,17,17,17,17,17,17,18,
19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,
21,22,22,24,27,28,28,30,31,31,34,35,35,35,37,37,37,
37,37,37,39,39,39,41,41,42,44,45,46,46,46,47,48,48,
49,49,51,53,55,55,56,57,57,57,57,57,58,60,60,60,61,
62,62,62,63,63,63,63,65,66,66,66,66,68,70,70,70,71,
71,72,74,74,76,78,79,79,79,80,82,83,84,85,85,86,88,
88,88,89,89,90,91,91,92,92,93,94,95,95,95,95,95, 95);

subtype Rule        is Natural;
subtype Nonterminal is Integer;

   Rule_Length : array (Rule range  0 ..  75) of Natural := (2,
1,1,2,1,1,1,3,2,0,1,1,1,1,0,0,0,10,1,0,2,0,0,0,0,0,11,2,1,0,0,0,12,4,0,0,3,1,
0,0,5,11,2,0,0,4,2,0,1,0,7,2,1,0,0,0,7,2,1,0,4,0,0,7,2,1,0,0,5,0,5,0,0,5,1,
1);
   Get_LHS_Rule: array (Rule range  0 ..  75) of Nonterminal := (-1,
-2,-2,-3,-4,-4,-6,-7,-5,-5,-8,-8,-8,-8,-13,
-14,-17,-9,-15,-15,-16,-16,-19,-20,-21,-23,-18,-22,-22,
-28,-29,-30,-25,-31,-31,-33,-24,-24,-34,-35,-32,-10,-36,
-36,-39,-38,-37,-37,-40,-41,-11,-42,-42,-44,-45,-46,-43,
-47,-47,-49,-48,-50,-51,-12,-52,-52,-54,-56,-53,-57,-55,
-58,-59,-26,-27,-27);
end Doom3_Goto;
