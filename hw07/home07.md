<p align="center">IDL 程式語言（作業 07）（取檔名為 HW07_學號.pro）</p>

題目：
1. 從課程網頁下載 wind_mfi.save 和 wind_swe.save 檔，然後合併為以 MFI 時間標記為主的 wind_merge.save 檔（30%），其內容為下列變數：  
YEAR    INT    = Array[2880]  
MONTH   BYTE   = Array[2880]  
DAY     BYTE   = Array[2880]  
HOUR    BYTE   = Array[2880]  
MINUTE  BYTE   = Array[2880]  
SECOND  FLOAT  = Array[2880]  
NP      FLOAT  = Array[2880]  
VX      FLOAT  = Array[2880]  
BX      FLOAT  = Array[2880]  
BY      FLOAT  = Array[2880]  
BZ      FLOAT  = Array[2880]  

2. 請至課程網頁下載 wind_all.save，並使用此檔中的 BZ 和 DP（= 1.6726E-06 *NP * VX * VX）驅動 Shue et al. [1997] 磁層頂模式，製作一個 GIF 動畫，不需要把所有 2880 點的資料都拿去驅動模式，間隔 80 點畫一次畫面即可，所以這動畫總共有 36 個畫面（70%）。

<p align="center" width="100%"><img width="33%" src="https://github.com/chikenscrach/SS2012/blob/main/hw07/image/img-1.png"><img width="67%" src="https://github.com/chikenscrach/SS2012/blob/main/hw07/image/img-2.png"></p>

<p align="left" width="100%"><img src="https://github.com/chikenscrach/SS2012/blob/main/hw07/image/img-3.png"></p>

**（注意：下次上課前把此 pro 檔繳交至新 EE 系統，不需要寄資料檔或影片檔）**