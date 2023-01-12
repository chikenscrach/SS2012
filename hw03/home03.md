<center>IDL 程式語言（作業 03）（取檔名為 HW03_學號.pro）</center>

題目：
以下列指令敘述讀取 marsglobe.jpg 檔案中的真彩影像且儲存為變數 img1 :file = FILEPATH(‘marsglobe.jpg’, SUBDIRECTORY=[‘examples’,’data’])  
READ_JPEG, file, img1  
變數 img1 是個 3 × 400 × 400 的陣列，第一個維度為 3，包含三個顏色頻道，下標 0 代表紅色頻道，下標 1 代表綠色頻道，下標 2 代表藍色頻道。
1. 以 WINDOW 程序開啓一個 800 × 400 的 IDL0 繪圖視窗。（10%）
2. 以 TV 程序顯示真彩影像 img1 至 IDL0 視窗的左半部。（10%）
3. 以陣列分解方式將三維的影像變數 img1 分解為三個二維（400 × 400）的紅綠藍影像變數 red、green、blue。（20%）
4. 以 TV 程序在一個新的 1200 × 400 標號為 IDL1 繪圖視窗從左至右分別顯示索引影像 red、green、blue。（10%）
5. 以 WHERE 函數將影像變數 red、green、blue 中像素值小於 120 設為 0，其它像素值不變，然後儲存新的影像變數為 red2、green2、blue2。（20%）
6. 以 TV 程序在一個新的 1200 × 800 標號為 IDL2 繪圖視窗從左至右從上至下分別顯示索引影像 red、green、blue、red2、green2、blue2。（10%）
7. 將紅綠藍影像變數 red、green、blue 組合回 400 × 400 × 3 的影像變數 img2，然後以 TV 程序在題 1 所建立的 IDL0 視窗之右半部顯示這個真彩影像，並確認 IDL0 視窗的左和右影像必須要相同。（20%）

**（注意：下次上課前把此 pro 檔繳交至新 EE 系統，程式執行後螢幕上會有三個繪圖視窗）**