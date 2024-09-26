//+------------------------------------------------------------------+
//|                                            ChartObjectsLines.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include "ChartObjects.mqh";
#include <ChartObjects/ChartObjectsLines.mqh>

CArrayObj g_ChartObjLines;

//+------------------------------------------------------------------+
//| ChartObject - Vertical Line                                      |
//+------------------------------------------------------------------+
bool ChartObjVLine(string name, datetime time, long chartId = 0, int window = 0, bool autoRemove = true)
{
   if (! g_ChartObjLines.Add(new CChartObjectVLine))
      return false;
   
   int objPos = g_ChartObjLines.Total()-1;
   CChartObjectVLine *objVLine = g_ChartObjLines.At(objPos);
   
   if (! objVLine.Create(chartId, name, window, time))
      return false;
   
   if (! autoRemove)
   {
      objVLine.Detach();
      g_ChartObjLines.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Horizontal Line                                    |
//+------------------------------------------------------------------+
bool ChartObjHLine(string name, double price, long chartId = 0, int window = 0, bool autoRemove = true)
{
   if (! g_ChartObjLines.Add(new CChartObjectHLine))
      return false;
   
   int objPos = g_ChartObjLines.Total()-1;
   CChartObjectHLine *objHLine = g_ChartObjLines.At(objPos);
   
   if (! objHLine.Create(chartId, name, window, price))
      return false;
   
   if (! autoRemove)
   {
      objHLine.Detach();
      g_ChartObjLines.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Cycles                                             |
//+------------------------------------------------------------------+
bool ChartObjCycles(string   name,
                    datetime time1,
                    double   price1,
                    datetime time2,
                    double   price2,
                    long     chartId = 0,
                    int      window = 0,
                    bool     autoRemove = true)
{
   if (! g_ChartObjLines.Add(new CChartObjectCycles))
      return false;
   
   int objPos = g_ChartObjLines.Total()-1;
   CChartObjectCycles *objCycle = g_ChartObjLines.At(objPos);
   
   if (! objCycle.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   
   if (! autoRemove)
   {
      objCycle.Detach();
      g_ChartObjLines.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Trend                                              |
//+------------------------------------------------------------------+
bool ChartObjTrend(string   name,
                   datetime time1,
                   double   price1,
                   datetime time2,
                   double   price2,
                   bool     rayLeft = false,
                   bool     rayRight = false,
                   long     chartId = 0,
                   int      window = 0,
                   bool     autoRemove = true)
{
   if (! g_ChartObjLines.Add(new CChartObjectTrend))
      return false;
   
   int objPos = g_ChartObjLines.Total()-1;
   CChartObjectTrend *objTrend = g_ChartObjLines.At(objPos);
   
   if (! objTrend.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   if (rayLeft && ! objTrend.RayLeft(rayLeft))
      return false;
   if (rayRight && ! objTrend.RayRight(rayRight))
      return false;
   
   if (! autoRemove)
   {
      objTrend.Detach();
      g_ChartObjLines.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - TrendByAngle                                       |
//+------------------------------------------------------------------+
bool ChartObjTrendByAngle(string   name,
                          datetime time1,
                          double   price1,
                          datetime time2,
                          double   price2,
                          double   angle,
                          long     chartId = 0,
                          int      window = 0,
                          bool     autoRemove = true)
{
   if (! g_ChartObjLines.Add(new CChartObjectTrendByAngle))
      return false;
   
   int objPos = g_ChartObjLines.Total()-1;
   CChartObjectTrendByAngle *objTrendByAngle = g_ChartObjLines.At(objPos);
   
   if (! objTrendByAngle.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   if (! objTrendByAngle.Angle(angle))
      return false;
   
   if (! autoRemove)
   {
      objTrendByAngle.Detach();
      g_ChartObjLines.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
