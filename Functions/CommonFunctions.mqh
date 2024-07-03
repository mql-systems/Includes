//+------------------------------------------------------------------+
//|                                              CommonFunctions.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

//+------------------------------------------------------------------+
//| Is double equal                                                  |
//+------------------------------------------------------------------+
bool IsDoubleEqual(double val1, double val2, int digits = 7)
{
   return (NormalizeDouble(val1 - val2, digits + 1) == 0);
}

//+------------------------------------------------------------------+
//| Compare double                                                   |
//| ---------------                                                  |
//| return -1 = val1 is less than val2 (val1 < val1)                 |
//| return  0 = val1 is equal to val2 (val1 == val1)                 |
//| return  1 = val1 is greater than val2 (val1 > val1)              |
//+------------------------------------------------------------------+
int CompareDouble(double val1, double val2, int digits = 7)
{
   if (NormalizeDouble(val1 - val2, digits + 1) == 0)
      return 0;
   if (val1 > val2)
      return 1;
   else
      return -1;
}

//+------------------------------------------------------------------+
//| Period to String                                                 |
//+------------------------------------------------------------------+
string PeriodToString(const ENUM_TIMEFRAMES timeframe = PERIOD_CURRENT)
{
   if (timeframe == PERIOD_CURRENT)
      return PeriodToString(Period());
   
   switch (timeframe)
   {
      case PERIOD_M1: return "M1";
      case PERIOD_M2: return "M2";
      case PERIOD_M3: return "M3";
      case PERIOD_M4: return "M4";
      case PERIOD_M5: return "M5";
      case PERIOD_M6: return "M6";
      case PERIOD_M10: return "M10";
      case PERIOD_M12: return "M12";
      case PERIOD_M15: return "M15";
      case PERIOD_M20: return "M20";
      case PERIOD_M30: return "M30";
      case PERIOD_H1: return "H1";
      case PERIOD_H2: return "H2";
      case PERIOD_H3: return "H3";
      case PERIOD_H4: return "H4";
      case PERIOD_H6: return "H6";
      case PERIOD_H8: return "H8";
      case PERIOD_H12: return "H12";
      case PERIOD_D1: return "D1";
      case PERIOD_W1: return "W1";
      case PERIOD_MN1: return "MN1";
      default: return "";
   }
}

//+------------------------------------------------------------------+