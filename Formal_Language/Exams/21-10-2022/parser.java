
//----------------------------------------------------
// The following code was generated by CUP v0.11b beta 20140226
//----------------------------------------------------

import java_cup.runtime.*;
import java.util.*;
import java.io.*;
import java_cup.runtime.XMLElement;

/** CUP v0.11b beta 20140226 generated parser.
  */
@SuppressWarnings({"rawtypes"})
public class parser extends java_cup.runtime.lr_parser {

 public final Class getSymbolContainer() {
    return sym.class;
}

  /** Default constructor. */
  @Deprecated
  public parser() {super();}

  /** Constructor which sets the default scanner. */
  @Deprecated
  public parser(java_cup.runtime.Scanner s) {super(s);}

  /** Constructor which sets the default scanner. */
  public parser(java_cup.runtime.Scanner s, java_cup.runtime.SymbolFactory sf) {super(s,sf);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\037\000\002\002\004\000\002\002\005\000\002\002" +
    "\004\000\002\003\003\000\002\003\003\000\002\003\003" +
    "\000\002\011\014\000\002\012\006\000\002\013\003\000" +
    "\002\014\002\000\002\014\005\000\002\014\005\000\002" +
    "\004\006\000\002\004\005\000\002\005\003\000\002\005" +
    "\003\000\002\006\006\000\002\007\005\000\002\010\013" +
    "\000\002\010\014\000\002\015\005\000\002\015\005\000" +
    "\002\015\005\000\002\015\004\000\002\015\003\000\002" +
    "\015\003\000\002\015\003\000\002\015\003\000\002\016" +
    "\006\000\002\017\003\000\002\017\005" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\117\000\012\004\ufff8\005\ufff8\006\ufff8\007\ufff8\001" +
    "\002\000\006\004\ufffc\006\117\001\002\000\012\004\ufff9" +
    "\005\107\006\ufff9\007\105\001\002\000\006\004\ufffd\006" +
    "\102\001\002\000\004\002\101\001\002\000\004\004\ufffe" +
    "\001\002\000\004\004\012\001\002\000\010\002\uffff\014" +
    "\015\033\020\001\002\000\010\002\ufff3\014\ufff3\033\ufff3" +
    "\001\002\000\006\014\015\033\020\001\002\000\016\017" +
    "\027\022\023\024\026\026\024\027\025\033\030\001\002" +
    "\000\010\002\ufff2\014\ufff2\033\ufff2\001\002\000\010\002" +
    "\000\014\015\033\020\001\002\000\004\013\021\001\002" +
    "\000\016\017\027\022\023\024\026\026\024\027\025\033" +
    "\030\001\002\000\010\010\047\020\035\021\036\001\002" +
    "\000\016\017\027\022\023\024\026\026\024\027\025\033" +
    "\030\001\002\000\020\010\uffe9\011\uffe9\015\uffe9\020\uffe9" +
    "\021\uffe9\025\uffe9\030\uffe9\001\002\000\020\010\uffe8\011" +
    "\uffe8\015\uffe8\020\uffe8\021\uffe8\025\uffe8\030\uffe8\001\002" +
    "\000\016\017\027\022\023\024\026\026\024\027\025\033" +
    "\030\001\002\000\004\024\032\001\002\000\020\010\uffe7" +
    "\011\uffe7\015\uffe7\020\uffe7\021\uffe7\025\uffe7\030\uffe7\001" +
    "\002\000\020\010\uffe6\011\uffe6\015\uffe6\020\uffe6\021\uffe6" +
    "\025\uffe6\030\uffe6\001\002\000\016\017\027\022\023\024" +
    "\026\026\024\027\025\033\030\001\002\000\006\011\041" +
    "\025\042\001\002\000\012\011\uffe4\020\035\021\036\025" +
    "\uffe4\001\002\000\016\017\027\022\023\024\026\026\024" +
    "\027\025\033\030\001\002\000\016\017\027\022\023\024" +
    "\026\026\024\027\025\033\030\001\002\000\020\010\uffed" +
    "\011\uffed\015\uffed\020\035\021\uffed\025\uffed\030\uffed\001" +
    "\002\000\020\010\uffec\011\uffec\015\uffec\020\uffec\021\uffec" +
    "\025\uffec\030\uffec\001\002\000\016\017\027\022\023\024" +
    "\026\026\024\027\025\033\030\001\002\000\020\010\uffe5" +
    "\011\uffe5\015\uffe5\020\uffe5\021\uffe5\025\uffe5\030\uffe5\001" +
    "\002\000\012\011\uffe3\020\035\021\036\025\uffe3\001\002" +
    "\000\010\020\035\021\036\025\045\001\002\000\020\010" +
    "\uffeb\011\uffeb\015\uffeb\020\uffeb\021\uffeb\025\uffeb\030\uffeb" +
    "\001\002\000\020\010\uffea\011\uffea\015\uffea\020\uffea\021" +
    "\uffea\025\uffea\030\uffea\001\002\000\010\002\ufff1\014\ufff1" +
    "\033\ufff1\001\002\000\006\014\015\033\020\001\002\000" +
    "\010\002\ufff4\014\ufff4\033\ufff4\001\002\000\010\015\054" +
    "\020\035\021\036\001\002\000\012\002\ufff0\014\ufff0\015" +
    "\065\033\ufff0\001\002\000\016\017\027\022\023\024\026" +
    "\026\024\027\025\033\030\001\002\000\010\020\035\021" +
    "\036\030\056\001\002\000\004\016\057\001\002\000\004" +
    "\024\060\001\002\000\004\032\061\001\002\000\004\025" +
    "\062\001\002\000\004\010\063\001\002\000\004\031\064" +
    "\001\002\000\012\002\uffef\014\uffef\015\uffef\033\uffef\001" +
    "\002\000\016\017\027\022\023\024\026\026\024\027\025" +
    "\033\030\001\002\000\010\020\035\021\036\030\067\001" +
    "\002\000\004\016\070\001\002\000\004\024\071\001\002" +
    "\000\004\032\072\001\002\000\004\025\073\001\002\000" +
    "\004\010\074\001\002\000\004\031\075\001\002\000\012" +
    "\002\uffee\014\uffee\015\uffee\033\uffee\001\002\000\006\014" +
    "\015\033\020\001\002\000\006\014\015\033\020\001\002" +
    "\000\010\002\ufff5\014\ufff5\033\ufff5\001\002\000\004\002" +
    "\001\001\002\000\004\010\103\001\002\000\010\005\ufff8" +
    "\006\ufff8\007\ufff8\001\002\000\010\005\107\006\106\007" +
    "\105\001\002\000\004\010\116\001\002\000\004\010\111" +
    "\001\002\000\004\010\110\001\002\000\012\004\ufff7\005" +
    "\ufff7\006\ufff7\007\ufff7\001\002\000\010\005\ufff8\006\ufff8" +
    "\007\ufff8\001\002\000\010\005\107\006\113\007\105\001" +
    "\002\000\004\010\114\001\002\000\010\004\ufff8\005\ufff8" +
    "\007\ufff8\001\002\000\010\004\ufffb\005\107\007\105\001" +
    "\002\000\012\004\ufff6\005\ufff6\006\ufff6\007\ufff6\001\002" +
    "\000\004\010\120\001\002\000\012\004\ufff8\005\ufff8\006" +
    "\ufff8\007\ufff8\001\002\000\012\004\ufffa\005\107\006\ufffa" +
    "\007\105\001\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\117\000\016\002\006\003\010\011\007\012\005\013" +
    "\003\014\004\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\012\004\016\005\013\006\012\007\015" +
    "\001\001\000\002\001\001\000\010\005\075\006\012\007" +
    "\015\001\001\000\006\015\051\016\030\001\001\000\002" +
    "\001\001\000\010\005\047\006\012\007\015\001\001\000" +
    "\002\001\001\000\006\015\021\016\030\001\001\000\002" +
    "\001\001\000\006\015\045\016\030\001\001\000\002\001" +
    "\001\000\002\001\001\000\006\015\043\016\030\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\010\015\033\016\030\017\032\001\001\000\002\001\001" +
    "\000\002\001\001\000\006\015\037\016\030\001\001\000" +
    "\006\015\036\016\030\001\001\000\002\001\001\000\002" +
    "\001\001\000\006\015\042\016\030\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\010\005\050\006" +
    "\012\007\015\001\001\000\002\001\001\000\004\010\052" +
    "\001\001\000\002\001\001\000\006\015\054\016\030\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\006\015\065\016\030" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\010\005\076\006" +
    "\012\007\015\001\001\000\010\005\077\006\012\007\015" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\004\014\103\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\004\014\111\001\001\000\002\001\001\000\002" +
    "\001\001\000\004\014\114\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\004\014\120\001\001" +
    "\000\002\001\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$parser$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$parser$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$parser$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 0;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}


  /** User initialization code. */
  public void user_init() throws java.lang.Exception
    {

    table = new HashMap<String, Boolean>();

 Tree = new DisegnaAlbero();   }public static DisegnaAlbero Tree;

  /** Scan to get the next Symbol. */
  public java_cup.runtime.Symbol scan()
    throws java.lang.Exception
    {
 Symbol s=_scanner.next_token(); Tree.push(s.toString(), 0); return s;   }


 
    public HashMap<String, Boolean> table;
 
    public void report_error(String message, Object info) {
        StringBuffer m = new StringBuffer(message);
        if (info instanceof Symbol) {
            if (((Symbol)info).left != 1 && ((Symbol)info).right != 1) {
                if (((Symbol)info).left != -1 && ((Symbol)info).right != -1) {
                    int line = (((Symbol)info).left) + 1;
                    int column = (((Symbol)info).right) + 1;
                    m.append(" (line " + line + " column " + column + ")");
                }
            }
            System.err.println(m);
        }
    }
 
    public Object stack(int position) {
        return (((Symbol)stack.elementAt(tos + position)).value);
    }



/** Cup generated class to encapsulate user supplied action code.*/
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
class CUP$parser$actions {
  private final parser parser;

  /** Constructor */
  CUP$parser$actions(parser parser) {
    this.parser = parser;
  }

  /** Method 0 with the actual generated action code for actions 0 to 300. */
  public final java_cup.runtime.Symbol CUP$parser$do_action_part00000000(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$parser$result;

      /* select the action based on the action number */
      switch (CUP$parser$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // $START ::= starter EOF 
            { 
              Object RESULT =null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Object start_val = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		RESULT = start_val;
              CUP$parser$result = parser.getSymbolFactory().newSymbol("$START",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          /* ACCEPT */
          CUP$parser$parser.done_parsing();
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // starter ::= header SEP coms 
            { parser.Tree.reduce(3,"starter",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("starter",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // starter ::= header SEP 
            { parser.Tree.reduce(2,"starter",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("starter",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // header ::= header1 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // header ::= header2 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // header ::= header3 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // header1 ::= header2 TOK2 S nt0 TOK2 S nt0 TOK2 S nt0 
            { parser.Tree.reduce(10,"header1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header1",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-9)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // header2 ::= header3 TOK2 S nt0 
            { parser.Tree.reduce(4,"header2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header2",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // header3 ::= nt0 
            { parser.Tree.reduce(1,"header3",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header3",9, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // nt0 ::= 
            { parser.Tree.reduce(0,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",10, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // nt0 ::= nt0 TOK1 S 
            { parser.Tree.reduce(3,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // nt0 ::= nt0 TOK3 S 
            { parser.Tree.reduce(3,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // coms ::= com com com com 
            { parser.Tree.reduce(4,"coms",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("coms",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // coms ::= coms com com 
            { parser.Tree.reduce(3,"coms",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("coms",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // com ::= ass 
            { parser.Tree.reduce(1,"com",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("com",3, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // com ::= cmp 
            { parser.Tree.reduce(1,"com",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("com",3, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // ass ::= VARIABLE EQ bexpr S 
            { parser.Tree.reduce(4,"ass",0);
              Object RESULT =null;
		int kleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int kright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String k = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int vleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int vright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Boolean v = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 String res; if(v){ res="T"; }else{res="F";} System.out.println(k + " " + res); parser.table.put(k,v); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("ass",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // cmp ::= CMPW bexpr alist 
            { parser.Tree.reduce(3,"cmp",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("cmp",5, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // alist ::= WW bexpr SO PW RO QSTRING RC S SC 
            { parser.Tree.reduce(9,"alist",0);
              Object RESULT =null;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).right;
		Boolean b = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-7)).value;
		int sleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int sright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String s = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		 Boolean a = (Boolean)parser.stack(-9); if(a==b){System.out.println(s);} 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("alist",6, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-8)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // alist ::= alist WW bexpr SO PW RO QSTRING RC S SC 
            { parser.Tree.reduce(10,"alist",0);
              Object RESULT =null;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-7)).right;
		Boolean b = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-7)).value;
		int sleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int sright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String s = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		 Boolean a = (Boolean)parser.stack(-10); if(a==b){System.out.println(s);} 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("alist",6, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-9)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // bexpr ::= bexpr OR bexpr 
            { parser.Tree.reduce(3,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Boolean b = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a || b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // bexpr ::= bexpr AND bexpr 
            { parser.Tree.reduce(3,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Boolean b = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a && b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 22: // bexpr ::= RO bexpr RC 
            { parser.Tree.reduce(3,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 23: // bexpr ::= NOT bexpr 
            { parser.Tree.reduce(2,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = !a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 24: // bexpr ::= T 
            { parser.Tree.reduce(1,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Object a = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = true; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 25: // bexpr ::= F 
            { parser.Tree.reduce(1,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Object a = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = false; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 26: // bexpr ::= VARIABLE 
            { parser.Tree.reduce(1,"bexpr",0);
              Boolean RESULT =null;
		int nleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int nright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		String n = (String)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT=parser.table.get(n); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 27: // bexpr ::= fzand 
            { parser.Tree.reduce(1,"bexpr",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT=a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("bexpr",11, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 28: // fzand ::= FW RO blist RC 
            { parser.Tree.reduce(4,"fzand",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT=a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("fzand",12, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 29: // blist ::= bexpr 
            { parser.Tree.reduce(1,"blist",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT=a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("blist",13, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 30: // blist ::= blist CM bexpr 
            { parser.Tree.reduce(3,"blist",0);
              Boolean RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Boolean a = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Boolean b = (Boolean)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT=a && b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("blist",13, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number "+CUP$parser$act_num+"found in internal parse table");

        }
    } /* end of method */

  /** Method splitting the generated action code into several parts. */
  public final java_cup.runtime.Symbol CUP$parser$do_action(
    int                        CUP$parser$act_num,
    java_cup.runtime.lr_parser CUP$parser$parser,
    java.util.Stack            CUP$parser$stack,
    int                        CUP$parser$top)
    throws java.lang.Exception
    {
              return CUP$parser$do_action_part00000000(
                               CUP$parser$act_num,
                               CUP$parser$parser,
                               CUP$parser$stack,
                               CUP$parser$top);
    }
}

}
