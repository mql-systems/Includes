//+------------------------------------------------------------------+
//|                                               OnePointInPips.mqh |
//|                            Copyright 2022. Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022. Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| One point in pips                                                |
//+------------------------------------------------------------------+
int OnePointInPips(const string symbol)
{
   int monthBarsCnt = 24*30;
   MqlRates rates[];
   int barsCnt = CopyRates(_Symbol, PERIOD_H1, 1, monthBarsCnt, rates);
   if (barsCnt == -1)
   {
      Print("Error: CopyRates(",_Symbol,", ",EnumToString(PERIOD_H1),", 1, ",monthBarsCnt,"). Code: ", GetLastError());
      return 0;
   }
   double averageValueBar = 0.0;
   for (int i=0; i<barsCnt; i++)
      averageValueBar += (rates[i].high-rates[i].low)/_Point/barsCnt;
   
   return (averageValueBar > 100) ?
      (int)MathPow(10,(int)MathFloor(MathLog10(averageValueBar)-1)) : 1;
}

//+------------------------------------------------------------------+
