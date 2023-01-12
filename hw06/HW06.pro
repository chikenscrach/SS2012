window, xsize=960, ysize=900
!p.BACKGROUND = 255
!p.color = 0
device, decomposed = 0
; 先設定r, g, b 編號各為1, 2, 3
red = [255, 0, 0]
green = [0, 255, 0]
blue = [0, 0, 255]
tvlct, red, green, blue, 1

; 八張圖都要手動條虛線位置，xyouts部分都手動調整
restore, 'tha_fgm_fgs_gsm_20070812.save'
; 這裡很重要，x軸標記時間點
; 先找開始、結束時間點
xmin = julday(month, day, year, 14, 25, 0)
x = julday(month, day, year, hour, minute, second)
xmax = julday(month, day, year, 14, 43, 0)
; 要幾個間隔
xticks = 6
; 計算每個間隔相差多少
delta = findgen(xticks + 1)
delta = delta * (xmax - xmin) / xticks + xmin
timlbl = strarr(xticks + 1)
; 把每個時間點存起來
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
; 畫圖
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-60, 60], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=timlbl, xminor=6, yminor=5, $
  xtitle='UT (hr:min)', ytitle='THA (nT)', position=[0.075, 0.105, 0.45, 0.3075]
oplot, x, bx_gsm, color=3
oplot, x, by_gsm, color=2
oplot, x, bz_gsm, color=1
xyouts, xmax, 20, ' Bx', color=3, charsize=1.25
xyouts, xmax, 0, ' By' ,color=2, charsize=1.25
xyouts, xmax, -20, ' Bz', color=1, charsize=1.25
XX = julday(month, day, year, 14, 38, 10)
YY = julday(month, day, year, 14, 40, 30)
oplot, [XX, XX], [-60, 60], linestyle=5
oplot, [YY, YY], [-60, 60], linestyle=5
xyouts, xmin, -100, 'In GSM Coordinates'

; 以下都一樣
restore, 'tha_esa_peir_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-300, 300], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=timlbl, xminor=6, yminor=5, $
  xtitle='UT (hr:min)', ytitle='THA (km/s)', position=[0.55, 0.105, 0.925, 0.3075], /noerase
oplot, x, vx_gsm, color=3
oplot, x, vy_gsm, color=2
oplot, x, vz_gsm, color=1
xyouts, xmax, 100, ' Vx', color=3, charsize=1.25
xyouts, xmax, 0, ' Vy' ,color=2, charsize=1.25
xyouts, xmax, -100, ' Vz', color=1, charsize=1.25
XX = julday(month, day, year, 14, 38, 10)
YY = julday(month, day, year, 14, 40, 30)
oplot, [XX, XX], [-300, 300], linestyle=5
oplot, [YY, YY], [-300, 300], linestyle=5
xyouts, julday(month, day, year, 14, 34, 0), -500, '12 August 2007', charthick=2, charsize=2

restore, 'thd_fgm_fgs_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
blanklbl = replicate(' ', xticks + 1)
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-60, 60], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=blanklbl, xminor=6, yminor=5, $
  ytitle='THD (nT)', position=[0.075, 0.3175, 0.45, 0.52], /noerase
oplot, x, bx_gsm, color=3
oplot, x, by_gsm, color=2
oplot, x, bz_gsm, color=1
XX = julday(month, day, year, 14, 31, 18)
YY = julday(month, day, year, 14, 39, 40)
oplot, [XX, XX], [-60, 60], linestyle=5
oplot, [YY, YY], [-60, 60], linestyle=5
xyouts, xmax, 20, ' Bx', color=3, charsize=1.25
xyouts, xmax, 0, ' By' ,color=2, charsize=1.25
xyouts, xmax, -20, ' Bz', color=1, charsize=1.25

restore, 'thd_esa_peir_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-300, 300], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=blanklbl, xminor=6, yminor=5, $
  ytitle='THD (km/s)', position=[0.55, 0.3175, 0.925, 0.52], /noerase
oplot, x, vx_gsm, color=3
oplot, x, vy_gsm, color=2
oplot, x, vz_gsm, color=1
XX = julday(month, day, year, 14, 31, 18)
YY = julday(month, day, year, 14, 39, 40)
oplot, [XX, XX], [-300, 300], linestyle=5
oplot, [YY, YY], [-300, 300], linestyle=5
xyouts, xmax, 100, ' Vx', color=3, charsize=1.25
xyouts, xmax, 0, ' Vy' ,color=2, charsize=1.25
xyouts, xmax, -100, ' Vz', color=1, charsize=1.25

restore, 'thc_fgm_fgs_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-60, 60], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=blanklbl, xminor=6, yminor=5, $
  ytitle='THC (nT)', position=[0.075, 0.53, 0.45, 0.7325], /noerase
oplot, x, bx_gsm, color=3
oplot, x, by_gsm, color=2
oplot, x, bz_gsm, color=1
XX = julday(month, day, year, 14, 31, 33)
YY = julday(month, day, year, 14, 39, 46)
oplot, [XX, XX], [-60, 60], linestyle=5
oplot, [YY, YY], [-60, 60], linestyle=5
xyouts, xmax, 20, ' Bx', color=3, charsize=1.25
xyouts, xmax, 0, ' By' ,color=2, charsize=1.25
xyouts, xmax, -20, ' Bz', color=1, charsize=1.25

restore, 'thc_esa_peir_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-300, 300], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=blanklbl, xminor=6, yminor=5, $
  ytitle='THC (km/s)', position=[0.55, 0.53, 0.925, 0.7325], /noerase
oplot, x, vx_gsm, color=3
oplot, x, vy_gsm, color=2
oplot, x, vz_gsm, color=1
XX = julday(month, day, year, 14, 31, 33)
YY = julday(month, day, year, 14, 39, 46)
oplot, [XX, XX], [-300, 300], linestyle=5
oplot, [YY, YY], [-300, 300], linestyle=5
xyouts, xmax, 100, ' Vx', color=3, charsize=1.25
xyouts, xmax, 0, ' Vy' ,color=2, charsize=1.25
xyouts, xmax, -100, ' Vz', color=1, charsize=1.25

restore, 'thb_fgm_fgs_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-60, 60], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=blanklbl, xminor=6, yminor=5, $
  ytitle='THB (nT)', position=[0.075, 0.7425, 0.45, 0.945], /noerase
oplot, x, bx_gsm, color=3
oplot, x, by_gsm, color=2
oplot, x, bz_gsm, color=1
XX = julday(month, day, year, 14, 35, 30)
YY = julday(month, day, year, 14, 40, 30)
oplot, [XX, XX], [-60, 60], linestyle=5
oplot, [YY, YY], [-60, 60], linestyle=5
xyouts, xmax, 20, ' Bx', color=3, charsize=1.25
xyouts, xmax, 0, ' By' ,color=2, charsize=1.25
xyouts, xmax, -20, ' Bz', color=1, charsize=1.25

restore, 'thb_esa_peir_gsm_20070812.save'
x = julday(month, day, year, hour, minute, second)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  timlbl[i] = ah + ':' + an
endfor
plot, [xmin, xmax], [0, 0], xrange=[xmin, xmax], yrange=[-300, 300], linestyle=1, $
  /xstyle, /ystyle, xticks=xticks, xtickname=blanklbl, xminor=6, yminor=5, $
  ytitle='THB (km/s)', position=[0.55, 0.7425, 0.925, 0.945], /noerase
oplot, x, vx_gsm, color=3
oplot, x, vy_gsm, color=2
oplot, x, vz_gsm, color=1
XX = julday(month, day, year, 14, 35, 30)
YY = julday(month, day, year, 14, 40, 30)
oplot, [XX, XX], [-300, 300], linestyle=5
oplot, [YY, YY], [-300, 300], linestyle=5
xyouts, xmax, 100, ' Vx', color=3, charsize=1.25
xyouts, xmax, 0, ' Vy' ,color=2, charsize=1.25
xyouts, xmax, -100, ' Vz', color=1, charsize=1.25

end