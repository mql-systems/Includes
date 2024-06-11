//+------------------------------------------------------------------+
//|                                              CommonFunctions.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| Compare double                                                   |
//+------------------------------------------------------------------+
bool CompareDouble(double d1, double d2)
{
   return (NormalizeDouble(d1 - d2, 8) == 0);
}

//+------------------------------------------------------------------+