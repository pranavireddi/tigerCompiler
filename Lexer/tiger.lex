(* TODO: Things we also need to include beyond the general lexer behavior:
• how you handle comments;
• how you handle strings;
• error handling;
• end-of-file handling;
• other interesting features of your lexer. *)

type pos = int
type lexresult = Tokens.token

val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1

fun eof() = let val pos = hd(!linePos) in Tokens.EOF(pos,pos) end


%% 
(* NOTE: this is sorta where we define things like digits (sorta like regex macros?) *)

%%
(* NOTE: this is the regex rules section. need to make sure that we, at minimum, have rules defined for all the tokens in tokens.sig *)

\n	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
","	=> (Tokens.COMMA(yypos,yypos+1));
var  	=> (Tokens.VAR(yypos,yypos+3));
"123"	=> (Tokens.INT(123,yypos,yypos+3));
.       => (ErrorMsg.error yypos ("illegal character " ^ yytext); continue());

