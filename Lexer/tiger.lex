
type pos = int
type lexresult = Tokens.token

val lineNum = ErrorMsg.lineNum
val linePos = ErrorMsg.linePos
fun err(p1,p2) = ErrorMsg.error p1

val commentNestingDepth = ref 0
val stringBuf = ref ""
val stringStartPos = ref 0
val inString = ref false

fun eof() = 
    let 
        val pos = hd(!linePos) 
    in 
        if !inString then
            (ErrorMsg.error (!stringStartPos) "unterminated string"; 
            inString := false; 
            Tokens.STRING(!stringBuf, !stringStartPos, pos))
        else if !commentNestingDepth > 0 then
            (ErrorMsg.error pos "unclosed comment";
             Tokens.EOF(pos,pos))
        else
            Tokens.EOF(pos,pos) 
    end

%% 
%s COMMENTS STRING;

%%

<COMMENTS, INITIAL> \n	=> (lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
<COMMENTS, INITIAL>[ \t\r]+	=> (continue());

<INITIAL>"/*"	=> (commentNestingDepth := 1; YYBEGIN COMMENTS; continue());
<COMMENTS>"/*"	=> (commentNestingDepth := !commentNestingDepth + 1; continue());
<COMMENTS>"*/"	=> (commentNestingDepth := !commentNestingDepth - 1; if !commentNestingDepth = 0 then (YYBEGIN INITIAL; continue()) else continue());
<COMMENTS>.    => (continue());

<INITIAL>"\"" => (stringBuf := ""; stringStartPos := yypos; inString := true; YYBEGIN STRING; continue());
<STRING>"\"" => (inString := false; YYBEGIN INITIAL; Tokens.STRING(!stringBuf, !stringStartPos, yypos+1));
<STRING>\\\n[ \t\r\f]*\\ => (
    let 
        fun countNewLines(s, count) = 
            if String.size s = 0 then count
            else if String.sub(s, 0) = #"\n" then 
                countNewLines(String.extract(s, 1, NONE), count + 1)
            else 
                countNewLines(String.extract(s, 1, NONE), count)
        val formatChars = String.substring(yytext, 1, size yytext - 2)
        val newlineCount = countNewLines(formatChars, 0)
    in 
        lineNum := !lineNum + newlineCount;
        linePos := yypos :: !linePos;
        continue()
    end
);
<STRING>\n => (stringBuf := !stringBuf ^ "\n"; lineNum := !lineNum+1; linePos := yypos :: !linePos; continue());
<STRING>"\\n" => (stringBuf := !stringBuf ^ "\n"; continue());
<STRING>"\\t" => (stringBuf := !stringBuf ^ "\t"; continue());
<STRING>"\\r" => (stringBuf := !stringBuf ^ "\r"; continue());
<STRING>"\\\"" => (stringBuf := !stringBuf ^ "\""; continue());
<STRING>"\\\\" => (stringBuf := !stringBuf ^ "\\" ; continue());
<STRING>"\\\^[A-Z]" => (
    let 
        val c = Char.chr (Char.ord (String.sub(yytext, 2)) - Char.ord #"@")
    in
        stringBuf := !stringBuf ^ str c;
        continue()
    end
);
<STRING>\\[0-9][0-9][0-9] => (
    let 
        val code = valOf(Int.fromString(substring(yytext, 1, 3)))
    in
        if code > 255 then
            (ErrorMsg.error yypos "ASCII code out of range"; continue())
        else 
            (stringBuf := !stringBuf ^ str (Char.chr code); continue())
    end
);
<STRING>"\\"[^\n] => (ErrorMsg.error yypos ("illegal escape sequence " ^ yytext); stringBuf := !stringBuf ^ str(String.sub(yytext, 1)); continue());
<STRING>[^\n\\\\\"]+ => (stringBuf := !stringBuf ^ yytext; continue());


<INITIAL>"type"	=> (Tokens.TYPE(yypos,yypos+4));
<INITIAL>"var"	=> (Tokens.VAR(yypos,yypos+3));
<INITIAL>"function"	=> (Tokens.FUNCTION(yypos,yypos+8));
<INITIAL>"break"	=> (Tokens.BREAK(yypos,yypos+5));
<INITIAL>"of"	=> (Tokens.OF(yypos,yypos+2));
<INITIAL>"end"	=> (Tokens.END(yypos,yypos+3));
<INITIAL>"in"	=> (Tokens.IN(yypos,yypos+2));
<INITIAL>"nil"	=> (Tokens.NIL(yypos,yypos+3));
<INITIAL>"let"	=> (Tokens.LET(yypos,yypos+3));
<INITIAL>"do"	=> (Tokens.DO(yypos,yypos+2));
<INITIAL>"to"	=> (Tokens.TO(yypos,yypos+2));
<INITIAL>"for"	=> (Tokens.FOR(yypos,yypos+3));
<INITIAL>"while"	=> (Tokens.WHILE(yypos,yypos+5));
<INITIAL>"else"	=> (Tokens.ELSE(yypos,yypos+4));
<INITIAL>"then"	=> (Tokens.THEN(yypos,yypos+4));
<INITIAL>"if"	=> (Tokens.IF(yypos,yypos+2));
<INITIAL>"array"	=> (Tokens.ARRAY(yypos,yypos+5));
<INITIAL>":="	=> (Tokens.ASSIGN(yypos,yypos+2));
<INITIAL>"|"	=> (Tokens.OR(yypos,yypos+1));
<INITIAL>"&"	=> (Tokens.AND(yypos,yypos+1));
<INITIAL>"<>"	=> (Tokens.NEQ(yypos,yypos+2));
<INITIAL>">="	=> (Tokens.GE(yypos,yypos+2));
<INITIAL>">"	=> (Tokens.GT(yypos,yypos+1));
<INITIAL>"<="	=> (Tokens.LE(yypos,yypos+2));
<INITIAL>"<"	=> (Tokens.LT(yypos,yypos+1));
<INITIAL>"="	=> (Tokens.EQ(yypos,yypos+1));
<INITIAL>"/"	=> (Tokens.DIVIDE(yypos,yypos+1));
<INITIAL>"*"	=> (Tokens.TIMES(yypos,yypos+1));
<INITIAL>"-"	=> (Tokens.MINUS(yypos,yypos+1));
<INITIAL>"+"	=> (Tokens.PLUS(yypos,yypos+1));
<INITIAL>"}"	=> (Tokens.RBRACE(yypos,yypos+1));
<INITIAL>"{"	=> (Tokens.LBRACE(yypos,yypos+1));
<INITIAL>"]"	=> (Tokens.RBRACK(yypos,yypos+1));
<INITIAL>"["	=> (Tokens.LBRACK(yypos,yypos+1));
<INITIAL>")"	=> (Tokens.RPAREN(yypos,yypos+1));
<INITIAL>"("	=> (Tokens.LPAREN(yypos,yypos+1));
<INITIAL>";"	=> (Tokens.SEMICOLON(yypos,yypos+1));
<INITIAL>":"	=> (Tokens.COLON(yypos,yypos+1));
<INITIAL>","	=> (Tokens.COMMA(yypos,yypos+1));
<INITIAL>"."    => (Tokens.DOT(yypos,yypos+1));

<INITIAL>[0-9]+ => (Tokens.INT(valOf(Int.fromString(yytext)), yypos, yypos+size yytext));
<INITIAL>[a-zA-Z_][a-zA-Z0-9_]* => (Tokens.ID(yytext, yypos, yypos+size yytext));

<INITIAL>.       => (ErrorMsg.error yypos ("illegal character " ^ yytext); continue());
