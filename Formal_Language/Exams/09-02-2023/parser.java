
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
    "\000\030\000\002\002\004\000\002\002\010\000\002\003" +
    "\010\000\002\003\007\000\002\003\007\000\002\003\006" +
    "\000\002\003\005\000\002\003\005\000\002\004\006\000" +
    "\002\004\005\000\002\014\005\000\002\014\002\000\002" +
    "\013\010\000\002\012\006\000\002\012\010\000\002\005" +
    "\002\000\002\010\004\000\002\010\002\000\002\011\007" +
    "\000\002\007\003\000\002\006\003\000\002\006\002\000" +
    "\002\015\011\000\002\015\007" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\103\000\006\005\005\006\004\001\002\000\004\010" +
    "\100\001\002\000\004\010\074\001\002\000\006\005\064" +
    "\006\063\001\002\000\004\002\062\001\002\000\004\004" +
    "\011\001\002\000\006\004\ufff6\020\ufff6\001\002\000\006" +
    "\004\013\020\015\001\002\000\006\002\ufff2\021\ufff2\001" +
    "\002\000\004\020\015\001\002\000\004\012\016\001\002" +
    "\000\004\013\017\001\002\000\004\020\021\001\002\000" +
    "\006\011\025\014\026\001\002\000\004\012\022\001\002" +
    "\000\004\023\023\001\002\000\004\015\024\001\002\000" +
    "\006\011\ufff4\014\ufff4\001\002\000\004\020\030\001\002" +
    "\000\004\010\027\001\002\000\006\004\ufff5\020\ufff5\001" +
    "\002\000\004\012\031\001\002\000\004\023\032\001\002" +
    "\000\004\015\033\001\002\000\006\011\ufff3\014\ufff3\001" +
    "\002\000\006\004\ufff7\020\ufff7\001\002\000\006\002\ufff0" +
    "\021\ufff0\001\002\000\006\002\000\021\037\001\002\000" +
    "\004\020\042\001\002\000\006\002\ufff1\021\ufff1\001\002" +
    "\000\006\012\043\020\uffec\001\002\000\006\012\uffee\020" +
    "\uffee\001\002\000\004\020\uffed\001\002\000\004\020\046" +
    "\001\002\000\006\010\054\011\053\001\002\000\004\017" +
    "\047\001\002\000\004\020\050\001\002\000\004\022\051" +
    "\001\002\000\004\016\052\001\002\000\006\010\uffea\011" +
    "\uffea\001\002\000\004\020\055\001\002\000\006\002\uffef" +
    "\021\uffef\001\002\000\004\017\056\001\002\000\004\020" +
    "\057\001\002\000\004\022\060\001\002\000\004\016\061" +
    "\001\002\000\006\010\uffeb\011\uffeb\001\002\000\004\002" +
    "\001\001\002\000\004\010\073\001\002\000\004\010\065" +
    "\001\002\000\006\004\ufffb\006\066\001\002\000\004\010" +
    "\070\001\002\000\006\004\ufffc\006\063\001\002\000\006" +
    "\004\ufffe\006\071\001\002\000\004\010\072\001\002\000" +
    "\010\004\ufff9\005\ufff9\006\ufff9\001\002\000\010\004\ufff8" +
    "\005\ufff8\006\ufff8\001\002\000\004\006\075\001\002\000" +
    "\004\010\077\001\002\000\006\004\ufffa\006\063\001\002" +
    "\000\004\006\071\001\002\000\006\005\101\006\071\001" +
    "\002\000\004\010\102\001\002\000\004\006\103\001\002" +
    "\000\004\010\105\001\002\000\006\004\ufffd\006\063\001" +
    "\002\000\006\004\uffff\006\071\001\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\103\000\010\002\006\003\007\004\005\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\004\014\011\001\001\000" +
    "\004\013\013\001\001\000\004\005\034\001\001\000\004" +
    "\013\033\001\001\000\002\001\001\000\002\001\001\000" +
    "\004\012\017\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\004\010\035\001\001\000\004" +
    "\011\037\001\001\000\004\007\040\001\001\000\002\001" +
    "\001\000\004\006\043\001\001\000\002\001\001\000\002" +
    "\001\001\000\004\015\044\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\004\004\066\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\004" +
    "\004\075\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\004" +
    "\004\103\001\001\000\002\001\001\000\002\001\001\000" +
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

    table = new HashMap<String, HashMap<String, Double>>();

 Tree = new DisegnaAlbero();   }public static DisegnaAlbero Tree;

  /** Scan to get the next Symbol. */
  public java_cup.runtime.Symbol scan()
    throws java.lang.Exception
    {
 Symbol s=_scanner.next_token(); Tree.push(s.toString(), 0); return s;   }


 
    public HashMap<String, HashMap<String, Double>> table;
 
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
          case 1: // starter ::= header SEP food SEP nt1 receipel 
            { parser.Tree.reduce(6,"starter",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("starter",0, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // header ::= TOK2 S TOK1 S TOK2 S 
            { parser.Tree.reduce(6,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // header ::= nt0 TOK1 S TOK2 S 
            { parser.Tree.reduce(5,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // header ::= TOK2 S TOK1 S nt0 
            { parser.Tree.reduce(5,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // header ::= nt0 TOK1 S nt0 
            { parser.Tree.reduce(4,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // header ::= nt0 TOK1 S 
            { parser.Tree.reduce(3,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // header ::= TOK1 S nt0 
            { parser.Tree.reduce(3,"header",1);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("header",1, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // nt0 ::= TOK2 S TOK2 S 
            { parser.Tree.reduce(4,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // nt0 ::= nt0 TOK2 S 
            { parser.Tree.reduce(3,"nt0",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt0",2, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // food ::= food cat cat 
            { parser.Tree.reduce(3,"food",0);
              Object RESULT =null;
		int rleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int rright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		Object r = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int aleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Object a = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		int bleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int bright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		Object b = (Object)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("food",10, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // food ::= 
            { parser.Tree.reduce(0,"food",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("food",10, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // cat ::= QSTRING COL SO flist SC S 
            { parser.Tree.reduce(6,"cat",0);
              Object RESULT =null;
		int kleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)).left;
		int kright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)).right;
		String k = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-5)).value;
		int mleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int mright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		HashMap<String,Double> m = (HashMap<String,Double>)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		 parser.table.put(k,m);
              CUP$parser$result = parser.getSymbolFactory().newSymbol("cat",9, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // flist ::= QSTRING COL PRICE KGW 
            { parser.Tree.reduce(4,"flist",0);
              HashMap<String,Double> RESULT =null;
		int kleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int kright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String k = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int pleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int pright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Double p = (Double)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 HashMap<String, Double> tmp = new HashMap<String, Double>(); tmp.put(k,p); RESULT=tmp; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("flist",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // flist ::= flist CM QSTRING COL PRICE KGW 
            { parser.Tree.reduce(6,"flist",0);
              HashMap<String,Double> RESULT =null;
		int mleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)).left;
		int mright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)).right;
		HashMap<String,Double> m = (HashMap<String,Double>)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-5)).value;
		int kleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).left;
		int kright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-3)).right;
		String k = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-3)).value;
		int pleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int pright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Double p = (Double)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 HashMap<String, Double> table; table =m; table.put(k,p); RESULT = table; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("flist",8, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-5)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // nt1 ::= 
            { parser.Tree.reduce(0,"nt1",0);
              Object RESULT =null;
		  
            String higherFoodName = "", lowerFoodName = "";
            Double higherFoodValue = 0.0, lowerFoodValue = Double.MAX_VALUE;

             for(HashMap<String, Double> hm: parser.table.values()){
                for(String s : hm.keySet()){
                    Double val = hm.get(s);
                    if(val > higherFoodValue){
                        higherFoodValue =val;
                        higherFoodName = s;
                    }
                    if (val < lowerFoodValue){
                        lowerFoodValue = val;
                        lowerFoodName = s;
                    }
                }
            }  

                System.out.println("Less expensive: " + lowerFoodName + " " + String.format("%.2f", lowerFoodValue) + " EURO/kg");
                System.out.println("More expensive: " + higherFoodName + " " + String.format("%.2f", higherFoodValue) + " EURO/kg");
                System.out.println("----");

              CUP$parser$result = parser.getSymbolFactory().newSymbol("nt1",3, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // receipel ::= receipel rec 
            { parser.Tree.reduce(2,"receipel",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("receipel",6, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // receipel ::= 
            { parser.Tree.reduce(0,"receipel",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("receipel",6, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // rec ::= UINT rname col il S 
            { parser.Tree.reduce(5,"rec",0);
              Object RESULT =null;
		int totleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int totright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Double tot = (Double)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 System.out.println("TOT: " + tot + " EURO"); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("rec",7, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // rname ::= QSTRING 
            { parser.Tree.reduce(1,"rname",0);
              Object RESULT =null;
		int sleft = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).left;
		int sright = ((java_cup.runtime.Symbol)CUP$parser$stack.peek()).right;
		String s = (String)((java_cup.runtime.Symbol) CUP$parser$stack.peek()).value;
		System.out.println('"' + s + '"'); 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("rname",5, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // col ::= COL 
            { parser.Tree.reduce(1,"col",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("col",4, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // col ::= 
            { parser.Tree.reduce(0,"col",0);
              Object RESULT =null;

              CUP$parser$result = parser.getSymbolFactory().newSymbol("col",4, ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 22: // il ::= il CM QSTRING DOT QSTRING REAL KW 
            { parser.Tree.reduce(7,"il",0);
              Double RESULT =null;
		int totleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).left;
		int totright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)).right;
		Double tot = (Double)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-6)).value;
		int catleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).left;
		int catright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).right;
		String cat = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-4)).value;
		int foodleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int foodright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		String food = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int wleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int wright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Double w = (Double)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 HashMap<String, Double> table = parser.table.get(cat); Double price = table.get(food); price=price*w*(Integer)parser.stack(-9);
                                                        System.out.println('"' + food + '"' + " " + price + " EURO"); RESULT=tot+price; 
              CUP$parser$result = parser.getSymbolFactory().newSymbol("il",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-6)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
            }
          return CUP$parser$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 23: // il ::= QSTRING DOT QSTRING REAL KW 
            { parser.Tree.reduce(5,"il",0);
              Double RESULT =null;
		int catleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).left;
		int catright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)).right;
		String cat = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-4)).value;
		int foodleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).left;
		int foodright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-2)).right;
		String food = (String)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-2)).value;
		int wleft = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).left;
		int wright = ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-1)).right;
		Double w = (Double)((java_cup.runtime.Symbol) CUP$parser$stack.elementAt(CUP$parser$top-1)).value;
		 HashMap<String, Double> table = parser.table.get(cat); Double price = table.get(food); price=price*w*(Integer)parser.stack(-7);
                                                        System.out.println('"' + food + '"' + " " + price + " EURO"); RESULT=price;
              CUP$parser$result = parser.getSymbolFactory().newSymbol("il",11, ((java_cup.runtime.Symbol)CUP$parser$stack.elementAt(CUP$parser$top-4)), ((java_cup.runtime.Symbol)CUP$parser$stack.peek()), RESULT);
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
