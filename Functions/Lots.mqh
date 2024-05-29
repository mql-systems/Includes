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
//| Normalization of the lot                            |
//+------------------------------------------------------------------+
double NormalizeLot(double lot, string symbol = NULL)
{
   if (symbol == NULL)
      symbol = _Symbol;

   double lotMin = SymbolInfoDouble(symbol, SYMBOL_VOLUME_MIN);
   double lotMax = SymbolInfoDouble(symbol, SYMBOL_VOLUME_MAX);
   double lotStep = SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);

   if (lotMin > 0.0 && lotMin > lot)
      return lotMin;
   if (lotMax > 0.0 && lotMax < lot)
      return lotMax;
   if (lotStep <= 0.0)
      return NormalizeDouble(lot > 0.0 ? lot : lotMin > 0.0 ? lotMin : lot, LotDigits(symbol));
   if (lotStep > (lot + 0.00000001))
      return lotStep;

   return NormalizeDouble((int)(lot / lotStep) * lotStep, LotDigits(symbol));
}

//+------------------------------------------------------------------+
//| Checking the lot on step                                         |
//+------------------------------------------------------------------+
bool CheckLotStep(double lot, double step)
{
   double r = NormalizeDouble(lot / step, 2);
   
   return (NormalizeDouble(r-(int)r, 1) == 0.0);
}

//+------------------------------------------------------------------+