--  Warning: This lexical scanner is automatically generated by AFLEX.
--           It is useless to modify it. Change the ".Y" & ".L" files instead.
with Text_IO; use Text_IO;
with doom3_dfa; use doom3_dfa; 
with doom3_io; use doom3_io; 
--# line 1 "doom3.l"
-- Doom3.l
--# line 14 "doom3.l"


with DOOM3_Tokens; use DOOM3_Tokens;
with DOOM3_Help;   use DOOM3_Help;

function YYLex return Token is
subtype Short is Integer range -32768..32767;
    yy_act : Integer;
    yy_c   : Short;

-- returned upon end-of-file
YY_END_TOK : constant Integer := 0;
YY_END_OF_BUFFER : constant := 25;
subtype yy_state_type is Integer;
yy_current_state : yy_state_type;
INITIAL : constant := 0;
yy_accept : constant array(0..105) of Short :=
    (   0,
       14,   14,   25,   24,   17,   18,   24,   20,   21,   14,
       14,   24,   11,   12,   24,   24,   24,   24,   24,   24,
       24,   24,   23,   19,   22,   17,    0,   16,   14,   14,
       12,    0,   14,    0,    0,   13,    0,   12,    0,   14,
        0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    2,   13,   15,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    1,    0,    0,    0,    0,    0,    3,
        0,    9,   10,    0,    0,    5,    8,    0,    0,    0,
        0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
        0,    0,    0,    0,    0,    6,    0,    0,    0,    0,

        0,    4,    0,    7,    0
    ) ;

yy_ec : constant array(ASCII.NUL..Character'Last) of short :=
    (   0,
        1,    1,    1,    1,    1,    1,    1,    1,    2,    3,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    2,    1,    4,    1,    1,    1,    1,    1,    5,
        6,    7,    8,    1,    9,   10,   11,   12,   13,   13,
       14,   13,   13,   13,   13,   15,   15,    1,    1,    1,
        1,    1,    1,    1,   16,   17,   18,   19,   20,   21,
        1,   22,   23,    1,    1,   24,   25,   26,   27,   28,
        1,   29,   30,   31,   32,    1,   33,   34,    1,    1,
        1,    1,    1,    1,    1,    1,   16,   17,   18,   19,

       20,   21,    1,   22,   23,    1,    1,   24,   25,   26,
       27,   28,    1,   29,   30,   31,   32,    1,   33,   34,
        1,    1,   35,   36,   37,    1,    1, others=> 1

    ) ;

yy_meta : constant array(0..37) of short :=
    (   0,
        1,    1,    1,    1,    1,    1,    1,    2,    2,    3,
        1,    4,    4,    4,    4,    5,    5,    5,    5,    6,
        5,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1
    ) ;

yy_base : constant array(0..112) of Short :=
    (   0,
        0,    0,  189,  190,  186,  190,  183,  190,  190,   28,
       32,   42,   44,   40,   53,  170,  159,   39,  157,  154,
      160,  152,  190,  190,  190,  178,  175,  190,   55,   58,
       53,   68,   67,  171,  174,   71,    0,    0,   76,   81,
      152,  144,  146,  154,  153,  144,  154,  137,  161,   90,
      164,  190,    0,    0,  136,  145,  136,  143,  142,  143,
      141,  139,  151,  190,  137,  127,  126,  130,  123,  190,
      125,  190,  190,  135,  123,  190,  190,  116,  119,  129,
      121,  125,  123,  116,  126,  118,  121,  111,  114,  117,
      109,   93,   86,   71,   87,  190,   67,   74,   58,   51,

       27,  190,    9,  190,  190,  101,  105,  110,  114,  120,
      123,  129
    ) ;

yy_def : constant array(0..112) of Short :=
    (   0,
      105,    1,  105,  105,  105,  105,  106,  105,  105,  105,
      105,  105,  105,  107,  108,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  106,  105,  105,   13,
      107,  108,  105,  109,  110,   30,  111,   31,  105,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  109,  112,
      110,  105,   36,  111,  105,  105,  105,  105,  105,  105,
      105,  105,  109,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

      105,  105,  105,  105,    0,  105,  105,  105,  105,  105,
      105,  105
    ) ;

yy_nxt : constant array(0..227) of Short :=
    (   0,
        4,    5,    6,    7,    8,    9,    4,    4,   10,   11,
       12,   13,   14,   14,   14,    4,    4,    4,    4,   15,
       16,    4,   17,    4,   18,   19,    4,   20,    4,   21,
       22,    4,    4,    4,   23,   24,   25,   29,  104,   30,
       31,   31,   31,   33,   33,   33,   33,   32,   34,   29,
      103,   32,   35,   29,   43,   30,   36,   36,   30,   32,
       39,   39,   29,   32,  102,   44,   33,   33,   33,   33,
       30,   30,   32,  101,   32,   39,   39,   37,   33,   33,
       33,   33,   53,   53,   53,  100,   32,   40,   40,   40,
       40,  105,   40,   40,   40,   40,   50,   99,   98,   97,

       64,   27,   27,   27,   27,   27,   27,   38,   38,   96,
       38,   40,   95,   40,   49,   49,   49,   49,   49,   49,
       51,   51,   51,   51,   51,   51,   54,   54,   54,   63,
       63,   63,   63,   63,   63,   94,   93,   92,   91,   90,
       89,   88,   87,   86,   85,   84,   83,   82,   81,   80,
       79,   78,   77,   76,   75,   74,   73,   50,   72,   71,
       70,   69,   68,   67,   66,   65,   52,   50,   62,   61,
       60,   59,   58,   57,   56,   55,   52,   50,   28,   26,
       48,   47,   46,   45,   42,   41,   28,   26,  105,    3,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105
    ) ;

yy_chk : constant array(0..227) of Short :=
    (   0,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
        1,    1,    1,    1,    1,    1,    1,   10,  103,   10,
       10,   10,   10,   11,   11,   11,   11,   10,   12,   14,
      101,   11,   12,   13,   18,   13,   13,   13,   13,   14,
       15,   15,   31,   13,  100,   18,   29,   29,   29,   29,
       30,   30,   31,   99,   29,   32,   32,   13,   33,   33,
       33,   33,   36,   36,   36,   98,   33,   39,   39,   39,
       39,   30,   40,   40,   40,   40,   50,   97,   95,   94,

       50,  106,  106,  106,  106,  106,  106,  107,  107,   93,
      107,  108,   92,  108,  109,  109,  109,  109,  109,  109,
      110,  110,  110,  110,  110,  110,  111,  111,  111,  112,
      112,  112,  112,  112,  112,   91,   90,   89,   88,   87,
       86,   85,   84,   83,   82,   81,   80,   79,   78,   75,
       74,   71,   69,   68,   67,   66,   65,   63,   62,   61,
       60,   59,   58,   57,   56,   55,   51,   49,   48,   47,
       46,   45,   44,   43,   42,   41,   35,   34,   27,   26,
       22,   21,   20,   19,   17,   16,    7,    5,    3,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
      105,  105,  105,  105,  105,  105,  105
    ) ;


-- copy whatever the last rule matched to the standard output

procedure ECHO is
begin
   if Text_IO.is_open(user_output_file) then
     Text_IO.put( user_output_file, yytext );
   else
     Text_IO.put( yytext );
   end if;
end ECHO;

-- enter a start condition.
-- Using procedure requires a () after the ENTER, but makes everything
-- much neater.

procedure ENTER( state : integer ) is
begin
     yy_start := 1 + 2 * state;
end ENTER;

-- action number for EOF rule of a given start state
function YY_STATE_EOF(state : integer) return integer is
begin
     return YY_END_OF_BUFFER + state + 1;
end YY_STATE_EOF;

-- return all but the first 'n' matched characters back to the input stream
procedure yyless(n : integer) is
begin
        yy_ch_buf(yy_cp) := yy_hold_char; -- undo effects of setting up yytext
        yy_cp := yy_bp + n;
        yy_c_buf_p := yy_cp;
        YY_DO_BEFORE_ACTION; -- set up yytext again
end yyless;

-- redefine this if you have something you want each time.
procedure YY_USER_ACTION is
begin
        null;
end;

-- yy_get_previous_state - get the state just before the EOB char was reached

function yy_get_previous_state return yy_state_type is
    yy_current_state : yy_state_type;
    yy_c : short;
begin
    yy_current_state := yy_start;

    for yy_cp in yytext_ptr..yy_c_buf_p - 1 loop
	yy_c := yy_ec(yy_ch_buf(yy_cp));
	if yy_accept(yy_current_state) /= 0 then
	    yy_last_accepting_state := yy_current_state;
	    yy_last_accepting_cpos := yy_cp;
	end if;
	while yy_chk(yy_base(yy_current_state) + yy_c) /= yy_current_state loop
	    yy_current_state := yy_def(yy_current_state);
	    if ( yy_current_state >= 106 ) then
		yy_c := yy_meta(yy_c);
	    end if;
	end loop;
	yy_current_state := yy_nxt(yy_base(yy_current_state) + yy_c);
    end loop;

    return yy_current_state;
end yy_get_previous_state;

procedure yyrestart( input_file : file_type ) is
begin
   open_input(Text_IO.name(input_file));
end yyrestart;

begin -- of YYLex
<<new_file>>
        -- this is where we enter upon encountering an end-of-file and
        -- yywrap() indicating that we should continue processing

    if yy_init then
        if yy_start = 0 then
            yy_start := 1;      -- first start state
        end if;

        -- we put in the '\n' and start reading from [1] so that an
        -- initial match-at-newline will be true.

        yy_ch_buf(0) := ASCII.LF;
        yy_n_chars := 1;

        -- we always need two end-of-buffer characters. The first causes
        -- a transition to the end-of-buffer state. The second causes
        -- a jam in that state.

        yy_ch_buf(yy_n_chars) := YY_END_OF_BUFFER_CHAR;
        yy_ch_buf(yy_n_chars + 1) := YY_END_OF_BUFFER_CHAR;

        yy_eof_has_been_seen := false;

        yytext_ptr := 1;
        yy_c_buf_p := yytext_ptr;
        yy_hold_char := yy_ch_buf(yy_c_buf_p);
        yy_init := false;
-- UMASS CODES :
--   Initialization
        tok_begin_line := 1;
        tok_end_line := 1;
        tok_begin_col := 0;
        tok_end_col := 0;
        token_at_end_of_line := false;
        line_number_of_saved_tok_line1 := 0;
        line_number_of_saved_tok_line2 := 0;
-- END OF UMASS CODES.
    end if; -- yy_init

    loop                -- loops until end-of-file is reached

-- UMASS CODES :
--    if last matched token is end_of_line, we must
--    update the token_end_line and reset tok_end_col.
    if Token_At_End_Of_Line then
      Tok_End_Line := Tok_End_Line + 1;
      Tok_End_Col := 0;
      Token_At_End_Of_Line := False;
    end if;
-- END OF UMASS CODES.

        yy_cp := yy_c_buf_p;

        -- support of yytext
        yy_ch_buf(yy_cp) := yy_hold_char;

        -- yy_bp points to the position in yy_ch_buf of the start of the
        -- current run.
	yy_bp := yy_cp;
	yy_current_state := yy_start;
	loop
		yy_c := yy_ec(yy_ch_buf(yy_cp));
		if yy_accept(yy_current_state) /= 0 then
		    yy_last_accepting_state := yy_current_state;
		    yy_last_accepting_cpos := yy_cp;
		end if;
		while yy_chk(yy_base(yy_current_state) + yy_c) /= yy_current_state loop
		    yy_current_state := yy_def(yy_current_state);
		    if ( yy_current_state >= 106 ) then
			yy_c := yy_meta(yy_c);
		    end if;
		end loop;
		yy_current_state := yy_nxt(yy_base(yy_current_state) + yy_c);
	    yy_cp := yy_cp + 1;
if ( yy_current_state = 105 ) then
    exit;
end if;
	end loop;
	yy_cp := yy_last_accepting_cpos;
	yy_current_state := yy_last_accepting_state;

<<next_action>>
	    yy_act := yy_accept(yy_current_state);
            YY_DO_BEFORE_ACTION;
            YY_USER_ACTION;

        if aflex_debug then  -- output acceptance info. for (-d) debug mode
            Text_IO.put( Standard_Error, "--accepting rule #" );
            Text_IO.put( Standard_Error, INTEGER'IMAGE(yy_act) );
            Text_IO.put_line( Standard_Error, "(""" & yytext & """)");
        end if;

-- UMASS CODES :
--   Update tok_begin_line, tok_end_line, tok_begin_col and tok_end_col
--   after matching the token.
        if yy_act /= YY_END_OF_BUFFER and then yy_act /= 0 then
-- Token are matched only when yy_act is not yy_end_of_buffer or 0.
          Tok_Begin_Line := Tok_End_Line;
          Tok_Begin_Col := Tok_End_Col + 1;
          Tok_End_Col := Tok_Begin_Col + yy_cp - yy_bp - 1;
          if yy_ch_buf ( yy_bp ) = ASCII.LF then
            Token_At_End_Of_Line := True;
          end if;
        end if;
-- END OF UMASS CODES.

<<do_action>>   -- this label is used only to access EOF actions
            case yy_act is
		when 0 => -- must backtrack
		-- undo the effects of YY_DO_BEFORE_ACTION
		yy_ch_buf(yy_cp) := yy_hold_char;
		yy_cp := yy_last_accepting_cpos;
		yy_current_state := yy_last_accepting_state;
		goto next_action;



-- /* ... */ -style comments
when 1 => 
--# line 17 "doom3.l"

         Doom3_Help.Doom3_Comment(YYText(3..YYLength-2));
         

-- // -style comment -> skip rest of line.
when 2 => 
--# line 22 "doom3.l"

         Doom3_Help.Doom3_Comment(YYText);
                      linenum:= linenum + 1;
         

when 3 => 
--# line 27 "doom3.l"
 return mapProcFile_t; 

when 4 => 
--# line 28 "doom3.l"
 return mapProcFile003_t; 

when 5 => 
--# line 29 "doom3.l"
 return model_t; 

when 6 => 
--# line 30 "doom3.l"
 return shadowModel_t; 

when 7 => 
--# line 31 "doom3.l"
 return interAreaPortals_t; 

when 8 => 
--# line 32 "doom3.l"
 return nodes_t; 

when 9 => 
--# line 35 "doom3.l"
 yylval.intval := 0; return NUMBER; 

when 10 => 
--# line 36 "doom3.l"
 yylval.intval := 1; return NUMBER; 

when 11 => 
--# line 38 "doom3.l"
 yylval.intval   := 0;
                   yylval.floatval := 0.0;
                   return NUMBER;
                 

when 12 => 
--# line 43 "doom3.l"
 begin
                     yylval.intval := Integer'Value(yytext);
                   exception
                     when Constraint_Error =>
                      -- declare
                      --   msg: constant String:=
                      --    "Error with integer ? [" & yytext & ']';
                      -- begin
                      --   Put_Line(Standard_Error, msg);
                      --   raise Constraint_Error with msg;
                      -- end;
                      yylval.intval := -1;
                      -- not nice at all, but a >2**31 number
                      -- seems to appear only at top (some checksum)
                   end;
                   yylval.floatval:= Long_Float( yylval.intval );
                   return NUMBER;

when 13 => 
--# line 61 "doom3.l"
 yylval.intval := Integer'Value("8#"&yytext&'#');
                   yylval.floatval:= Long_Float( yylval.intval );
                   return NUMBER;

when 14 => 
--# line 65 "doom3.l"

                   yylval.floatval := Long_Float'Value(yytext);
                   return FLOAT_t;
                   

when 15 => 
--# line 70 "doom3.l"
 yylval.intval := Integer'Value("16#"&yytext&'#');
                   yylval.floatval:= Long_Float( yylval.intval );
                   return NUMBER;

when 16 => 
--# line 74 "doom3.l"
return D3String;

when 17 => 
--# line 76 "doom3.l"
 null; -- \t  ;

when 18 => 
--# line 77 "doom3.l"
linenum:= linenum+1;

when 19 => 
--# line 79 "doom3.l"
 null; -- ??
                     -- C: return *yytext;
                   

when 20 => 
--# line 82 "doom3.l"
 return '('; 

when 21 => 
--# line 83 "doom3.l"
 return ')'; 

when 22 => 
--# line 84 "doom3.l"
 return '}'; 

when 23 => 
--# line 85 "doom3.l"
 return '{'; 

when 24 => 
--# line 87 "doom3.l"
ECHO;
when YY_END_OF_BUFFER + INITIAL + 1 => 
    return End_Of_Input;
                when YY_END_OF_BUFFER =>
                    -- undo the effects of YY_DO_BEFORE_ACTION
                    yy_ch_buf(yy_cp) := yy_hold_char;

                    yytext_ptr := yy_bp;

                    case yy_get_next_buffer is
                        when EOB_ACT_END_OF_FILE =>
                            begin
                            if yywrap then
                                -- note: because we've taken care in
                                -- yy_get_next_buffer() to have set up yytext,
                                -- we can now set up yy_c_buf_p so that if some
                                -- total hoser (like aflex itself) wants
                                -- to call the scanner after we return the
                                -- End_Of_Input, it'll still work - another
                                -- End_Of_Input will get returned.

                                yy_c_buf_p := yytext_ptr;

                                yy_act := YY_STATE_EOF((yy_start - 1) / 2);

                                goto do_action;
                            else
                                --  start processing a new file
                                yy_init := true;
                                goto new_file;
                            end if;
                            end;
                        when EOB_ACT_RESTART_SCAN =>
                            yy_c_buf_p := yytext_ptr;
                            yy_hold_char := yy_ch_buf(yy_c_buf_p);
                        when EOB_ACT_LAST_MATCH =>
                            yy_c_buf_p := yy_n_chars;
                            yy_current_state := yy_get_previous_state;

                            yy_cp := yy_c_buf_p;
                            yy_bp := yytext_ptr;
                            goto next_action;
                        when others => null;
                        end case; -- case yy_get_next_buffer()
                when others =>
                    Text_IO.put( "action # " );
                    Text_IO.put( INTEGER'IMAGE(yy_act) );
                    Text_IO.new_line;
                    raise AFLEX_INTERNAL_ERROR;
            end case; -- case (yy_act)
        end loop; -- end of loop waiting for end of file
end YYLex;
--# line 87 "doom3.l"
