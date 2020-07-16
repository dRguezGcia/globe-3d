
-- wrl2ada

with VRML_Tokens, VRML_Shift_Reduce, VRML_Goto, VRML_Help, VRML_IO;
use  VRML_Tokens, VRML_Shift_Reduce, VRML_Goto, VRML_Help, VRML_IO;

with VRML_DFA, YYroutines, YYerror;
use  VRML_DFA, YYroutines;

with Ada.Text_IO;                       use Ada.Text_IO;
with Text_IO; -- for compat.

with Ada.Characters.Handling;           use Ada.Characters.Handling;
with Ada.Strings.Fixed;                 use Ada.Strings, Ada.Strings.Fixed;

with Interfaces;                        use Interfaces;

--yyerror(char *s) 
--{ 
--  extern  char    yytext[];
--  int linenum;
--  char *ff;

--  linenum = vrml_filel_linenum(&ff);
--  fprintf(stderr, "%s:%d: Error:\n%s at or before '%s'\n\n\n", 
--	  ff,linenum, (char *)s, *yytext=='\n'? "\\n": yytext); 
--  return;
--}

--  Warning: This file is automatically generated by AYACC.
--           It is useless to modify it. Change the ".Y" & ".L" files instead.

with YY_Sizes;
-- ^ 14-Jan-2006 (GdM): configurable sizes instead of hard-coded
--   ones in AYACC's output

procedure YYParse is

   -- Rename User Defined Packages to Internal Names.
    package yy_goto_tables         renames
      Vrml_Goto;
    package yy_shift_reduce_tables renames
      Vrml_Shift_Reduce;
    package yy_tokens              renames
      Vrml_Tokens;
    package yy_io                  renames -- (+GdM 2008)
      Vrml_IO;

   use yy_tokens, yy_goto_tables, yy_shift_reduce_tables;

   procedure yyerrok;
   procedure yyclearin;


   package yy is

       -- the size of the value and state stacks
       --  Affects error 'Stack size exceeded on state_stack'
       stack_size : constant Natural := yy_sizes.stack_size; -- was 300, then 8192

       -- subtype rule         is natural;
       subtype parse_state  is natural;
       -- subtype nonterminal  is integer;

       -- encryption constants
       default           : constant := -1;
       first_shift_entry : constant :=  0;
       accept_code       : constant := -3001;
       error_code        : constant := -3000;

       -- stack data used by the parser
       tos                : natural := 0;
       value_stack        : array(0..stack_size) of yy_tokens.yystype;
       state_stack        : array(0..stack_size) of parse_state;

       -- current input symbol and action the parser is on
       action             : integer;
       rule_id            : rule;
       input_symbol       : yy_tokens.token:= Error;


       -- error recovery flag
       error_flag : natural := 0;
          -- indicates  3 - (number of valid shifts after an error occurs)

       look_ahead : boolean := true;
       index      : integer;

       -- Is Debugging option on or off
        DEBUG : constant boolean := FALSE;

    end yy;


    function goto_state
      (state : yy.parse_state;
       sym   : nonterminal) return yy.parse_state;

    function parse_action
      (state : yy.parse_state;
       t     : yy_tokens.token) return integer;

    pragma inline(goto_state, parse_action);


    function goto_state(state : yy.parse_state;
                        sym   : nonterminal) return yy.parse_state is
        index : integer;
    begin
        index := goto_offset(state);
        while  integer(goto_matrix(index).nonterm) /= sym loop
            index := index + 1;
        end loop;
        return integer(goto_matrix(index).newstate);
    end goto_state;


    function parse_action(state : yy.parse_state;
                          t     : yy_tokens.token) return integer is
        index      : integer;
        tok_pos    : integer;
        default    : constant integer := -1;
    begin
        tok_pos := yy_tokens.token'pos(t);
        index   := shift_reduce_offset(state);
        while integer(shift_reduce_matrix(index).t) /= tok_pos and then
              integer(shift_reduce_matrix(index).t) /= default
        loop
            index := index + 1;
        end loop;
        return integer(shift_reduce_matrix(index).act);
    end parse_action;

-- error recovery stuff

    procedure handle_error is
      temp_action : integer;
    begin

      if yy.error_flag = 3 then -- no shift yet, clobber input.
      if yy.debug then
          text_io.put_line("  -- Ayacc.YYParse: Error Recovery Clobbers " &
                   yy_tokens.token'image(yy.input_symbol));
      end if;
        if yy.input_symbol = yy_tokens.end_of_input then  -- don't discard,
        if yy.debug then
            text_io.put_line("  -- Ayacc.YYParse: Can't discard END_OF_INPUT, quiting...");
        end if;
        raise yy_tokens.syntax_error;
        end if;

            yy.look_ahead := true;   -- get next token
        return;                  -- and try again...
    end if;

    if yy.error_flag = 0 then -- brand new error
        if yy_io.Input_Line > 1 then
            yyerror("Syntax Error at line" & Text_IO.Count'Image(yy_io.Input_Line));
        else
            yyerror("Syntax Error at line 1 (or possibly later and the AFLex -E option was omitted).");
        end if;
    end if;

    yy.error_flag := 3;

    -- find state on stack where error is a valid shift --

    if yy.debug then
        text_io.put_line("  -- Ayacc.YYParse: Looking for state with error as valid shift");
    end if;

    loop
        if yy.debug then
          text_io.put_line("  -- Ayacc.YYParse: Examining State " &
               yy.parse_state'image(yy.state_stack(yy.tos)));
        end if;
        temp_action := parse_action(yy.state_stack(yy.tos), error);

            if temp_action >= yy.first_shift_entry then
                if yy.tos = yy.stack_size then
                    text_io.put_line("  -- Ayacc.YYParse: Stack size exceeded on state_stack");
                    raise yy_Tokens.syntax_error;
                end if;
                yy.tos := yy.tos + 1;
                yy.state_stack(yy.tos) := temp_action;
                exit;
            end if;

        Decrement_Stack_Pointer :
        begin
          yy.tos := yy.tos - 1;
        exception
          when Constraint_Error =>
            yy.tos := 0;
        end Decrement_Stack_Pointer;

        if yy.tos = 0 then
          if yy.debug then
            text_io.put_line("  -- Ayacc.YYParse: Error recovery popped entire stack, aborting...");
          end if;
          raise yy_tokens.syntax_error;
        end if;
    end loop;

    if yy.debug then
        text_io.put_line("  -- Ayacc.YYParse: Shifted error token in state " &
              yy.parse_state'image(yy.state_stack(yy.tos)));
    end if;

    end handle_error;

   -- print debugging information for a shift operation
   procedure shift_debug(state_id: yy.parse_state; lexeme: yy_tokens.token) is
   begin
       text_io.put_line("  -- Ayacc.YYParse: Shift "& yy.parse_state'image(state_id)&" on input symbol "&
               yy_tokens.token'image(lexeme) );
   end;

   -- print debugging information for a reduce operation
   procedure reduce_debug(rule_id: rule; state_id: yy.parse_state) is
   begin
       text_io.put_line("  -- Ayacc.YYParse: Reduce by rule "&rule'image(rule_id)&" goto state "&
               yy.parse_state'image(state_id));
   end;

   -- make the parser believe that 3 valid shifts have occured.
   -- used for error recovery.
   procedure yyerrok is
   begin
       yy.error_flag := 0;
   end yyerrok;

   -- called to clear input symbol that caused an error.
   procedure yyclearin is
   begin
       -- yy.input_symbol := yylex;
       yy.look_ahead := true;
   end yyclearin;


begin
    -- initialize by pushing state 0 and getting the first input symbol
    yy.state_stack(yy.tos) := 0;


    loop

        yy.index := shift_reduce_offset(yy.state_stack(yy.tos));
        if integer(shift_reduce_matrix(yy.index).t) = yy.default then
            yy.action := integer(shift_reduce_matrix(yy.index).act);
        else
            if yy.look_ahead then
                yy.look_ahead   := false;

                yy.input_symbol := yylex;
            end if;
            yy.action :=
             parse_action(yy.state_stack(yy.tos), yy.input_symbol);
        end if;


        if yy.action >= yy.first_shift_entry then  -- SHIFT

            if yy.debug then
                shift_debug(yy.action, yy.input_symbol);
            end if;

            -- Enter new state
            if yy.tos = yy.stack_size then
                text_io.put_line(" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.tos := yy.tos + 1;
            yy.state_stack(yy.tos) := yy.action;
              yy.value_stack(yy.tos) := yylval;

        if yy.error_flag > 0 then  -- indicate a valid shift
            yy.error_flag := yy.error_flag - 1;
        end if;

            -- Advance lookahead
            yy.look_ahead := true;

        elsif yy.action = yy.error_code then       -- ERROR

            handle_error;

        elsif yy.action = yy.accept_code then
            if yy.debug then
                text_io.put_line("  -- Ayacc.YYParse: Accepting Grammar...");
            end if;
            exit;

        else -- Reduce Action

            -- Convert action into a rule
            yy.rule_id  := -1 * yy.action;

            -- Execute User Action
            -- user_action(yy.rule_id);


                case yy.rule_id is

when 1 => -- #line 74
VRML_Help.YY_ACCEPT;

when 2 => -- #line 75
VRML_Help.YY_ABORT;

when 65 => -- #line 176
 Ada_Put_Line(
         "coord_" & Trim(Natural'Image(sepa_count), Left) &
         ": constant Point_3D_array:= "
       );
       indent:= indent + 1;
     

when 66 => -- #line 183
 indent:= indent - 1;
       Ada_Put_Line(";"); 

when 96 => -- #line 253
  indent:= indent - 1;
                 Ada_New_Line;
                 indent:= indent + 1;
                 Ada_Put_Line(
                   "idx_" & Trim(Natural'Image(sepa_count), Left) &
                   ": constant Idx_4_array_array:= "
                 );
                 indent:= indent + 1;
                 Reset_index_grouping;
              

when 97 => -- #line 264
  indent:= indent - 1;
                 idx_last_sepa:= idx_last_sepa + sepa_points(sepa_count);
                 Ada_Put_Line(";");
              

when 109 => -- #line 295
VRML_Info(YYText);

when 122 => -- #line 329
current_matos.ambient  := last_color; 

when 123 => -- #line 331
current_matos.diffuse  := last_color; 

when 124 => -- #line 333
current_matos.specular := last_color; 

when 125 => -- #line 335
current_matos.emission := last_color; 

when 126 => -- #line 337
current_matos.shininess:= yylval.floatval * 128.0; 

when 127 => -- #line 339
current_matos.ambient(3) := 1.0 - yylval.floatval;
               current_matos.diffuse(3) := current_matos.ambient(3);
               current_matos.specular(3):= current_matos.ambient(3);
               current_matos.emission(3):= current_matos.ambient(3);
              

when 128 => -- #line 347

               Sepa_matos_defined(sepa_count):= True;
               current_matos:= default_material;
               indent:= indent - 1;
               Ada_New_Line;
               indent:= indent + 1;
               Ada_Put_Line(
                 "matos_" & Trim(Natural'Image(sepa_count), Left) &
                 ": constant Material_type:= (" );
              

when 129 => -- #line 358
 indent:= indent + 1;
               Ada_Put_Line("ambient =>   " & RGBA(current_matos.ambient) & ',');
               Ada_Put_Line("specular =>  " & RGBA(current_matos.specular) & ',');
               Ada_Put_Line("diffuse =>   " & RGBA(current_matos.diffuse) & ',');
               Ada_Put_Line("emission =>  " & RGBA(current_matos.emission) & ',');
               Ada_Put_Line("shininess => " & Image(current_matos.shininess));
               indent:= indent - 1;
               Ada_Put_Line(");");
             

when 142 => -- #line 401
 indent:= indent - 1;
               Ada_New_Line;
               indent:= indent + 1;
               Ada_Put_Line(
                "normal_" & Trim(Natural'Image(sepa_count), Left) &
                 ": constant Vector_3D_array:= "
               );
               indent:= indent + 1;
             

when 143 => -- #line 411
 indent:= indent - 1;
               Ada_Put_Line(";"); 

when 186 => -- #line 513
 sepa_count:= sepa_count + 1;
                 Ada_comment("begin Separator #" & Natural'Image(sepa_count));
                 indent:= indent + 1;
               

when 187 => -- #line 520
 Ada_comment("last index now:" & Natural'Image(idx_last_sepa));
                 indent:= indent - 1;
                 Ada_comment("end Separator #" & Natural'Image(sepa_count));
               

when 191 => -- #line 534
 current_shape_hints.ordering:=
                VRML_vertex_ordering'Val(yylval.intval);
              

when 195 => -- #line 543
 current_shape_hints:= default_shape_hints; 

when 259 => -- #line 690

            declare
              img: constant String:=
                Unsigned_32'Image(
                  Unsigned_32'Value(
yy.value_stack(yy.tos-2).text(1..
yy.value_stack(yy.tos-2).length))
                    or
                  Unsigned_32'Value(
yy.value_stack(yy.tos).text(1..
yy.value_stack(yy.tos).length))
                );
            begin
              
yyval.length := img'Length;
              
yyval.text(1..img'Length) := img;
              --  Single Value Fields / bitmasklist
            end;
            

when 261 => -- #line 707

yyval := 
yy.value_stack(yy.tos-1);

when 263 => -- #line 714
 last_color(0):= yylval.floatval; 

when 264 => -- #line 716
 last_color(1):= yylval.floatval; 

when 265 => -- #line 718
 last_color(2):= yylval.floatval;
                last_color(3):= 1.0;
                -- alpha is determined by the Transparency field;
                -- alpha=1 <-> Transparency=0 (default)
              

when 268 => -- #line 729

yyval := (
yy.value_stack(yy.tos)); -- Float
            

when 269 => -- #line 733
 null; 

when 271 => -- #line 737
 null; 

when 273 => -- #line 747
 null; 
                -- SFMatrix
              

when 274 => -- #line 752
 null; 

when 276 => -- #line 758
 null; 

when 277 => -- #line 762
 last_pt(0):= yylval.floatval; 

when 278 => -- #line 764
 last_pt(1):= yylval.floatval; 

when 279 => -- #line 766
 last_pt(2):= yylval.floatval; 

when 284 => -- #line 778
 null; 

when 285 => -- #line 779
 null; 

when 286 => -- #line 782
 null; 

when 287 => -- #line 783
 null; 

when 288 => -- #line 786

              Point_index(yylval.intval);
              -- last index, should be end of last group
              Ada_Comment(Integer'Image(sepa_polys(sepa_count)));
              

when 289 => -- #line 792
 Point_index(yylval.intval);
               if flag_group then
                 -- we just finished a group, not the last one
                 if pretty then
                   Ada_Put(", ");
                   if sepa_polys(sepa_count) mod 4 = 0 then
                     Ada_Comment(Integer'Image(sepa_polys(sepa_count)));
                   end if;
                 else
                   Ada_Put(",");
                   if sepa_polys(sepa_count) mod 8 = 0 then
                     Ada_New_Line;
                   end if;
                 end if;
               end if;
             

when 290 => -- #line 808
 null; 

when 291 => -- #line 811
 Ada_Put("(1 => "); 

when 292 => -- #line 813
 Point_index(yylval.intval);
                Ada_Put(")"); 

when 293 => -- #line 816
 Ada_Put("( "); 

when 294 => -- #line 818
 Ada_Put(")"); 

when 295 => -- #line 819
 null; 

when 296 => -- #line 822
 null; 

when 297 => -- #line 823
 null; 

when 298 => -- #line 826
 null; 

when 299 => -- #line 827
 null; 

when 300 => -- #line 830
 null; 

when 301 => -- #line 831
 null; 

when 302 => -- #line 834
 null; 

when 303 => -- #line 835
 null; 

when 308 => -- #line 847
 Ada_Put_Line(Coords(last_pt)); 

when 309 => -- #line 849
 Ada_Put_Line(Coords(last_pt) & ","); 

when 311 => -- #line 854
 Ada_Put("(1 => "); 

when 312 => -- #line 856
 Ada_Put(")"); 

when 313 => -- #line 859
 Ada_Put("( "); 

when 314 => -- #line 861
 Ada_Put(")"); 

when 316 => -- #line 866
 Ada_Put(Coords(last_pt) & "  ");
                sepa_points(sepa_count):= sepa_points(sepa_count) + 1;
                Ada_Comment(Integer'Image(sepa_points(sepa_count)));
              

when 317 => -- #line 871
 sepa_points(sepa_count):= sepa_points(sepa_count) + 1;
                if pretty then
                  Ada_Put(Coords(last_pt) & ", ");
                  if sepa_points(sepa_count) mod 2 = 0 then
                    Ada_Comment(Integer'Image(sepa_points(sepa_count)));
                  end if;
                else
                  Ada_Put(Coords(last_pt) & ",");
                  if sepa_points(sepa_count) mod 5 = 0 then
                    Ada_New_Line;
                  end if;
                end if;
              

when 319 => -- #line 888
 Ada_Put("(1 => "); 

when 320 => -- #line 890
 Ada_Put(")");
                 sepa_points(sepa_count):= sepa_points(sepa_count) + 1;
                

when 321 => -- #line 895
 Ada_Put("( "); 

when 322 => -- #line 897
 Ada_Put(")"); 

                    when others => null;
                end case;


            -- Pop RHS states and goto next state
            yy.tos      := yy.tos - rule_length(yy.rule_id) + 1;
            if yy.tos > yy.stack_size then
                text_io.put_line(" Stack size exceeded on state_stack");
                raise yy_Tokens.syntax_error;
            end if;
            yy.state_stack(yy.tos) := goto_state(yy.state_stack(yy.tos-1) ,
                                 get_lhs_rule(yy.rule_id));

              yy.value_stack(yy.tos) := yyval;

            if yy.debug then
                reduce_debug(yy.rule_id,
                    goto_state(yy.state_stack(yy.tos - 1),
                               get_lhs_rule(yy.rule_id)));
            end if;

        end if;


    end loop;


end YYParse;
