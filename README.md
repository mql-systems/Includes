# MQL4 and MQL5 includes (lib)

## Install

```
cd YourMT4(or5)/MQL4(or5)/Include
git clone https://github.com/mql-systems/Includes.git DS
```

## Multi MQL functions


### ChartObjects

```mql5
#include <DS\MultiMqlFunctions\ChartObjects\ChartObjectsFibo.mqh>

datetime t1 = iTime(_Symbol, _Period, 1);
datetime t2 = iTime(_Symbol, _Period, 10);
datetime t3 = iTime(_Symbol, _Period, 30);
//---
double   p1 = iOpen(_Symbol, _Period, 1);
double   p2 = iOpen(_Symbol, _Period, 10);
double   p3 = iOpen(_Symbol, _Period, 30);

// Example 1
if (ChartObjFibo("ChartObjFibo", t2, p2, t1, p1))
   Print("ChartObjFibo: ok");
else
   Print("ChartObjFibo: no");

// Example 2
bool autoRemove = false; // "autoRemove = false" - do not remove the graphic object from the chart

if (ChartObjFiboTimes("ChartObjFiboTimes", t2, p2, t1, p1, 0, 0, autoRemove))
   Print("ChartObjFiboTimes: ok");
else
   Print("ChartObjFiboTimes: no");

// Example 3
long chartId = ChartID(); // chart ID
int  window  = 1;         // window with indicator 1

if (ChartObjFiboFan("ChartObjFiboFan", t2, p2, t1, p1, chartId, window))
   Print("ChartObjFiboFan: ok");
else
   Print("ChartObjFiboFan: no");

// Example 4
double scale = 4.5;
bool   ellipse = true;

if (ChartObjFiboArc("ChartObjFiboArc", t2, p2, t1, p1, scale, ellipse))
   Print("ChartObjFiboArc: ok");
else
   Print("ChartObjFiboArc: no");

// Example 5
if (ChartObjFiboChannel("ChartObjFiboChannel", t3, p3, t2, p2, t1, p1))
   Print("ChartObjFiboChannel: ok");
else
   Print("ChartObjFiboChannel: no");

// Example 6
if (ChartObjFiboExpansion("ChartObjFiboExpansion", t3, p3, t2, p2, t1, p1))
   Print("ChartObjFiboExpansion: ok");
else
   Print("ChartObjFiboExpansion: no");
```


### CalcProfit()

```mql5
#include <DS\MultiMqlFunctions\CalcProfit.mqh>

// Example 1
double totalProfit = CalcProfit();

// Example 2
double buyProfit   = 0;
double sellProfit  = 0;
double totalProfit = CalcProfit(buyProfit, sellProfit);

// Example 3
double totalProfit = CalcProfit(POSITION_TYPE_BUY);

// Example 4
int expertMagicNumber = 123456789;
double totalProfit = CalcProfit(POSITION_TYPE_SELL, "GBPUSD", expertMagicNumber);

// Example 5
double totalProfit = CalcProfit(NULL, "USDCHF");

// Example 6
int expertMagicNumber = 123456789;
double totalProfit = CalcProfit(NULL, NULL, expertMagicNumber);
```
