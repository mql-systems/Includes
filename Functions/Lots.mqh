//+------------------------------------------------------------------+
//|                                                         Lots.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| Lot digits                                                       |
//+------------------------------------------------------------------+
int LotDigits(string symbol = NULL)
{
   static int staticRes = -1;
   if (staticRes != -1)
      return staticRes;

   if (symbol == NULL)
      symbol = _Symbol;

   int res = 0;
   double lot = SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);
   if (lot == 0.0)
      lot = SymbolInfoDouble(symbol, SYMBOL_VOLUME_MIN);
   
   if (MathMod(lot, 1) > 0.00000001)
   {
      do {
         res++;
      } while (res < 8 && MathMod(lot * MathPow(10, res), 1) > 0.00000001);
   }

   if (symbol == _Symbol)
      staticRes = res;

   return res;
}

//+------------------------------------------------------------------+
//| Check lots step                                                  |
//+------------------------------------------------------------------+
bool CheckLotsStep(double lots, double step)
{
   double r = NormalizeDouble(lots / step, 2);
   
   return (NormalizeDouble(r-(int)r, 1) == 0.0);
}

//+------------------------------------------------------------------+