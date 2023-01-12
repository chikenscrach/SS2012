window, xsize = 960, ysize = 960
!p.background = 255
!p.color = 0
device, decomposed = 0
loadct, 5
; 把資料都先設定好，待會for迴圈處理起來比較輕鬆
data = ['frame97010623181731lbhl.save', 'frame97010700520068lbhl.save', 'frame97010701040084lbhl.save', 'frame97010701190104lbhl.save']
x = [0.1, 0.55, 0.1, 0.55]
y = [0.55, 0.55, 0.125, 0.125]
abcd = ['a', 'b', 'c', 'd']

; 開始迴圈
for i = 0, 3 do begin
  restore, data[i]
  ; 切掉多餘的部分
  maxradius = 30
  valuemean = valuemean[*, 0: maxradius]
  valuelon = valuelon[*, 0: maxradius]
  valuelat = valuelat[*, 0: maxradius]
  ; colorbar間隔製作(跟時間區間很像)
  ndiv = 10
  cmin = 0
  cmax = 20
  clev = findgen(ndiv + 1)
  clev = clev * (cmax - cmin) / ndiv + cmin
  cind = bytscl(findgen(ndiv + 1))
  ; 再來就是處理標題、各種標記之類的
  year = string(year, format='(i4)') + '_'
  month = '0' + string(month, format='(i1)')
  day = '_0' + string(day, format='(i1)')
  if hour ge 10 then hour = string(hour, format='(i3)') + ':' else hour = ' 0' + string(hour, format='(i1)') + ':'
  if minute ge 10 then minute = string(minute, format='(i2)') + ' UT' else minute = ' 0' + string(minute, format='(i1)') + ' UT'
  title = year + month + day + hour + minute + '!c'
  ; 等值線繪製
  polar_contour, valuemean, (valuelon - 90) * !dtor, 90 - valuelat, $
    levels=clev, c_color=cind, xstyle=5, ystyle=5, /isotropic, /fill, $
    title=title, position=[x[i], y[i], x[i] + 0.35, y[i] + 0.35], noerase=i
  plot, intarr(361) + 1, [0: 360] * !dtor, /polar, position=[x[i], y[i], x[i] + 0.35, y[i] + 0.35], xstyle=5, ystyle=5, /noerase
  oplot, [0, 0], !y.crange, linestyle=5, color=255
  oplot, !x.crange, [0, 0], linestyle=5, color=255
  xyouts, -1, 1, abcd[i], charsize=2, charthick=2
  xyouts, 1, 0.3, '60!uo', charsize=1.5
  for j = 0, 11 do xyouts, sin(j * !pi / 6)* 1.1 - 0.4, sin(j * !pi/6 - !pi / 2) * 1.09 - 0.05, string(j * 2), charsize=1.5
endfor
  
; colorbar繪製
length = 4. / ndiv
height = 0.1
xpos = -3.5
ypos = -1.5
xyouts, -3.5, -1.38, 'Photons/cm!u2!n-s', charsize=2, charthick=1.5
xyouts, -3.5, 3.75, 'Polar UVI', charsize=3, charthick=3
boxx = [0, length, length, 0, 0]
boxy = [0, 0, height, height, 0]
for i = 0, ndiv do begin
  xx = boxx + xpos + i * length
  yy = boxy + ypos
  polyfill, xx, yy, color=cind[i]
  plots, xx, yy
  xyouts, xx[0] - 0.1, yy[0] - 0.1, string(clev[i], format='(f4.1)')
endfor

end