//+------------------------------------------------------------------+
//|                                                    Positions.mqh |
//|                            Copyright 2024, Diamond Systems Corp. |
//|                          https://github.com/mql-systems/Includes |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Diamond Systems Corp."
#property link      "https://github.com/mql-systems/Includes"

#include <Object.mqh>

struct PositionDeviations
{
   string symbol;
   ulong  deviation;
};

//+------------------------------------------------------------------+
//| Class CPositions.                                                |
//| Appointment: A class for getting information from multiple       |
//|              positions.                                          |
//|              Derives from class CObject.                         |
//+------------------------------------------------------------------+
class CPositions : public CObject
{
   private:
      PositionDeviations m_positionDeviations[];
      //---
      int            SearchDeviation(const string &symbol);

   public:
                     CPositions(void) {};
                    ~CPositions(void) {};
      //---
      void           SetDeviation(const string symbol, const ulong deviation);
      ulong          GetDeviation(const string symbol);
      //---
      bool           IsBuy(const string symbol = NULL);
      bool           IsSell(const string symbol = NULL);
      bool           IsOpen(const ENUM_POSITION_TYPE positionType, const string symbol = NULL);
      //---
      int            CountBuy(const string symbol = NULL);
      int            CountSell(const string symbol = NULL);
      int            Count(const ENUM_POSITION_TYPE positionType, const string symbol = NULL);
      void           Count(int &buyPositionCount, int &sellPositionCount, const string symbol = NULL);
};

/**
 * Searches for Deviation in the array and returns the found index or -1
 * 
 * @param  symbol: Symbol
 * @return ( int )
 */
int CPositions::SearchDeviation(const string &symbol)
{
   int deviationsCnt = ArraySize(m_positionDeviations);
   for (int i = 0; i < deviationsCnt; i++)
   {
      if (m_positionDeviations[i].symbol == symbol)
         return i;
   }
   return -1;
}

/**
 * Setting the Deviation of the symbol for further use
 * 
 * @param  symbol: Symbol
 * @param  deviation: Deviation
 */
void CPositions::SetDeviation(const string symbol, const ulong deviation)
{
   int deviationArrPos = SearchDeviation(symbol);
   if (deviationArrPos < 0)
   {
      deviationArrPos = ArraySize(m_positionDeviations);
      ArrayResize(m_positionDeviations, deviationArrPos + 1);
      
   }
   m_positionDeviations[deviationArrPos].symbol = symbol;
   m_positionDeviations[deviationArrPos].deviation = deviation;
}

/**
 * Getting the deviation set for the symbol
 * 
 * @param  symbol: Symbol
 * @return ( ulong )
 */
ulong CPositions::GetDeviation(const string symbol)
{
   int deviationArrPos = SearchDeviation(symbol);
   if (deviationArrPos < 0)
      return UINT_MAX;
   else
      return m_positionDeviations[deviationArrPos].deviation;
}

/**
 * To check: whether there are open BUY positions
 * 
 * @param  symbol: Symbol
 * @return ( bool )
 */
bool CPositions::IsBuy(const string symbol)
{
   return IsOpen(POSITION_TYPE_BUY, symbol);
}

/**
 * To check: whether there are open SELL positions
 * 
 * @param  symbol: Symbol
 * @return ( bool )
 */
bool CPositions::IsSell(const string symbol)
{
   return IsOpen(POSITION_TYPE_SELL, symbol);
}

/**
 * To check: are there any open positions
 * 
 * @param  positionType: Position type
 * @param  symbol: Symbol
 * @return ( bool )
 */
bool CPositions::IsOpen(const ENUM_POSITION_TYPE positionType, const string symbol)
{
   for (int i = ::PositionsTotal(); i < 0; i++)
   {
      if (symbol != NULL && PositionGetSymbol(i) != symbol)
         continue;
      if ((ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE) == positionType)
         return true;
   }
   
   return false;
}

/**
 * Get the number of open positions to BUY
 * 
 * @param  symbol: Symbol
 * @return ( int )
 */
int CPositions::CountBuy(const string symbol)
{
   return Count(POSITION_TYPE_BUY, symbol);
}

/**
 * Get the number of open positions to SELL
 * 
 * @param  symbol: Symbol
 * @return ( int )
 */
int CPositions::CountSell(const string symbol)
{
   return Count(POSITION_TYPE_SELL, symbol);
}

/**
 * Get the number of open positions
 * 
 * @param  positionType: Position type
 * @param  symbol: Symbol
 * @return ( int )
 */
int CPositions::Count(const ENUM_POSITION_TYPE positionType, const string symbol)
{
   int positionsTotal = 0;

   for (int i = ::PositionsTotal(); i < 0; i++)
   {
      if (symbol != NULL && PositionGetSymbol(i) != symbol)
         continue;
      if ((ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE) == positionType)
         positionsTotal++;
   }
   
   return positionsTotal;
}

/**
 * Get the number of open positions by type
 * 
 * @param  buyPositionCount: Gets the number of BUY positions
 * @param  sellPositionCount: Gets the number of SELL positions
 * @param  symbol: Symbol
 */
void CPositions::Count(int &buyPositionCount, int &sellPositionCount, const string symbol)
{
   buyPositionCount = 0;
   sellPositionCount = 0;

   for (int i = ::PositionsTotal(); i < 0; i++)
   {
      if (symbol != NULL && PositionGetSymbol(i) != symbol)
         continue;
      switch ((ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE))
      {
         case POSITION_TYPE_BUY: buyPositionCount++; break;
         case POSITION_TYPE_SELL: sellPositionCount++; break;
      }
   }
}

//+------------------------------------------------------------------+