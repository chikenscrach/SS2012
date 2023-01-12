!p.background = 255
!p.color = 0
device, decomposed = 0
window, xsize=900, ysize=900
; 先畫出一個空的圖，但有設定好x, y 的範圍
plot, [0, 0], [0, 0], xstyle=4, ystyle=4, /isotropic, xrange=[10, 18], yrange=[-4, 4]
; 磁層頂公式
theta = [0: 360] * !dtor
r = 11.6 * (2. / (1 + cos(theta)))^0.5
x = r * cos(theta)
y = r * sin(theta)
; 選擇要的部分
x3 = [x[340: 360], x[0: 20]] + 4
y3 = [y[340: 360], y[0: 20]]
; 補上一個點，然後挖去其他部分
x[350] = 11.25
x1 = [x[340: 350], x[5: 20]]
y1 = [y[340: 350], y[5: 20]]
; 用spline平滑曲線
y2 = findgen(1000)/999*8-4
x2 =spline(y1, x1, y2)
; 上色
x4 = [x2[0: 999], 18, 18, 11.6]
y4 = [y2[0: 999], 4, -4, -4]
polyfill, x4, y4, color=fsc_color('light yellow')
x5 = [x2[0: 999], 10, 10, 11.6]
y5 = [y2[0: 999], 4, -4, -4]
polyfill, x5, y5, color=fsc_color('light cyan')
; 畫上間隔線
x6 = [reverse(x2[0: 999]) - 0.125, x2[0: 999]]
y6 = [reverse(y2[0: 999]), y2[0: 999]]
polyfill, x6, y6, /line_fill, spacing=0.75
; 畫出磁層頂
plot, x2, y2, xrange=[10, 18], yrange=[-4, 4], title='1433:10 UT', xtitle='X!iGSM!n (Re)', ytitle='Y!iGSM!n (Re)', /xstyle, /ystyle, /isotropic, xticklen=-0.015, yticklen=-0.015, /noerase, thick=2
; 標點，弄成array比較好for迴圈
atoe = ['tha', 'thb', 'thc', 'thd', 'the']
allcolor = ['magenta', 'red', 'green', 'cyan', 'blue']
for i = 0, 4 do begin
  restore, atoe[i] + '_state_pos_gsm_20070812.save'
  oplot, [x_gsm[873]], [y_gsm[873]], psym=4, color=fsc_color(allcolor[i]), symsize=2
endfor
; 畫出船艏震波
plot, x3, y3, /noerase, xstyle=4, ystyle=4, /isotropic, xrange=[10, 18], yrange=[-4, 4], color=fsc_color('blue'), thick=2
; 痛苦的地方，所有文字及箭頭繪製
xyouts, 11.4, 3.5, 'Magnetopause', charsize=2, charthick=2
xyouts, 13, -3.9, 'Bow Shock', charsize=2, charthick=2, color=fsc_color('blue')
xyouts, 10.3, 3.2, 'a', charsize=5, charthick=2
xyouts, 16.5, 0, 'Solar!cWind!cFlow', charsize=2, charthick=2, color=fsc_color('dark green')
xyouts, 12, 0, 'Fast!cMagnetosheath!cFlow', charsize=2, charthick=2, color=fsc_color('dark green')
xyouts, 16.65, 2.1, 'IMF', charsize=2, charthick=2, color=fsc_color('red')
arrow, 18, 3, 15.33, 3, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 15.33, 3, 14.83, 3, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 18, 1, 15.59, 1, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 15.59, 1, 15.09, 1, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 18, -1, 15.59, -1, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 15.59, -1, 15.09, -1, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 18, -3, 15.33, -3, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 15.33, -3, 14.83, -3, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 14, -1, 11.75, -2, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 14, -0.7, 11.3, -1.89, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 13.5, -0.5, 11.75, -1.3, /data, color=fsc_color('dark green'), thick=2, /solid
arrow, 10.9, -1.2, 10.5, -1, /data, thick=10, /solid, hthick=3
arrow, 10.9, -2, 10.5, -2.3, /data, thick=10, /solid, hthick=3
arrow, 15.48, 2, 18, 2, /data, color=fsc_color('red'), thick=2, /solid
arrow, 15.48, -2, 18, -2, /data, color=fsc_color('red'), thick=2, /solid
x7 = findgen(1000)/999 * 6 * !pi
y7 = sin(x7)
plot, x7, y7, xstyle=4, ystyle=4, color=fsc_color('red'), thick=2, /noerase, position=[0.645, 0.72, 0.695, 0.74]
plot, x7, y7, xstyle=4, ystyle=4, color=fsc_color('red'), thick=2, /noerase, position=[0.645, 0.27, 0.695, 0.29]
end