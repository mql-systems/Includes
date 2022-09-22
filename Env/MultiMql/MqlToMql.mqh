//+------------------------------------------------------------------+
//|                                                     MqlToMql.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#ifdef __MQL4__
   #include <DS\Include\Env\MQL4\Mql5ToMql4.mqh>
#else
   #ifdef __MQL5__
      #include <DS\Include\Env\MQL5\Mql4ToMql5.mqh>
   #else
#endif

//+------------------------------------------------------------------+