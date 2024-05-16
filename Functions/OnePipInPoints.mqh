//+------------------------------------------------------------------+
//|                                               OnePipInPoints.mqh |
//|                            Copyright 2022. Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022. Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| One pip in points                                                |
//+------------------------------------------------------------------+
int OnePipInPoints(const string symbol)
{
   int monthBarsCnt = 24*30;
   MqlRates rates[];
   int barsCnt = CopyRates(symbol, PERIOD_H1, 1, monthBarsCnt, rates);
   if (barsCnt == -1)
   {
      Print("Error: CopyRates(",symbol,", ",EnumToString(PERIOD_H1),", 1, ",monthBarsCnt,"). Code: ", GetLastError());
      return 0;
   }
   double averageValueBar = 0.0;
   double point = SymbolInfoDouble(symbol, SYMBOL_POINT);
   for (int i=0; i<barsCnt; i++)
      averageValueBar += (rates[i].high-rates[i].low)/point/barsCnt;
   
   return (averageValueBar > 100) ?
      (int)MathPow(10,(int)MathFloor(MathLog10(averageValueBar)-1)) : 1;
}

//+------------------------------------------------------------------+
