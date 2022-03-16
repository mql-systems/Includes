//+------------------------------------------------------------------+
//|                                             ChartObjectsGann.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include "ChartObjects.mqh";
#include <ChartObjects\ChartObjectsGann.mqh>

CArrayObj g_ChartObjGann;

//+------------------------------------------------------------------+
//| ChartObject - GannLine                                           |
//+------------------------------------------------------------------+
bool ChartObjGannLine(string   name,
                      datetime time1,
                      double   price1,
                      datetime time2,
                      double   ppb,           //PipsPerBar
                      long     chartId = 0,
                      int      window = 0,
                      bool     autoRemove = true)
{
   if (! g_ChartObjGann.Add(new CChartObjectGannLine))
      return false;
   
   int objPos = g_ChartObjGann.Total()-1;
   CChartObjectGannLine *objGannLine = g_ChartObjGann.At(objPos);
   
   if (! objGannLine.Create(chartId, name, window, time1, price1, time2, ppb))
      return false;
   
   if (! autoRemove)
   {
      objGannLine.Detach();
      g_ChartObjGann.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - GannFan                                            |
//+------------------------------------------------------------------+
bool ChartObjGannFan(string   name,
                     datetime time1,
                     double   price1,
                     datetime time2,
                     double   ppb,                 //PipsPerBar
                     bool     downtrend = false, 
                     long     chartId = 0,
                     int      window = 0,
                     bool     autoRemove = true)
{
   if (! g_ChartObjGann.Add(new CChartObjectGannFan))
      return false;
   
   int objPos = g_ChartObjGann.Total()-1;
   CChartObjectGannFan *objGannFan = g_ChartObjGann.At(objPos);
   
   if (! objGannFan.Create(chartId, name, window, time1, price1, time2, ppb))
      return false;
   if (! objGannFan.Downtrend(downtrend))
      return false;
   
   if (! autoRemove)
   {
      objGannFan.Detach();
      g_ChartObjGann.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - GannGrid                                           |
//+------------------------------------------------------------------+
bool ChartObjGannGrid(string   name,
                      datetime time1,
                      double   price1,
                      datetime time2,
                      double   ppb,                 //PipsPerBar
                      bool     downtrend = false, 
                      long     chartId = 0,
                      int      window = 0,
                      bool     autoRemove = true)
{
   if (! g_ChartObjGann.Add(new CChartObjectGannGrid))
      return false;
   
   int objPos = g_ChartObjGann.Total()-1;
   CChartObjectGannGrid *objGannGrid = g_ChartObjGann.At(objPos);
   
   if (! objGannGrid.Create(chartId, name, window, time1, price1, time2, ppb))
      return false;
   if (! objGannGrid.Downtrend(downtrend))
      return false;
   
   if (! autoRemove)
   {
      objGannGrid.Detach();
      g_ChartObjGann.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
