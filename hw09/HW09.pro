window, ysize=960
!p.background = 255
!p.color = 0
device, decomposed = 0
restore, 'tha_20101124_01.save'
restore, 'tha_emis_20101124_01.save'
; 轉換時間
diff = julday(1, 1, 2000, 0, 0, 0)
jsb = jsb / 86400. + diff
time = time / 86400. + diff
ts = ts / 86400. + diff
te = te / 86400. + diff
; 開始、結束時間
xmax = julday(11, 24, 2010, 0, 35, 17)
xmin = julday(11, 24, 2010, 0, 35, 12)
; 時間間隔
xticks = 5
delta = findgen(xticks + 1) * (xmax - xmin) / xticks + xmin
timlbl = strarr(xticks + 1)
for i = 0, xticks do begin
  caldat, delta[i], y, m, d, h, n, s
  ah = string(h, '(i2.2)')
  an = string(n, '(i2.2)')
  as = string(s, '(i2.2)')
  timlbl[i] = ah + ':' + an + ':' + as
endfor
blanklbl = replicate(' ', xticks + 1)
; 內插
wpy = float(wpowery)
nx = n_elements(time)
xp = findgen(nx) * (xmax - xmin) / (nx - 1) + xmin
xs = interpol(findgen(nx), time, xp)
ymin = 0
ymax = 1200
ny = n_elements(freq)
yp = findgen(ny) * (ymax - ymin) / (ny - 1) + ymin
ys = interpol(findgen(ny), freq, yp)
; 畫第一張圖
plot, jsb, by, xstyle=1, ystyle=1, xrange=[xmin, xmax], yrange=[-0.4, 0.4], position=[0.15, 0.575, 0.85, 0.925], xticklen=-0.025, yticklen=-0.01, xticks=xticks, xtickname=blanklbl, xminor=6, ytitle='B!iy!n (nT)'
xyouts, xmin, 0.45, '24 November 2010', charsize=2, charthick=2
xyouts, xmax, 0.45, 'THA', alignment=1, charsize=2, charthick=2
image = interpolate(wpy, xs, ys, missing=!values.f_nan, /grid)
; 轉換頻譜功率值
log_wpy = alog10(image)
scaled = bytscl(log_wpy, min=-8, max=-3, top=254)
loadct, 13
; 改變顏色表單，第255個設成白色
tvlct, 255, 255, 255, 255
downpos = [0.15, 0.225, 0.85, 0.525]
; 繪製影像
tvimage, scaled, position=downpos
; colorbar繪製
colorbar, maxrange=-3, minrange=-8, /vertical, divisions=5, /right, position=[0.875, 0.225, 0.9, 0.525], title='Power log!i10!n (nT!u2!n/Hz)'
; 剩下的部分，五條線、標題、虛線
plot, [0, 0], [0, 0], /noerase, position=downpos, /xstyle, /ystyle, xrange=[xmin, xmax], yrange=[0, 1200], xticklen=-0.025, yticklen=-0.01, xticks=xticks, xtickname=timlbl, xminor=6, yminor=3, xtitle='UT (hr:min:s)', ytitle='Frequency (Hz)'
for i = 0, 4 do plot, [ts[i], te[i]], [fs[i], fe[i]], /noerase, position=downpos, xstyle=5, ystyle=5, xrange=[xmin, xmax], yrange=[0, 1200], color=255
plot, !x.crange, [979, 979], /noerase, position=downpos, xstyle=5, ystyle=5, xrange=[xmin, xmax], yrange=[0, 1200], color=255, linestyle=2
xyouts, xmin, -200, 'L = 8.23!cMLT = 12.31 hr!cMLat = 0.66 deg', charsize=2, charthick=2
end