//+------------------------------------------------------------------+
//|                                                   CalcProfit.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include <MqlSystems/Env/MqlToMql.mqh>

//+------------------------------------------------------------------+
//| Calculate profit                                                 |
//+------------------------------------------------------------------+
double CalcProfit(double &buyProfit, double &sellProfit, ENUM_POSITION_TYPE positionType = NULL, string symbol = NULL, int magicNumber = NULL)
{
   buyProfit = sellProfit = 0;

   #ifdef __MQL5__
      for (int i=0; i<PositionsTotal(); i++)
      {
         if (symbol != NULL)
         {
            if (PositionGetSymbol(i) != symbol)
               continue;
         }
         else if (PositionGetTicket(i) == 0)
            continue;
         
         if (magicNumber == NULL || magicNumber == (int)PositionGetInteger(POSITION_MAGIC))
         {
            switch ((ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE))
            {
               case POSITION_TYPE_BUY:  if (positionType != POSITION_TYPE_SELL) buyProfit += PositionGetDouble(POSITION_PROFIT); break;
               case POSITION_TYPE_SELL: if (positionType != POSITION_TYPE_BUY) sellProfit += PositionGetDouble(POSITION_PROFIT); break;
            }
         }
      }
   #else
      for (int i=0; i<OrdersTotal(); i++)
      {
         if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES) &&
             (symbol == NULL || symbol == OrderSymbol()) &&
             (magicNumber == NULL || magicNumber == OrderMagicNumber()) )
         {
            switch (OrderType())
            {
               case OP_BUY:  if (positionType != POSITION_TYPE_SELL) buyProfit += OrderProfit(); break;
               case OP_SELL: if (positionType != POSITION_TYPE_BUY) sellProfit += OrderProfit(); break;
            }
         }
      }
   #endif
   
   return 0;
}

double CalcProfit(ENUM_POSITION_TYPE positionType = NULL, string symbol = NULL, int magicNumber = NULL)
{
   double buyProfit  = 0,
          sellProfit = 0;
   
   CalcProfit(buyProfit, sellProfit, positionType, symbol, magicNumber);
   
   return (buyProfit + sellProfit);
}

//+------------------------------------------------------------------+
