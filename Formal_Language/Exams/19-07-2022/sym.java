
//----------------------------------------------------
// The following code was generated by CUP v0.11b beta 20140226
//----------------------------------------------------

/** CUP generated class containing symbol constants. */
public class sym {
  /* terminals */
  public static final int LW = 13;
  public static final int UW = 15;
  public static final int PLUS = 20;
  public static final int CM = 7;
  public static final int STAR = 22;
  public static final int RO = 25;
  public static final int S = 6;
  public static final int DW = 16;
  public static final int COL = 8;
  public static final int MW = 14;
  public static final int SW = 9;
  public static final int RC = 26;
  public static final int EOF = 0;
  public static final int BW = 10;
  public static final int DIV = 23;
  public static final int TOK3 = 5;
  public static final int TOK2 = 4;
  public static final int KW = 11;
  public static final int MINUS = 21;
  public static final int SEP = 2;
  public static final int TOK1 = 3;
  public static final int error = 1;
  public static final int UINT = 29;
  public static final int QSTRING = 28;
  public static final int MAX = 27;
  public static final int REAL = 30;
  public static final int KM = 18;
  public static final int UKM = 19;
  public static final int DONE = 17;
  public static final int FW = 12;
  public static final int UMINUS = 24;
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
  "SW",
  "BW",
  "KW",
  "FW",
  "LW",
  "MW",
  "UW",
  "DW",
  "DONE",
  "KM",
  "UKM",
  "PLUS",
  "MINUS",
  "STAR",
  "DIV",
  "UMINUS",
  "RO",
  "RC",
  "MAX",
  "QSTRING",
  "UINT",
  "REAL"
  };
public String[] TT;
	public sym(){
		TT = new String[100];
		TT[13]=new String("LW");
		TT[15]=new String("UW");
		TT[20]=new String("PLUS");
		TT[7]=new String("CM");
		TT[22]=new String("STAR");
		TT[25]=new String("RO");
		TT[6]=new String("S");
		TT[16]=new String("DW");
		TT[8]=new String("COL");
		TT[14]=new String("MW");
		TT[9]=new String("SW");
		TT[26]=new String("RC");
		TT[0]=new String("EOF");
		TT[10]=new String("BW");
		TT[23]=new String("DIV");
		TT[5]=new String("TOK3");
		TT[4]=new String("TOK2");
		TT[11]=new String("KW");
		TT[21]=new String("MINUS");
		TT[2]=new String("SEP");
		TT[3]=new String("TOK1");
		TT[1]=new String("error");
		TT[29]=new String("UINT");
		TT[28]=new String("QSTRING");
		TT[27]=new String("MAX");
		TT[30]=new String("REAL");
		TT[18]=new String("KM");
		TT[19]=new String("UKM");
		TT[17]=new String("DONE");
		TT[12]=new String("FW");
		TT[24]=new String("UMINUS");
	}
public String getTT(int i){return TT[i];}
}

