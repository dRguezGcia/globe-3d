
-- D3a

with Doom3_Tokens, Doom3_Shift_Reduce, Doom3_Goto, Doom3_Help;
use  Doom3_Tokens, Doom3_Shift_Reduce, Doom3_Goto, Doom3_Help;

with Doom3_DFA, YYroutines, YYerror;
use  Doom3_DFA, YYroutines;

with Ada.Text_IO;                       use Ada.Text_IO;
with Text_IO; -- yyparse has this Ada 83 syntax

with Ada.Characters.Handling;           use Ada.Characters.Handling;
with Ada.Strings.Fixed;                 use Ada.Strings, Ada.Strings.Fixed;

with Interfaces;                        use Interfaces;

--  Warning: This file is automatically generated by AYACC.
--           It is useless to modify it. Change the ".Y" & ".L" files instead.

with yy_sizes; -- 14-Jan-2006 (GdM): flexible sizes instead of hard-coded

procedure YYParse is

   -- Rename User Defined Packages to Internal Names.
    package yy_goto_tables         renames
      Doom3_Goto;
    package yy_shift_reduce_tables renames
      Doom3_Shift_Reduce;
    package yy_tokens              renames
      Doom3_Tokens;

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
          text_io.put_line("Ayacc.YYParse: Error Recovery Clobbers " &
                   yy_tokens.token'image(yy.input_symbol));
      end if;
        if yy.input_symbol = yy_tokens.end_of_input then  -- don't discard,
        if yy.debug then
            text_io.put_line("Ayacc.YYParse: Can't discard END_OF_INPUT, quiting...");
        end if;
        raise yy_tokens.syntax_error;
        end if;

            yy.look_ahead := true;   -- get next token
        return;                  -- and try again...
    end if;

    if yy.error_flag = 0 then -- brand new error
        yyerror("Syntax Error");
    end if;

    yy.error_flag := 3;

    -- find state on stack where error is a valid shift --

    if yy.debug then
        text_io.put_line("Ayacc.YYParse: Looking for state with error as valid shift");
    end if;

    loop
        if yy.debug then
          text_io.put_line("Ayacc.YYParse: Examining State " &
               yy.parse_state'image(yy.state_stack(yy.tos)));
        end if;
        temp_action := parse_action(yy.state_stack(yy.tos), error);

            if temp_action >= yy.first_shift_entry then
                if yy.tos = yy.stack_size then
                    text_io.put_line(" Stack size exceeded on state_stack");
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
            text_io.put_line("Ayacc.YYParse: Error recovery popped entire stack, aborting...");
          end if;
          raise yy_tokens.syntax_error;
        end if;
    end loop;

    if yy.debug then
        text_io.put_line("Ayacc.YYParse: Shifted error token in state " &
              yy.parse_state'image(yy.state_stack(yy.tos)));
    end if;

    end handle_error;

   -- print debugging information for a shift operation
   procedure shift_debug(state_id: yy.parse_state; lexeme: yy_tokens.token) is
   begin
       text_io.put_line("Ayacc.YYParse: Shift "& yy.parse_state'image(state_id)&" on input symbol "&
               yy_tokens.token'image(lexeme) );
   end;

   -- print debugging information for a reduce operation
   procedure reduce_debug(rule_id: rule; state_id: yy.parse_state) is
   begin
       text_io.put_line("Ayacc.YYParse: Reduce by rule "&rule'image(rule_id)&" goto state "&
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
                text_io.put_line("Ayacc.YYParse: Accepting Grammar...");
            end if;
            exit;

        else -- Reduce Action

            -- Convert action into a rule
            yy.rule_id  := -1 * yy.action;

            -- Execute User Action
            -- user_action(yy.rule_id);


                case yy.rule_id is

when 1 => -- #line 53
Doom3_Help.YY_ACCEPT;

when 2 => -- #line 54
Doom3_Help.YY_ABORT;

when 6 => -- #line 70
 Put_Line( Standard_Error, "Scanning Proc 3 file (Doom 3)" ); 

when 7 => -- #line 77
 Put_Line( Standard_Error, "Scanning Proc 4+ file (Quake 4)" ); 

when 14 => -- #line 93
 Add_Model(YYText);
                 Put( Standard_Error, "- model: " & YYText );
                 if consider_current_model then

                   Ada_Build_Model_Header;



                 else
                   Put(Standard_Error, " (ignored) ");
                 end if;
               

when 15 => -- #line 106
 vertex_offset:= 1; -- includes numbering shift 0->1
                 Reset_surfaces;
                 total_points:= 0;
                 total_faces:= 0;
                 d3_total_points:= 0;
                 d3_total_faces:= 0;
               

when 16 => -- #line 115
 if consider_current_model then

                   Ada_Build_Model_Footer; -- generates Ada code to build model



                 end if;
                 Put_Line(
                   Standard_Error,
                   Integer'Image(total_Faces) & " triangles"
                 );
               

when 22 => -- #line 143
 Set_current_texture(YYTExt);

                 if consider_current_model then
                   Ada_Comment("Texture: " &
                     Get_current_texture
                   ); -- check
                 end if;

                 -- Put_Line( Standard_Error, "  - Texture " & Get_current_texture);
               

when 23 => -- #line 155
 num_vertices:= yylval.intval;
                 total_points:= total_points + num_vertices;
                 d3_total_points:= d3_total_points + num_vertices;
                

when 24 => -- #line 160

                 num_indices := yylval.intval;
                 total_faces:= total_faces + num_indices / 3;
                 d3_total_faces:= d3_total_faces + num_indices / 3;
                 if consider_current_model then
                   Add_surface(
                     Get_current_texture,
                     num_vertices,
                     num_indices / 3
                   );

                   Ada_Put_Line(
                     "Surface_" &
                     Image(surface_count) &
                     "_vertices: constant " &
                     "Surface_vertex_array:= ("
                   );

                 end if;
                 -- Put_Line( Standard_Error, "  - Vertices " & Image(num_vertices));
               

when 25 => -- #line 183

                 if consider_current_model then
                   Ada_Put_Line(
                     "Surface_" &
                     Image(surface_count) &
                     "_triangles: constant " &
                     "Triangle_array:= ("
                   );
                   triangle_count:= 0;
                 end if;
                 -- Put_Line( Standard_Error, "  - Indices " & Image(num_vertices));
               

when 26 => -- #line 198

                 if consider_current_model then
                   vertex_offset:= vertex_offset + num_vertices;
                   surface_count:= surface_count + 1;
                 end if;
               

when 27 => -- #line 209

                   if consider_current_model then Ada_Put_Line(","); end if;
                 

when 29 => -- #line 217

                   if consider_current_model then Ada_Put_Line(");"); end if;
                 

when 30 => -- #line 226

                  if consider_current_model then Ada_Put("("); end if;
                

when 31 => -- #line 231
 last_U:= Doom3_Help.Real(yylval.floatval); 

when 32 => -- #line 232
 last_V:= Doom3_Help.Real(1.0 - yylval.floatval); 

when 33 => -- #line 236

                  if consider_current_model then

                    Ada_Put(Coords(last_pt));
                    Ada_Put(",(" & Image(last_U) & ',' & Image(last_V) & ')');
                    Ada_Put(")");




                  end if;
                

when 37 => -- #line 272

                    if consider_current_model then

                      triangle_count:= triangle_count + 1;
                      Ada_Put_Triangle;
                      if triangle_count mod 4 = 0 then
                        Ada_Put_Line(",");
                      else
                        Ada_Put(",");
                      end if;



                    end if;
                  

when 39 => -- #line 290
 if consider_current_model then

                      triangle_count:= triangle_count + 1;
                      if triangle_count = 1 then
                        Ada_Put("1=>");
                      end if;
                      Ada_Put_Triangle;
                      Ada_Put_Line(");");



                    end if;
                  

when 40 => -- #line 307
 v1:= yylval.intval; 

when 41 => -- #line 309
 v2:= yylval.intval; 

when 42 => -- #line 311
 v3:= yylval.intval; 

when 46 => -- #line 340

                  -- Ada_Comment("done with 1 shadowvertex");
                  null;
                

when 51 => -- #line 357
 Put_Line( Standard_Error, "- Portals connecting areas (interAreaPortals)" ); 

when 52 => -- #line 362

                     Ada_Put_Line("procedure Define_IAPs is");
                     Ada_Put_Line("begin");
                     Ada_Put_Line("IAP:= new IAP_array'((");
                   

when 53 => -- #line 370

                     Ada_Put_Line("));");
                     Ada_Put_Line("end Define_IAPs;");
                   

when 55 => -- #line 381
 Ada_Put_Line(","); 

when 58 => -- #line 390

                      iap_points:= yylval.intval;
                      if iap_points /= 4 then
                        -- ^ Supposed to be 4 (usual),
                        -- if not, some modification is needed

                        Ada_Comment("CAUTION ! Portal with /= 4 points not supported");



                      end if;



                    

when 59 => -- #line 406

                      iap_pos:= yylval.intval;

                      if pretty then
                        Ada_Put("( positive_side => ");
                      else
                        Ada_Put("(");
                      end if;
                      Ada_Put(iap_pos);

                    

when 60 => -- #line 418

                      iap_neg:= yylval.intval;

                      if pretty then
                        Ada_Put(", negative_side => ");
                      else
                        Ada_Put(",");
                      end if;
                      Ada_Put(iap_neg);
                      if pretty then
                        Ada_Put_Line(", point => (");
                      else
                        Ada_Put(",(");
                      end if;

                    

when 61 => -- #line 435

                      Add_IAP;

                      Ada_Put(")");

                    

when 62 => -- #line 445
 Ada_Put_Line(","); 

when 64 => -- #line 451
 Ada_Put_Line(")"); 

when 65 => -- #line 458


                    Ada_Put(Coords(last_pt));



                  

when 67 => -- #line 474
 Put_Line( Standard_Error, "- Binary Space Partition tree" ); 

when 68 => -- #line 477


                     Ada_Put_Line("D3_BSP_node: D3_BSP_node_array:= (");










                   

when 69 => -- #line 493
 Ada_Put_Line(");"); 

when 71 => -- #line 501
 Ada_Put_Line(","); 

when 74 => -- #line 520


                      Ada_Put("(");



                    

when 75 => -- #line 529


                      if pretty then Ada_Put(" positive_child => "); end if;
                      Ada_Put(yylval.intval);



                    

when 76 => -- #line 538


                      Ada_Put(",");
                      if pretty then Ada_Put(" negative_child => "); end if;
                      Ada_Put(yylval.intval);
                      Ada_Put(")");




                    

when 77 => -- #line 555

                  last_d:= Doom3_Help.Real(yylval.floatval);

                  if pretty then Ada_Put(" normal => "); end if;
                  Ada_Put(Coords(last_pt));
                  Ada_Put(",");
                  if pretty then Ada_Put(" distance => "); end if;
                  Ada_Put(Image(last_d));
                  Ada_Put(",");

                

when 79 => -- #line 576
 last_pt(2):= Doom3_Help.Real(yylval.floatval); 

when 80 => -- #line 577
 last_pt(0):= Doom3_Help.Real(yylval.floatval); 

when 81 => -- #line 578
 last_pt(1):= Doom3_Help.Real(yylval.floatval); 

when 83 => -- #line 583

yyval := (
yy.value_stack(yy.tos)); -- Float
                

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


end yyparse;
