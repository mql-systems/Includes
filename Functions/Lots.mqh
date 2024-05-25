//+------------------------------------------------------------------+
//|                                                         Lots.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| Check lots step                                                  |
//+------------------------------------------------------------------+
bool CheckLotsStep(double lots, double step)
{
   double r = NormalizeDouble(lots / step, 2);
   
   return (NormalizeDouble(r-(int)r, 1) == 0.0);
}


//+------------------------------------------------------------------+