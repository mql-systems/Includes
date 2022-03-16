//+------------------------------------------------------------------+
//|                                             ChartObjectsFibo.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include "ChartObjects.mqh";
#include <ChartObjects\ChartObjectsFibo.mqh>

CArrayObj g_ChartObjFibo;

//+------------------------------------------------------------------+
//| ChartObject - Fibo                                               |
//+------------------------------------------------------------------+
bool ChartObjFibo(string   name,
                  datetime time1,
                  double   price1,
                  datetime time2,
                  double   price2,
                  long     chartId = 0,
                  int      window = 0,
                  bool     autoRemove = true)
{
   if (! g_ChartObjFibo.Add(new CChartObjectFibo))
      return false;
   
   int objPos = g_ChartObjFibo.Total()-1;
   CChartObjectFibo *objFibo = g_ChartObjFibo.At(objPos);
   
   if (! objFibo.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   
   if (! autoRemove)
   {
      objFibo.Detach();
      g_ChartObjFibo.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - FiboTimes                                          |
//+------------------------------------------------------------------+
bool ChartObjFiboTimes(string   name,
                       datetime time1,
                       double   price1,
                       datetime time2,
                       double   price2,
                       long     chartId = 0,
                       int      window = 0,
                       bool     autoRemove = true)
{
   if (! g_ChartObjFibo.Add(new CChartObjectFiboTimes))
      return false;
   
   int objPos = g_ChartObjFibo.Total()-1;
   CChartObjectFiboTimes *objFiboTimes = g_ChartObjFibo.At(objPos);
   
   if (! objFiboTimes.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   
   if (! autoRemove)
   {
      objFiboTimes.Detach();
      g_ChartObjFibo.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - FiboFan                                            |
//+------------------------------------------------------------------+
bool ChartObjFiboFan(string   name,
                     datetime time1,
                     double   price1,
                     datetime time2,
                     double   price2,
                     long     chartId = 0,
                     int      window = 0,
                     bool     autoRemove = true)
{
   if (! g_ChartObjFibo.Add(new CChartObjectFiboFan))
      return false;
   
   int objPos = g_ChartObjFibo.Total()-1;
   CChartObjectFiboFan *objFiboFan = g_ChartObjFibo.At(objPos);
   
   if (! objFiboFan.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   
   if (! autoRemove)
   {
      objFiboFan.Detach();
      g_ChartObjFibo.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - FiboArc                                            |
//+------------------------------------------------------------------+
bool ChartObjFiboArc(string   name,
                     datetime time1,
                     double   price1,
                     datetime time2,
                     double   price2,
                     double   scale,
                     bool     ellipse = false,
                     long     chartId = 0,
                     int      window = 0,
                     bool     autoRemove = true)
{
   if (! g_ChartObjFibo.Add(new CChartObjectFiboArc))
      return false;
   
   int objPos = g_ChartObjFibo.Total()-1;
   CChartObjectFiboArc *objFiboArc = g_ChartObjFibo.At(objPos);
   
   if (! objFiboArc.Create(chartId, name, window, time1, price1, time2, price2, scale))
      return false;
   if (ellipse && ! objFiboArc.Ellipse(ellipse))
      return false;
   
   if (! autoRemove)
   {
      objFiboArc.Detach();
      g_ChartObjFibo.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - FiboChannel                                        |
//+------------------------------------------------------------------+
bool ChartObjFiboChannel(string   name,
                         datetime time1,
                         double   price1,
                         datetime time2,
                         double   price2,
                         datetime time3,
                         double   price3,
                         long     chartId = 0,
                         int      window = 0,
                         bool     autoRemove = true)
{
   if (! g_ChartObjFibo.Add(new CChartObjectFiboChannel))
      return false;
   
   int objPos = g_ChartObjFibo.Total()-1;
   CChartObjectFiboChannel *objFiboChannel = g_ChartObjFibo.At(objPos);
   
   if (! objFiboChannel.Create(chartId, name, window, time1, price1, time2, price2, time3, price3))
      return false;
   
   if (! autoRemove)
   {
      objFiboChannel.Detach();
      g_ChartObjFibo.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - FiboExpansion                                      |
//+------------------------------------------------------------------+
bool ChartObjFiboExpansion(string   name,
                          datetime time1,
                          double   price1,
                          datetime time2,
                          double   price2,
                          datetime time3,
                          double   price3,
                          long     chartId = 0,
                          int      window = 0,
                          bool     autoRemove = true)
{
   if (! g_ChartObjFibo.Add(new CChartObjectFiboExpansion))
      return false;
   
   int objPos = g_ChartObjFibo.Total()-1;
   CChartObjectFiboExpansion *objFiboExpansion = g_ChartObjFibo.At(objPos);
   
   if (! objFiboExpansion.Create(chartId, name, window, time1, price1, time2, price2, time3, price3))
      return false;
   
   if (! autoRemove)
   {
      objFiboExpansion.Detach();
      g_ChartObjFibo.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
