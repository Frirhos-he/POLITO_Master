
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
    "\000\025\000\002\002\004\000\002\002\005\000\002\003" +
    "\014\000\002\003\011\000\002\003\006\000\002\003\003" +
    "\000\002\004\005\000\002\004\005\000\002\004\002\000" +
    "\002\005\014\000\002\005\014\000\002\005\011\000\002" +
    "\005\010\000\002\005\007\000\002\006\005\000\002\006" +
    "\006\000\002\007\003\000\002\007\003\000\002\010\010" +
    "\000\002\012\007\000\002\012\006" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\103\000\012\004\ufff9\005\ufff9\006\ufff9\007\ufff9\001" +
    "\002\000\012\004\ufffc\005\073\006\072\007\071\001\002" +
    "\000\004\002\070\001\002\000\004\004\007\001\002\000" +
    "\004\022\011\001\002\000\004\002\000\001\002\000\004" +
    "\023\012\001\002\000\010\020\013\021\015\024\014\001" +
    "\002\000\004\011\057\001\002\000\004\020\046\001\002" +
    "\000\004\010\016\001\002\000\004\025\017\001\002\000" +
    "\004\026\031\001\002\000\006\002\ufff4\025\017\001\002" +
    "\000\006\002\ufff1\025\ufff1\001\002\000\006\002\ufff0\025" +
    "\ufff0\001\002\000\004\025\017\001\002\000\004\025\017" +
    "\001\002\000\004\025\017\001\002\000\006\002\ufff2\025" +
    "\ufff2\001\002\000\004\025\017\001\002\000\006\002\ufff3" +
    "\025\ufff3\001\002\000\004\014\033\001\002\000\006\014" +
    "\040\027\037\001\002\000\004\030\034\001\002\000\004" +
    "\020\035\001\002\000\004\010\036\001\002\000\006\014" +
    "\uffed\027\uffed\001\002\000\004\014\044\001\002\000\004" +
    "\030\041\001\002\000\004\020\042\001\002\000\004\010" +
    "\043\001\002\000\006\014\uffee\027\uffee\001\002\000\004" +
    "\010\045\001\002\000\006\002\uffef\025\uffef\001\002\000" +
    "\006\010\047\021\050\001\002\000\004\025\017\001\002" +
    "\000\004\020\051\001\002\000\004\011\052\001\002\000" +
    "\004\020\053\001\002\000\004\010\054\001\002\000\004" +
    "\025\017\001\002\000\006\002\ufff7\025\017\001\002\000" +
    "\006\002\ufff5\025\017\001\002\000\004\020\060\001\002" +
    "\000\006\010\061\021\062\001\002\000\004\025\017\001" +
    "\002\000\004\024\063\001\002\000\004\020\064\001\002" +
    "\000\004\010\065\001\002\000\004\025\017\001\002\000" +
    "\006\002\ufff8\025\017\001\002\000\006\002\ufff6\025\017" +
    "\001\002\000\004\002\001\001\002\000\004\010\076\001" +
    "\002\000\004\010\075\001\002\000\004\010\074\001\002" +
    "\000\012\004\ufffb\005\ufffb\006\ufffb\007\ufffb\001\002\000" +
    "\012\004\ufffa\005\ufffa\006\ufffa\007\ufffa\001\002\000\012" +
    "\004\ufff9\005\ufff9\006\ufff9\007\ufff9\001\002\000\012\004" +
    "\ufffd\005\073\006\072\007\100\001\002\000\004\010\101" +
    "\001\002\000\012\004\ufff9\005\ufff9\006\ufff9\007\ufff9\001" +
    "\002\000\012\004\ufffe\005\073\006\072\007\103\001\002" +
    "\000\004\010\104\001\002\000\010\004\ufff9\005\ufff9\006" +
    "\ufff9\001\002\000\010\004\uffff\005\073\006\072\001\002" +
    "" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\103\000\010\002\004\003\005\004\003\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\004" +
    "\005\007\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\012\006\017\007\022\010\020\011\021\001" +
    "\001\000\002\001\001\000\010\007\026\010\020\011\021" +
    "\001\001\000\002\001\001\000\002\001\001\000\010\007" +
    "\023\010\020\011\021\001\001\000\010\007\024\010\020" +
    "\011\021\001\001\000\010\007\025\010\020\011\021\001" +
    "\001\000\002\001\001\000\010\007\027\010\020\011\021" +
    "\001\001\000\002\001\001\000\004\012\031\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\012\006\055\007\022\010\020\011\021\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\012\006\054\007\022\010\020\011\021\001\001" +
    "\000\010\007\026\010\020\011\021\001\001\000\010\007" +
    "\026\010\020\011\021\001\001\000\002\001\001\000\002" +
    "\001\001\000\012\006\066\007\022\010\020\011\021\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\012\006\065\007\022\010\020\011\021\001\001\000" +
    "\010\007\026\010\020\011\021\001\001\000\010\007\026" +
    "\010\020\011\021\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\004\004\076\001\001\000\002\001" +
    "\001\000\002\001\001\000\004\004\101\001\001\000\002" +
    "\001\001\000\002\001\001\000\004\004\104\001\001\000" +
    "\002\001\001" });

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

    table = new HashMap<String, HashMap<String, Integer>>();

 Tree = new DisegnaAlbero();   }public static DisegnaAlbero Tree;

  /** Scan to get the next Symbol. */
  public java_cup.runtime.Symbol scan()
    throws java.lang.Exception
    {
 Symbol s=_scanner.next_token(); Tree.push(s.toString(), 0); return s;   }


 
    public HashMap<String, HashMap<String, Integer>> table;
 
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
          case 1: // starter ::= header SEP car_section 
            { parser.Tree.reduce(3,"starter",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("starter",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // header ::= rep_tok1tok2 TOK3 S rep_tok1tok2 TOK3 S rep_tok1tok2 TOK3 S rep_tok1tok2 
            { parser.Tree.reduce(10,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-9)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // header ::= rep_tok1tok2 TOK3 S rep_tok1tok2 TOK3 S rep_tok1tok2 
            { parser.Tree.reduce(7,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // header ::= rep_tok1tok2 TOK3 S rep_tok1tok2 
            { parser.Tree.reduce(4,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // header ::= rep_tok1tok2 
            { parser.Tree.reduce(1,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // rep_tok1tok2 ::= rep_tok1tok2 TOK1 S 
            { parser.Tree.reduce(3,"rep_tok1tok2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("rep_tok1tok2",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // rep_tok1tok2 ::= rep_tok1tok2 TOK2 S 
            { parser.Tree.reduce(3,"rep_tok1tok2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("rep_tok1tok2",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // rep_tok1tok2 ::= 
            { parser.Tree.reduce(0,"rep_tok1tok2",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("rep_tok1tok2",2, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // car_section ::= SET POSITION SINT CM SINT MINUS FUEL SINT S command_list 
            { parser.Tree.reduce(10,"car_section",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("car_section",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-9)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // car_section ::= SET POSITION FUEL SINT MINUS SINT CM SINT S command_list 
            { parser.Tree.reduce(10,"car_section",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("car_section",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-9)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // car_section ::= SET POSITION SINT CM SINT S command_list 
            { parser.Tree.reduce(7,"car_section",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("car_section",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // car_section ::= SET POSITION FUEL SINT S command_list 
            { parser.Tree.reduce(6,"car_section",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("car_section",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // car_section ::= SET POSITION MINUS S command_list 
            { parser.Tree.reduce(5,"car_section",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("car_section",3, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // command_list ::= command_list command command 
            { parser.Tree.reduce(3,"command_list",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command_list",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // command_list ::= command command command command 
            { parser.Tree.reduce(4,"command_list",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command_list",4, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // command ::= declare 
            { parser.Tree.reduce(1,"command",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command",5, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // command ::= if 
            { parser.Tree.reduce(1,"command",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("command",5, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // declare ::= DECLARE BO attribute_list BC VARIABLE S 
            { parser.Tree.reduce(6,"declare",0);
              Object RESULT =null;
		int yleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int yright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		HashMap<String,Integer> y = (HashMap<String,Integer>)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int xleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int xright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		String x = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		
        parser.table.put(x,y);


              CUP$parser$result = parser.getSymbolFactory().newSymbol("declare",6, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // attribute_list ::= attribute_list VARIABLE EQ SINT S 
            { parser.Tree.reduce(5,"attribute_list",0);
              HashMap<String,Integer> RESULT =null;
		int yleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).left;
		int yright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).right;
		HashMap<String,Integer> y = (HashMap<String,Integer>)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-4)).value;
		int xleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int xright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String x = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer i = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		
            y.put(x,i);
            RESULT = y;


              CUP$parser$result = parser.getSymbolFactory().newSymbol("attribute_list",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // attribute_list ::= VARIABLE EQ SINT S 
            { parser.Tree.reduce(4,"attribute_list",0);
              HashMap<String,Integer> RESULT =null;
		int xleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int xright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String x = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int ileft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int iright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Integer i = (Integer)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		
            HashMap<String, Integer> tab = new HashMap<String,Integer>();
            tab.put(x,i);
            RESULT = tab;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("attribute_list",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
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