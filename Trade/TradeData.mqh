//+------------------------------------------------------------------+
//|                                                    TradeData.mqh |
//|                            Copyright 2024, Diamond Systems Corp. |
//|                          https://github.com/mql-systems/Includes |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, Diamond Systems Corp."
#property link      "https://github.com/mql-systems/Includes"

#include <Object.mqh>

struct TradeData
{
   string symbol;
   ulong  deviation;
};

//+------------------------------------------------------------------+
//| Class CTradeData.                                                |
//| Appointment: Basic class for working with trade classes          |
//|              Derives from class CObject.                         |
//+------------------------------------------------------------------+
class CTradeData : public CObject
{
   protected:
      MqlTradeRequest   m_request;                 // request data
      MqlTradeResult    m_result;                  // result data
      TradeData         m_tradeData[];
      ulong             m_magic;                   // expert magic number
      ulong             m_deviation;               // deviation default
      ENUM_ORDER_TYPE_FILLING m_typeFilling;
   
   public:
                        CTradeData(void);
                       ~CTradeData(void);
      //--- trade methods
      void              SetDeviation(const ulong deviation, const string symbol);
      void              SetDeviation(const ulong deviation)                   { m_deviation = deviation; }
      void              SetMagicNumber(const ulong magic)                     { m_magic = magic;         }
      void              SetTypeFilling(const ENUM_ORDER_TYPE_FILLING filling) { m_typeFilling = filling; }
   
   protected:
      void              ClearStructures(void);
      bool              IsStopped(const string function);
      ulong             GetDeviation(const string symbol);
      int               SearchDeviation(const string &symbol);
      bool              FillingCheck(const string symbol);
      bool              ExpirationCheck(const string symbol);
};

/**
 * Constructor
 */
CTradeData::CTradeData(void) : m_magic(0),
                               m_deviation(10),
                               m_typeFilling(ORDER_FILLING_FOK)
{
   ClearStructures();
}

/**
 * Destructor
 */
CTradeData::~CTradeData(void)
{
}

/**
 * Setting the Deviation of the symbol for further use
 * 
 * @param  deviation: Deviation
 * @param  symbol: Symbol
 */
void CTradeData::SetDeviation(const ulong deviation, const string symbol)
{
   int deviationArrPos = SearchDeviation(symbol);
   if (deviationArrPos < 0)
   {
      deviationArrPos = ArraySize(m_tradeData);
      ArrayResize(m_tradeData, deviationArrPos + 1);
      
   }
   m_tradeData[deviationArrPos].symbol = symbol;
   m_tradeData[deviationArrPos].deviation = deviation;
}

/**
 * Clear structures m_request and m_result
 */
void CTradeData::ClearStructures(void)
{
   ZeroMemory(m_request);
   ZeroMemory(m_result);
}

/**
 * Checks forced shutdown of MQL5-program
 */
bool CTradeData::IsStopped(const string function)
{
   if (!::IsStopped())
      return false;
   //--- MQL5 program is stopped
   PrintFormat("%s: MQL5 program is stopped. Trading is disabled", function);
   m_result.retcode = TRADE_RETCODE_CLIENT_DISABLES_AT;
   return true;
}

/**
 * Getting the deviation set for the symbol
 * 
 * @param  symbol: Symbol
 * @return ( ulong )
 */
ulong CTradeData::GetDeviation(const string symbol)
{
   int deviationArrPos = SearchDeviation(symbol);
   if (deviationArrPos < 0)
      return m_deviation;
   else
      return m_tradeData[deviationArrPos].deviation;
}

/**
 * Searches for Deviation in the array and returns the found index or -1
 * 
 * @param  symbol: Symbol
 * @return ( int )
 */
int CTradeData::SearchDeviation(const string &symbol)
{
   int deviationsCnt = ArraySize(m_tradeData);
   for (int i = 0; i < deviationsCnt; i++)
   {
      if (m_tradeData[i].symbol == symbol)
         return i;
   }
   return -1;
}

/**
 * Checks and corrects type of filling policy
 * 
 * @param  symbol: Symbol
 * @return ( bool )
 */
bool CTradeData::FillingCheck(const string symbol)
{
   //--- check execution mode
   ENUM_SYMBOL_TRADE_EXECUTION exec = (ENUM_SYMBOL_TRADE_EXECUTION)SymbolInfoInteger(symbol, SYMBOL_TRADE_EXEMODE);

   if (exec == SYMBOL_TRADE_EXECUTION_REQUEST || exec == SYMBOL_TRADE_EXECUTION_INSTANT)
      return true; // neccessary filling type will be placed automatically
   
   uint filling = (uint)SymbolInfoInteger(symbol, SYMBOL_FILLING_MODE);
   
   //--- MARKET execution mode
   if (exec == SYMBOL_TRADE_EXECUTION_MARKET)
   {
      //--- analyze order
      if (m_request.action != TRADE_ACTION_PENDING)
      {
         //--- in case of instant execution order
         //--- if the required filling policy is supported, add it to the request
         if ((filling&SYMBOL_FILLING_FOK) == SYMBOL_FILLING_FOK)
         {
            m_typeFilling = ORDER_FILLING_FOK;
            m_request.type_filling = m_typeFilling;
            return true;
         }
         if ((filling&SYMBOL_FILLING_IOC) == SYMBOL_FILLING_IOC)
         {
            m_typeFilling = ORDER_FILLING_IOC;
            m_request.type_filling = m_typeFilling;
            return true;
         }
         //--- wrong filling policy, set error code
         m_result.retcode = TRADE_RETCODE_INVALID_FILL;
         return false;
      }
      return true;
   }

   //--- EXCHANGE execution mode
   switch (m_typeFilling)
   {
      case ORDER_FILLING_FOK:
         //--- analyze order
         if (m_request.action == TRADE_ACTION_PENDING)
         {
            //--- in case of pending order
            //--- add the expiration mode to the request
            if (! ExpirationCheck(symbol))
               m_request.type_time = ORDER_TIME_DAY;
            //--- stop order?
            if (m_request.type == ORDER_TYPE_BUY_STOP || m_request.type == ORDER_TYPE_SELL_STOP ||
                m_request.type == ORDER_TYPE_BUY_LIMIT || m_request.type == ORDER_TYPE_SELL_LIMIT)
            {
               //--- in case of stop order
               //--- add the corresponding filling policy to the request
               m_request.type_filling = ORDER_FILLING_RETURN;
               return true;
            }
         }
         //--- in case of limit order or instant execution order
         //--- if the required filling policy is supported, add it to the request
         if ((filling&SYMBOL_FILLING_FOK) == SYMBOL_FILLING_FOK)
         {
            m_request.type_filling = m_typeFilling;
            return true;
         }
         //--- wrong filling policy, set error code
         m_result.retcode = TRADE_RETCODE_INVALID_FILL;
         return false;
      case ORDER_FILLING_IOC:
         //--- analyze order
         if (m_request.action == TRADE_ACTION_PENDING)
         {
            //--- in case of pending order
            //--- add the expiration mode to the request
            if (! ExpirationCheck(symbol))
               m_request.type_time = ORDER_TIME_DAY;
            //--- stop order?
            if (m_request.type == ORDER_TYPE_BUY_STOP || m_request.type == ORDER_TYPE_SELL_STOP ||
                m_request.type == ORDER_TYPE_BUY_LIMIT || m_request.type == ORDER_TYPE_SELL_LIMIT)
            {
               //--- in case of stop order
               //--- add the corresponding filling policy to the request
               m_request.type_filling = ORDER_FILLING_RETURN;
               return true;
            }
         }
         //--- in case of limit order or instant execution order
         //--- if the required filling policy is supported, add it to the request
         if ((filling&SYMBOL_FILLING_IOC) == SYMBOL_FILLING_IOC)
         {
            m_request.type_filling = m_typeFilling;
            return true;
         }
         //--- wrong filling policy, set error code
         m_result.retcode = TRADE_RETCODE_INVALID_FILL;
         return false;
      case ORDER_FILLING_RETURN:
         //--- add filling policy to the request
         m_request.type_filling = m_typeFilling;
         return true;
   }

   //--- unknown execution mode, set error code
   m_result.retcode = TRADE_RETCODE_ERROR;
   return false;
}

/**
 * Check expiration type of pending order
 * 
 * @param  symbol: Symbol
 * @return ( bool )
 */
bool CTradeData::ExpirationCheck(const string symbol)
{
   //--- get flags
   long tmp_long;
   int  flags = 0;

   if (SymbolInfoInteger(symbol, SYMBOL_EXPIRATION_MODE, tmp_long))
      flags = (int)tmp_long;

   //--- check type
   switch(m_request.type_time)
   {
      case ORDER_TIME_GTC:
         if ((flags&SYMBOL_EXPIRATION_GTC) != 0)
            return true;
         break;
      case ORDER_TIME_DAY:
         if ((flags&SYMBOL_EXPIRATION_DAY) != 0)
            return true;
         break;
      case ORDER_TIME_SPECIFIED:
         if ((flags&SYMBOL_EXPIRATION_SPECIFIED) != 0)
            return true;
         break;
      case ORDER_TIME_SPECIFIED_DAY:
         if ((flags&SYMBOL_EXPIRATION_SPECIFIED_DAY) != 0)
            return true;
         break;
      default:
         Print(__FUNCTION__+": Unknown expiration type");
   }
   
   //--- failed
   return false;
}

//+------------------------------------------------------------------+