//+------------------------------------------------------------------+
//|                                           ChartObjectsShapes.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include "ChartObjects.mqh";
#include <ChartObjects\ChartObjectsShapes.mqh>

CArrayObj g_ChartObjShapes;

//+------------------------------------------------------------------+
//| ChartObject - Rectangle                                          |
//+------------------------------------------------------------------+
bool ChartObjRectangle(string   name,
                       datetime time1,
                       double   price1,
                       datetime time2,
                       double   price2,
                       long     chartId = 0,
                       int      window = 0,
                       bool     autoRemove = true)
{
   if (! g_ChartObjShapes.Add(new CChartObjectRectangle))
      return false;
   
   int objPos = g_ChartObjShapes.Total()-1;
   CChartObjectRectangle *objRectangle = g_ChartObjShapes.At(objPos);
   
   if (! objRectangle.Create(chartId, name, window, time1, price1, time2, price2))
      return false;
   
   if (! autoRemove)
   {
      objRectangle.Detach();
      g_ChartObjShapes.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Triangle                                           |
//+------------------------------------------------------------------+
bool ChartObjTriangle(string   name,
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
   if (! g_ChartObjShapes.Add(new CChartObjectTriangle))
      return false;
   
   int objPos = g_ChartObjShapes.Total()-1;
   CChartObjectTriangle *objTriangle = g_ChartObjShapes.At(objPos);
   
   if (! objTriangle.Create(chartId, name, window, time1, price1, time2, price2, time3, price3))
      return false;
   
   if (! autoRemove)
   {
      objTriangle.Detach();
      g_ChartObjShapes.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Ellipse                                            |
//+------------------------------------------------------------------+
bool ChartObjEllipse(string   name,
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
   if (! g_ChartObjShapes.Add(new CChartObjectEllipse))
      return false;
   
   int objPos = g_ChartObjShapes.Total()-1;
   CChartObjectEllipse *objEllipse = g_ChartObjShapes.At(objPos);
   
   if (! objEllipse.Create(chartId, name, window, time1, price1, time2, price2, time3, price3))
      return false;
   
   if (! autoRemove)
   {
      objEllipse.Detach();
      g_ChartObjShapes.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
