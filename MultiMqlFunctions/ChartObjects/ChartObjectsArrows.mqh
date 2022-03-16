//+------------------------------------------------------------------+
//|                                           ChartObjectsArrows.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include "ChartObjects.mqh";
#include <ChartObjects\ChartObjectsArrows.mqh>

CArrayObj g_ChartObjArrows;

//+-------------------------------------------------------------------------+
//| ChartObject - Arrow                                                     |
//| -------------------                                                     |
//| MQL4 - https://docs.mql4.com/constants/objectconstants/wingdings        |
//| MQL5 - https://www.mql5.com/en/docs/constants/objectconstants/wingdings |
//+-------------------------------------------------------------------------+
bool ChartObjArrow(string            name,
                   datetime          time,
                   double            price,
                   char              code,
                   ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                   long              chartId = 0,
                   int               window = 0,
                   bool              autoRemove = true)
{
   if (! g_ChartObjArrows.Add(new CChartObjectArrow))
      return false;
   
   int objPos = g_ChartObjArrows.Total()-1;
   CChartObjectArrow *objArrow = g_ChartObjArrows.At(objPos);
   
   if (! objArrow.Create(chartId, name, window, time, price, code))
      return false;
   if (! objArrow.Anchor(anchor))
      return false;
   
   if (! autoRemove)
   {
      objArrow.Detach();
      g_ChartObjArrows.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow Check                                        |
//+------------------------------------------------------------------+
bool ChartObjArrowCheck(string            name,
                        datetime          time,
                        double            price,
                        ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                        long              chartId = 0,
                        int               window = 0,
                        bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_CHECK, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow Down                                         |
//+------------------------------------------------------------------+
bool ChartObjArrowDown(string            name,
                       datetime          time,
                       double            price,
                       ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                       long              chartId = 0,
                       int               window = 0,
                       bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_DOWN, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow Up                                           |
//+------------------------------------------------------------------+
bool ChartObjArrowUp(string            name,
                     datetime          time,
                     double            price,
                     ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                     long              chartId = 0,
                     int               window = 0,
                     bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_UP, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow Stop                                         |
//+------------------------------------------------------------------+
bool ChartObjArrowStop(string            name,
                       datetime          time,
                       double            price,
                       ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                       long              chartId = 0,
                       int               window = 0,
                       bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_STOP, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow ThumbUp                                      |
//+------------------------------------------------------------------+
bool ChartObjArrowThumbUp(string            name,
                          datetime          time,
                          double            price,
                          ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                          long              chartId = 0,
                          int               window = 0,
                          bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_THUMB_UP, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow ThumbDown                                    |
//+------------------------------------------------------------------+
bool ChartObjArrowThumbDown(string            name,
                            datetime          time,
                            double            price,
                            ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                            long              chartId = 0,
                            int               window = 0,
                            bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_THUMB_DOWN, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow LeftPrice                                    |
//+------------------------------------------------------------------+
bool ChartObjArrowLeftPrice(string            name,
                            datetime          time,
                            double            price,
                            ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                            long              chartId = 0,
                            int               window = 0,
                            bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_LEFT_PRICE, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
//| ChartObject - Arrow RightPrice                                   |
//+------------------------------------------------------------------+
bool ChartObjArrowRightPrice(string            name,
                             datetime          time,
                             double            price,
                             ENUM_ARROW_ANCHOR anchor = ANCHOR_TOP,
                             long              chartId = 0,
                             int               window = 0,
                             bool              autoRemove = true)
{
   return ChartObjArrow(name, time, price, OBJ_ARROW_RIGHT_PRICE, anchor, chartId, window, autoRemove);
}

//+------------------------------------------------------------------+
