
//----------------------------------------------------
// The following code was generated by CUP v0.11b beta 20140226
//----------------------------------------------------

/** CUP generated class containing symbol constants. */
public class sym {
  /* terminals */
  public static final int AND = 10;
  public static final int OR = 11;
  public static final int CM = 7;
  public static final int ANDS = 29;
  public static final int S = 6;
  public static final int RO = 14;
  public static final int NOT = 12;
  public static final int FI = 24;
  public static final int PRICE = 20;
  public static final int TRUE = 21;
  public static final int VARIABLE = 17;
  public static final int COL = 8;
  public static final int IF = 23;
  public static final int DO = 25;
  public static final int RC = 15;
  public static final int EOF = 0;
  public static final int TOK3 = 5;
  public static final int TOK2 = 4;
  public static final int FALSE = 22;
  public static final int SEP = 2;
  public static final int TOK1 = 3;
  public static final int PRINT = 27;
  public static final int error = 1;
  public static final int EQ = 9;
  public static final int UINT = 18;
  public static final int QSTRING = 16;
  public static final int ORS = 28;
  public static final int REAL = 19;
  public static final int DONE = 26;
  public static final int UMINUS = 13;
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
  "AND",
  "OR",
  "NOT",
  "UMINUS",
  "RO",
  "RC",
  "QSTRING",
  "VARIABLE",
  "UINT",
  "REAL",
  "PRICE",
  "TRUE",
  "FALSE",
  "IF",
  "FI",
  "DO",
  "DONE",
  "PRINT",
  "ORS",
  "ANDS"
  };
public String[] TT;
	public sym(){
		TT = new String[100];
		TT[10]=new String("AND");
		TT[11]=new String("OR");
		TT[7]=new String("CM");
		TT[29]=new String("ANDS");
		TT[6]=new String("S");
		TT[14]=new String("RO");
		TT[12]=new String("NOT");
		TT[24]=new String("FI");
		TT[20]=new String("PRICE");
		TT[21]=new String("TRUE");
		TT[17]=new String("VARIABLE");
		TT[8]=new String("COL");
		TT[23]=new String("IF");
		TT[25]=new String("DO");
		TT[15]=new String("RC");
		TT[0]=new String("EOF");
		TT[5]=new String("TOK3");
		TT[4]=new String("TOK2");
		TT[22]=new String("FALSE");
		TT[2]=new String("SEP");
		TT[3]=new String("TOK1");
		TT[27]=new String("PRINT");
		TT[1]=new String("error");
		TT[9]=new String("EQ");
		TT[18]=new String("UINT");
		TT[16]=new String("QSTRING");
		TT[28]=new String("ORS");
		TT[19]=new String("REAL");
		TT[26]=new String("DONE");
		TT[13]=new String("UMINUS");
	}
public String getTT(int i){return TT[i];}
}

