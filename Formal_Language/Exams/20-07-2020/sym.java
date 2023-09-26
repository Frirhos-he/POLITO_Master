
//----------------------------------------------------
// The following code was generated by CUP v0.11b beta 20140226
//----------------------------------------------------

/** CUP generated class containing symbol constants. */
public class sym {
  /* terminals */
  public static final int BC = 15;
  public static final int PLUS = 16;
  public static final int CM = 7;
  public static final int STAR = 18;
  public static final int RO = 21;
  public static final int S = 6;
  public static final int VARIABLE = 24;
  public static final int COL = 8;
  public static final int PW = 13;
  public static final int RC = 22;
  public static final int COMP_W = 10;
  public static final int EOF = 0;
  public static final int DIV = 19;
  public static final int TOK3 = 5;
  public static final int TOK2 = 4;
  public static final int MINUS = 17;
  public static final int SEP = 2;
  public static final int TOK1 = 3;
  public static final int error = 1;
  public static final int ENDW = 12;
  public static final int WW = 11;
  public static final int EQ = 9;
  public static final int BO = 14;
  public static final int UINT = 25;
  public static final int QSTRING = 23;
  public static final int REAL = 26;
  public static final int UMINUS = 20;
  public static final String[] terminalNames = new String[] {
  "EOF",
  "error",
  "SEP",
  "TOK1",
  "TOK2",
  "TOK3",
  "S",
  "CM",
  "COL",
  "EQ",
  "COMP_W",
  "WW",
  "ENDW",
  "PW",
  "BO",
  "BC",
  "PLUS",
  "MINUS",
  "STAR",
  "DIV",
  "UMINUS",
  "RO",
  "RC",
  "QSTRING",
  "VARIABLE",
  "UINT",
  "REAL"
  };
public String[] TT;
	public sym(){
		TT = new String[100];
		TT[15]=new String("BC");
		TT[16]=new String("PLUS");
		TT[7]=new String("CM");
		TT[18]=new String("STAR");
		TT[21]=new String("RO");
		TT[6]=new String("S");
		TT[24]=new String("VARIABLE");
		TT[8]=new String("COL");
		TT[13]=new String("PW");
		TT[22]=new String("RC");
		TT[10]=new String("COMP_W");
		TT[0]=new String("EOF");
		TT[19]=new String("DIV");
		TT[5]=new String("TOK3");
		TT[4]=new String("TOK2");
		TT[17]=new String("MINUS");
		TT[2]=new String("SEP");
		TT[3]=new String("TOK1");
		TT[1]=new String("error");
		TT[12]=new String("ENDW");
		TT[11]=new String("WW");
		TT[9]=new String("EQ");
		TT[14]=new String("BO");
		TT[25]=new String("UINT");
		TT[23]=new String("QSTRING");
		TT[26]=new String("REAL");
		TT[20]=new String("UMINUS");
	}
public String getTT(int i){return TT[i];}
}

