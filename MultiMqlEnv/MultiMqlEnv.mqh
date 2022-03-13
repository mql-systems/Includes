//+------------------------------------------------------------------+
//|                                                  MultiMqlEnv.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#ifdef __MQL4__
   #include <DS\MultiMqlEnv\Mql5ToMql4.mqh>
#else
   #ifdef __MQL5__
      #include <DS\MultiMqlEnv\Mql4ToMql5.mqh>
   #else
#endif
