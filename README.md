# MQL4 and MQL5 includes (lib)

## Install

```
cd YourMT4(or5)/MQL4(or5)/Include
git clone https://github.com/mql-systems/Includes.git DS
```

## Multi MQL functions

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