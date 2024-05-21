//+------------------------------------------------------------------+
//|                                                        Print.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| Print message                                                    |
//+------------------------------------------------------------------+
void PrintMsg(string msg, bool isGetLastError = false)
{
   if (isGetLastError)
      Print(msg + "; Code: " + (string)GetLastError());
   else
      Print(msg);
}

//+------------------------------------------------------------------+
//| Warning message                                                  |
//+------------------------------------------------------------------+
void PrintWarning(string msg, bool isGetLastError = false)
{
   PrintMsg("Warning: " + msg, isGetLastError);
}

//+------------------------------------------------------------------+
//| Error message                                                    |
//+------------------------------------------------------------------+
void PrintError(string msg, bool isGetLastError = false)
{
   PrintMsg("Error: " + msg, isGetLastError);
}

//+------------------------------------------------------------------+