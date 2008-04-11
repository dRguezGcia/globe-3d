package Doom3_Shift_Reduce is

    type Small_Integer is range -32_000 .. 32_000;

    type Shift_Reduce_Entry is record
        T   : Small_Integer;
        Act : Small_Integer;
    end record;
    pragma Pack(Shift_Reduce_Entry);

    subtype Row is Integer range -1 .. Integer'Last;

  --pragma suppress(index_check);

    type Shift_Reduce_Array is array (Row  range <>) of Shift_Reduce_Entry;

    Shift_Reduce_Matrix : constant Shift_Reduce_Array :=
        ( (-1,-1) -- Dummy Entry

-- State  0
,( 1, 2),( 5, 6),( 6, 7),(-1,-3000)
-- State  1
,(-1,-1)
-- State  2
,(-1,-2)
-- State  3
,( 7, 14),( 8, 15),( 9, 16),( 10, 17),(-1,-9)
-- State  4
,(-1,-4)
-- State  5
,(-1,-5)
-- State  6
,(-1,-6)
-- State  7
,( 4, 19),(-1,-3000)
-- State  8
,( 0,-3001),(-1,-3000)
-- State  9
,( 7, 14),( 8, 15),( 9, 16),( 10, 17),(-1,-9)
-- State  10
,(-1,-10)
-- State  11
,(-1,-11)
-- State  12
,(-1,-12)
-- State  13
,(-1,-13)
-- State  14
,( 11, 22),(-1,-3000)
-- State  15
,( 11, 23),(-1,-3000)
-- State  16
,(-1,-49)
-- State  17
,(-1,-61)
-- State  18
,(-1,-3)
-- State  19
,( 2, 26),(-1,-3000)
-- State  20
,(-1,-3000)
-- State  21
,(-1,-8)
-- State  22
,( 4, 27),(-1,-3000)
-- State  23
,( 4, 28),(-1,-3000)
-- State  24
,( 11, 29),(-1,-3000)
-- State  25
,( 11, 30),(-1,-3000)
-- State  26
,(-1,-7)
-- State  27
,(-1,-14)
-- State  28
,( 2, 32),(-1,-3000)
-- State  29
,( 2, 33),(-1,-3000)
-- State  30
,( 2, 34),(-1,-3000)
-- State  31
,( 2, 35),(-1,-3000)
-- State  32
,( 2, 36),(-1,-3000)
-- State  33
,( 2, 37),(-1,-3000)
-- State  34
,(-1,-62)
-- State  35
,(-1,-15)
-- State  36
,( 2, 40),(-1,-3000)
-- State  37
,( 2, 42),(-1,-3000)
-- State  38
,( 13, 46),(-1,-3000)
-- State  39
,( 2, 48),(-1,-19)
-- State  40
,( 2, 50),(-1,-3000)
-- State  41
,( 2, 42),(-1,-52)
-- State  42
,(-1,-53)
-- State  43
,( 12, 53),(-1,-3000)
-- State  44
,( 13, 46),(-1,-66)
-- State  45
,( 2, 55),(-1,-3000)
-- State  46
,( 2, 58),( 3, 57),(-1,-3000)
-- State  47
,(-1,-63)
-- State  48
,(-1,-18)
-- State  49
,( 11, 62),(-1,-21)
-- State  50
,( 2, 64),(-1,-3000)
-- State  51
,(-1,-51)
-- State  52
,( 2, 65),(-1,-3000)
-- State  53
,(-1,-50)
-- State  54
,(-1,-65)
-- State  55
,(-1,-67)
-- State  56
,(-1,-71)
-- State  57
,(-1,-74)
-- State  58
,(-1,-75)
-- State  59
,( 2, 58),( 3, 57),(-1,-3000)
-- State  60
,( 12, 69),(-1,-3000)
-- State  61
,( 11, 62),(-1,-21)
-- State  62
,( 4, 71),(-1,-3000)
-- State  63
,(-1,-16)
-- State  64
,( 13, 74),(-1,-43)
-- State  65
,(-1,-54)
-- State  66
,( 2, 77),(-1,-3000)
-- State  67
,( 2, 58),( 3, 57),(-1,-3000)
-- State  68
,(-1,-69)
-- State  69
,(-1,-64)
-- State  70
,(-1,-20)
-- State  71
,(-1,-22)
-- State  72
,( 12, 81),(-1,-3000)
-- State  73
,( 13, 74),(-1,-43)
-- State  74
,( 2, 58),( 3, 57),(-1,-3000)
-- State  75
,( 2, 85),(-1,-47)
-- State  76
,( 2, 87),(-1,-3000)
-- State  77
,(-1,-68)
-- State  78
,(-1,-72)
-- State  79
,( 14, 89),(-1,-3000)
-- State  80
,( 2, 90),(-1,-3000)
-- State  81
,(-1,-17)
-- State  82
,(-1,-42)
-- State  83
,(-1,-44)
-- State  84
,( 2, 85),(-1,-47)
-- State  85
,(-1,-48)
-- State  86
,( 12, 93),(-1,-3000)
-- State  87
,(-1,-55)
-- State  88
,( 2, 58),( 3, 57),(-1,-3000)
-- State  89
,(-1,-70)
-- State  90
,(-1,-23)
-- State  91
,( 14, 97),(-1,-3000)
-- State  92
,(-1,-46)
-- State  93
,(-1,-41)
-- State  94
,( 13, 99),(-1,-3000)
-- State  95
,(-1,-73)
-- State  96
,( 2, 101),(-1,-3000)
-- State  97
,(-1,-45)
-- State  98
,( 13, 99),(-1,-58)
-- State  99
,( 2, 58),( 3, 57),(-1,-3000)
-- State  100
,(-1,-56)
-- State  101
,(-1,-24)
-- State  102
,(-1,-57)
-- State  103
,(-1,-59)
-- State  104
,( 13, 107),(-1,-3000)
-- State  105
,( 14, 109),(-1,-3000)
-- State  106
,( 13, 107),(-1,-28)
-- State  107
,( 2, 58),( 3, 57),(-1,-3000)
-- State  108
,(-1,-25)
-- State  109
,(-1,-60)
-- State  110
,(-1,-27)
-- State  111
,( 2, 58),( 3, 57),(-1,-3000)
-- State  112
,( 2, 115),(-1,-3000)
-- State  113
,(-1,-29)
-- State  114
,( 12,-37),(-1,-35)
-- State  115
,(-1,-38)
-- State  116
,( 12, 120),(-1,-3000)
-- State  117
,( 2, 58),( 3, 57),(-1,-3000)
-- State  118
,( 2, 115),(-1,-3000)
-- State  119
,( 2, 123),(-1,-3000)
-- State  120
,(-1,-26)
-- State  121
,(-1,-30)
-- State  122
,(-1,-36)
-- State  123
,(-1,-39)
-- State  124
,( 2, 58),( 3, 57),(-1,-3000)
-- State  125
,( 2, 127),(-1,-3000)
-- State  126
,( 2, 58),( 3, 57),(-1,-3000)
-- State  127
,(-1,-40)
-- State  128
,( 2, 58),( 3, 57),(-1,-3000)
-- State  129
,(-1,-31)
-- State  130
,( 2, 131),(-1,-34)
-- State  131
,( 2, 133),(-1,-3000)
-- State  132
,( 14, 134),(-1,-3000)
-- State  133
,( 2, 135),(-1,-3000)
-- State  134
,(-1,-32)
-- State  135
,( 2, 136),(-1,-3000)
-- State  136
,(-1,-33)
);
--  The offset vector
SHIFT_REDUCE_OFFSET : array (0.. 136) of Integer :=
( 0,
 4, 5, 6, 11, 12, 13, 14, 16, 18, 23, 24, 25, 26, 27, 29, 31,
 32, 33, 34, 36, 37, 38, 40, 42, 44, 46, 47, 48, 50, 52, 54, 56,
 58, 60, 61, 62, 64, 66, 68, 70, 72, 74, 75, 77, 79, 81, 84, 85,
 86, 88, 90, 91, 93, 94, 95, 96, 97, 98, 99, 102, 104, 106, 108, 109,
 111, 112, 114, 117, 118, 119, 120, 121, 123, 125, 128, 130, 132, 133, 134, 136,
 138, 139, 140, 141, 143, 144, 146, 147, 150, 151, 152, 154, 155, 156, 158, 159,
 161, 162, 164, 167, 168, 169, 170, 171, 173, 175, 177, 180, 181, 182, 183, 186,
 188, 189, 191, 192, 194, 197, 199, 201, 202, 203, 204, 205, 208, 210, 213, 214,
 217, 218, 220, 222, 224, 226, 227, 229);
end Doom3_Shift_Reduce;
