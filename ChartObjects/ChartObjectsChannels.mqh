//+------------------------------------------------------------------+
//|                                         ChartObjectsChannels.mqh |
//|                                            Diamond Systems Corp. |
//|                                   https://github.com/mql-systems |
//+------------------------------------------------------------------+
#property copyright "Diamond Systems Corp."
#property link      "https://github.com/mql-systems"

#include "ChartObjects.mqh";
#include <ChartObjects/ChartObjectsChannels.mqh>

CArrayObj g_ChartObjChannels;

//+------------------------------------------------------------------+
//| ChartObject - Channel                                            |
//+------------------------------------------------------------------+
bool ChartObjChannel(string   name,
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
   if (! g_ChartObjChannels.Add(new CChartObjectChannel))
      return false;
   
   int objPos = g_ChartObjChannels.Total()-1;
   CChartObjectChannel *objChannel = g_ChartObjChannels.At(objPos);
   
   if (! objChannel.Create(chartId, name, window, time1, price1, time2, price2, time3, price3))
      return false;
   
   if (! autoRemove)
   {
      objChannel.Detach();
      g_ChartObjChannels.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Regression                                         |
//+------------------------------------------------------------------+
bool ChartObjRegression(string   name,
                        datetime time1,
                        datetime time2,
                        long     chartId = 0,
                        int      window = 0,
                        bool     autoRemove = true)
{
   if (! g_ChartObjChannels.Add(new CChartObjectRegression))
      return false;
   
   int objPos = g_ChartObjChannels.Total()-1;
   CChartObjectRegression *objRegression = g_ChartObjChannels.At(objPos);
   
   if (! objRegression.Create(chartId, name, window, time1, time2))
      return false;
   
   if (! autoRemove)
   {
      objRegression.Detach();
      g_ChartObjChannels.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - StdDevChannel                                      |
//+------------------------------------------------------------------+
bool ChartObjStdDevChannel(string   name,
                           datetime time1,
                           datetime time2,
                           double   deviation,
                           long     chartId = 0,
                           int      window = 0,
                           bool     autoRemove = true)
{
   if (! g_ChartObjChannels.Add(new CChartObjectStdDevChannel))
      return false;
   
   int objPos = g_ChartObjChannels.Total()-1;
   CChartObjectStdDevChannel *objStdDevChannel = g_ChartObjChannels.At(objPos);
   
   if (! objStdDevChannel.Create(chartId, name, window, time1, time2, deviation))
      return false;
   
   if (! autoRemove)
   {
      objStdDevChannel.Detach();
      g_ChartObjChannels.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
//| ChartObject - Pitchfork                                          |
//+------------------------------------------------------------------+
bool ChartObjPitchfork(string   name,
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
   if (! g_ChartObjChannels.Add(new CChartObjectPitchfork))
      return false;
   
   int objPos = g_ChartObjChannels.Total()-1;
   CChartObjectPitchfork *objPitchfork = g_ChartObjChannels.At(objPos);
   
   if (! objPitchfork.Create(chartId, name, window, time1, price1, time2, price2, time3, price3))
      return false;
   
   if (! autoRemove)
   {
      objPitchfork.Detach();
      g_ChartObjChannels.Delete(objPos);
   }
   
   ChartRedraw();
   
   return true;
}

//+------------------------------------------------------------------+
