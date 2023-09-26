
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
    "\000\037\000\002\002\004\000\002\002\005\000\002\003" +
    "\003\000\002\003\003\000\002\004\004\000\002\006\014" +
    "\000\002\006\007\000\002\007\010\000\002\007\054\000" +
    "\002\005\013\000\002\010\002\000\002\010\005\000\002" +
    "\011\004\000\002\011\002\000\002\012\003\000\002\012" +
    "\003\000\002\013\006\000\002\014\010\000\002\015\007" +
    "\000\002\015\007\000\002\017\002\000\002\016\005\000" +
    "\002\016\006\000\002\020\005\000\002\020\005\000\002" +
    "\020\005\000\002\020\005\000\002\020\005\000\002\020" +
    "\004\000\002\020\003\000\002\020\003" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\170\000\006\005\005\006\004\001\002\000\004\010" +
    "\161\001\002\000\004\010\150\001\002\000\004\004\ufffe" +
    "\001\002\000\004\002\147\001\002\000\006\005\071\006" +
    "\070\001\002\000\004\004\uffff\001\002\000\004\004\013" +
    "\001\002\000\010\002\ufff4\014\ufff4\032\ufff4\001\002\000" +
    "\010\002\000\014\015\032\021\001\002\000\012\023\023" +
    "\027\024\032\027\033\025\001\002\000\010\002\ufff5\014" +
    "\ufff5\032\ufff5\001\002\000\010\002\ufff2\014\ufff2\032\ufff2" +
    "\001\002\000\010\002\ufff3\014\ufff3\032\ufff3\001\002\000" +
    "\004\013\022\001\002\000\012\023\023\027\024\032\027" +
    "\033\025\001\002\000\012\023\023\027\024\032\027\033" +
    "\025\001\002\000\012\023\023\027\024\032\027\033\025" +
    "\001\002\000\022\010\uffe4\015\uffe4\020\uffe4\022\uffe4\023" +
    "\uffe4\024\uffe4\025\uffe4\030\uffe4\001\002\000\014\010\031" +
    "\022\032\023\033\024\030\025\034\001\002\000\022\010" +
    "\uffe3\015\uffe3\020\uffe3\022\uffe3\023\uffe3\024\uffe3\025\uffe3" +
    "\030\uffe3\001\002\000\012\023\023\027\024\032\027\033" +
    "\025\001\002\000\010\002\ufff1\014\ufff1\032\ufff1\001\002" +
    "\000\012\023\023\027\024\032\027\033\025\001\002\000" +
    "\012\023\023\027\024\032\027\033\025\001\002\000\012" +
    "\023\023\027\024\032\027\033\025\001\002\000\022\010" +
    "\uffe7\015\uffe7\020\uffe7\022\uffe7\023\uffe7\024\uffe7\025\uffe7" +
    "\030\uffe7\001\002\000\022\010\uffe9\015\uffe9\020\uffe9\022" +
    "\uffe9\023\uffe9\024\030\025\034\030\uffe9\001\002\000\022" +
    "\010\uffea\015\uffea\020\uffea\022\uffea\023\uffea\024\030\025" +
    "\034\030\uffea\001\002\000\022\010\uffe8\015\uffe8\020\uffe8" +
    "\022\uffe8\023\uffe8\024\uffe8\025\uffe8\030\uffe8\001\002\000" +
    "\014\022\032\023\033\024\030\025\034\030\042\001\002" +
    "\000\022\010\uffe6\015\uffe6\020\uffe6\022\uffe6\023\uffe6\024" +
    "\uffe6\025\uffe6\030\uffe6\001\002\000\022\010\uffe5\015\uffe5" +
    "\020\uffe5\022\uffe5\023\uffe5\024\uffe5\025\uffe5\030\uffe5\001" +
    "\002\000\014\015\045\022\032\023\033\024\030\025\034" +
    "\001\002\000\012\023\uffed\027\uffed\032\uffed\033\uffed\001" +
    "\002\000\012\023\023\027\024\032\027\033\025\001\002" +
    "\000\014\016\050\023\023\027\024\032\027\033\025\001" +
    "\002\000\004\010\063\001\002\000\014\020\052\022\032" +
    "\023\033\024\030\025\034\001\002\000\004\017\053\001" +
    "\002\000\012\023\023\027\024\032\027\033\025\001\002" +
    "\000\006\017\055\021\056\001\002\000\012\023\023\027" +
    "\024\032\027\033\025\001\002\000\014\016\uffee\023\uffee" +
    "\027\uffee\032\uffee\033\uffee\001\002\000\014\010\060\022" +
    "\032\023\033\024\030\025\034\001\002\000\006\017\uffeb" +
    "\021\uffeb\001\002\000\014\010\062\022\032\023\033\024" +
    "\030\025\034\001\002\000\006\017\uffec\021\uffec\001\002" +
    "\000\010\002\ufff0\014\ufff0\032\ufff0\001\002\000\014\020" +
    "\065\022\032\023\033\024\030\025\034\001\002\000\004" +
    "\017\053\001\002\000\006\017\055\021\067\001\002\000" +
    "\014\016\uffef\023\uffef\027\uffef\032\uffef\033\uffef\001\002" +
    "\000\004\010\076\001\002\000\004\010\073\001\002\000" +
    "\004\004\ufffd\001\002\000\004\005\074\001\002\000\004" +
    "\010\075\001\002\000\006\005\ufffb\006\ufffb\001\002\000" +
    "\004\006\077\001\002\000\004\010\100\001\002\000\004" +
    "\006\101\001\002\000\004\010\102\001\002\000\006\004" +
    "\ufffa\006\103\001\002\000\004\010\104\001\002\000\004" +
    "\006\105\001\002\000\004\010\106\001\002\000\004\006" +
    "\107\001\002\000\004\010\110\001\002\000\004\006\111" +
    "\001\002\000\004\010\112\001\002\000\004\006\113\001" +
    "\002\000\004\010\114\001\002\000\004\006\115\001\002" +
    "\000\004\010\116\001\002\000\004\006\117\001\002\000" +
    "\004\010\120\001\002\000\004\006\121\001\002\000\004" +
    "\010\122\001\002\000\004\006\123\001\002\000\004\010" +
    "\124\001\002\000\004\006\125\001\002\000\004\010\126" +
    "\001\002\000\004\006\127\001\002\000\004\010\130\001" +
    "\002\000\004\006\131\001\002\000\004\010\132\001\002" +
    "\000\004\006\133\001\002\000\004\010\134\001\002\000" +
    "\004\006\135\001\002\000\004\010\136\001\002\000\004" +
    "\006\137\001\002\000\004\010\140\001\002\000\004\006" +
    "\141\001\002\000\004\010\142\001\002\000\004\006\143" +
    "\001\002\000\004\010\144\001\002\000\004\006\145\001" +
    "\002\000\004\010\146\001\002\000\004\004\ufff9\001\002" +
    "\000\004\002\001\001\002\000\004\005\151\001\002\000" +
    "\004\010\152\001\002\000\004\005\153\001\002\000\004" +
    "\010\154\001\002\000\004\005\155\001\002\000\004\010" +
    "\156\001\002\000\004\005\157\001\002\000\004\010\160" +
    "\001\002\000\006\005\ufffc\006\ufffc\001\002\000\006\005" +
    "\ufff7\006\ufff7\001\002\000\006\005\164\006\163\001\002" +
    "\000\004\010\166\001\002\000\004\010\165\001\002\000" +
    "\010\004\ufff6\005\ufff6\006\ufff6\001\002\000\006\005\ufff7" +
    "\006\ufff7\001\002\000\006\005\164\006\170\001\002\000" +
    "\004\010\171\001\002\000\006\004\ufff7\005\ufff7\001\002" +
    "\000\006\004\ufff8\005\164\001\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\170\000\014\002\006\003\011\004\010\005\005\006" +
    "\007\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\004\007\071\001\001\000" +
    "\002\001\001\000\002\001\001\000\004\011\013\001\001" +
    "\000\010\012\015\013\017\014\016\001\001\000\004\020" +
    "\043\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\004\020\025\001\001\000" +
    "\004\020\042\001\001\000\004\020\040\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\004\020" +
    "\037\001\001\000\002\001\001\000\004\020\036\001\001" +
    "\000\004\020\035\001\001\000\004\020\034\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\006\015\046\017\045\001\001" +
    "\000\004\020\063\001\001\000\004\020\050\001\001\000" +
    "\002\001\001\000\002\001\001\000\004\016\053\001\001" +
    "\000\004\020\060\001\001\000\002\001\001\000\004\020" +
    "\056\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\004\016\065\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\004\010\161\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\004\010\166" +
    "\001\001\000\002\001\001\000\002\001\001\000\004\010" +
    "\171\001\001\000\002\001\001" });

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

    table = new HashMap<String, Integer>();

 Tree = new DisegnaAlbero();   }public static DisegnaAlbero Tree;

  /** Scan to get the next Symbol. */
  public java_cup.runtime.Symbol scan()
    throws java.lang.Exception
    {
 Symbol s=_scanner.next_token(); Tree.push(s.toString(), 0); return s;   }


 
    public HashMap<String, Integer> table;
 
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
          case 1: // starter ::= header SEP com_s 
            { parser.Tree.reduce(3,"starter",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("starter",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // header ::= header1 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // header ::= header2 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // header1 ::= ltok1 ltok2 
            { parser.Tree.reduce(2,"header1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header1",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // ltok1 ::= TOK1 S TOK1 S TOK1 S TOK1 S TOK1 S 
            { parser.Tree.reduce(10,"ltok1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("ltok1",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-9)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // ltok1 ::= ltok1 TOK1 S TOK1 S 
            { parser.Tree.reduce(5,"ltok1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("ltok1",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // ltok2 ::= TOK2 S TOK2 S TOK2 S 
            { parser.Tree.reduce(6,"ltok2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("ltok2",5, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // ltok2 ::= TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S TOK2 S 
            { parser.Tree.reduce(42,"ltok2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("ltok2",5, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-41)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // header2 ::= TOK2 S nt0 TOK2 S nt0 TOK2 S nt0 
            { parser.Tree.reduce(9,"header2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header2",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-8)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // nt0 ::= 
            { parser.Tree.reduce(0,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",6, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // nt0 ::= nt0 TOK1 S 
            { parser.Tree.reduce(3,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",6, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // com_s ::= com_s comm 
            { parser.Tree.reduce(2,"com_s",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("com_s",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // com_s ::= 
            { parser.Tree.reduce(0,"com_s",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("com_s",7, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // comm ::= assignment 
            { parser.Tree.reduce(1,"comm",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("comm",8, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // comm ::= compare 
            { parser.Tree.reduce(1,"comm",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("comm",8, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // assignment ::= VARIABLE EQ expr S 
            { parser.Tree.reduce(4,"assignment",0);
              Object RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String a = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int resleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int resright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer res = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 parser.table.put(a,res); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("assignment",9, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // compare ::= COMP_W expr WW compl ENDW S 
            { parser.Tree.reduce(6,"compare",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("compare",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // compl ::= nt1 expr BO plist BC 
            { parser.Tree.reduce(5,"compl",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("compl",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // compl ::= compl expr BO plist BC 
            { parser.Tree.reduce(5,"compl",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("compl",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // nt1 ::= 
            { parser.Tree.reduce(0,"nt1",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt1",13, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // plist ::= PW expr S 
            { parser.Tree.reduce(3,"plist",0);
              Object RESULT =null;
		int eleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int eright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer e = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 if((Integer)parser.stack(-4)==(Integer)parser.stack(-7)){System.out.println(e);} 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("plist",12, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 22: // plist ::= plist PW expr S 
            { parser.Tree.reduce(4,"plist",0);
              Object RESULT =null;
		int eleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int eright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer e = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 if((Integer)parser.stack(-5)==(Integer)parser.stack(-8)){System.out.println(e);} 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("plist",12, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 23: // expr ::= expr PLUS expr 
            { parser.Tree.reduce(3,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer b = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a + b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 24: // expr ::= expr MINUS expr 
            { parser.Tree.reduce(3,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer b = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a - b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 25: // expr ::= expr STAR expr 
            { parser.Tree.reduce(3,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer b = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a * b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 26: // expr ::= expr DIV expr 
            { parser.Tree.reduce(3,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer b = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a / b; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 27: // expr ::= RO expr RC 
            { parser.Tree.reduce(3,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 RESULT = a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 28: // expr ::= MINUS expr 
            { parser.Tree.reduce(2,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = -a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 29: // expr ::= UINT 
            { parser.Tree.reduce(1,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Integer a = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT = a; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 30: // expr ::= VARIABLE 
            { parser.Tree.reduce(1,"expr",0);
              Integer RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		String a = (String)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		 RESULT=parser.table.get(a); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("expr",14, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
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
