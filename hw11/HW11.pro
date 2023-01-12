!p.background = 255
!p.color = 0
device, decomposed = 0
; 先畫出空的圖，設定x, y，然後底色是淡黃色
plot, [0, 0], [0, 0], xstyle=4, ystyle=4, xrange=[-18, 22], yrange=[-20, 20], /isotropic
polyfill, [20, 20, -20, -20], [-20, 20, 20, -20], color=fsc_color('light yellow')
GEOPACK_RECALC, 2007, 81
; Dp = 2, Bz = 2
parm = [2, 0, 0, 2, 0, 0, 0, 0, 0, 0]
; 磁層頂公式
theta = [0: 360] * !dtor
r0 = (11.4 + 0.013 * 2) * 2^(-1. / 6)
alpha = (0.58 - 0.01 * 2) * (1 + 0.01 * 2)
r = r0 * (2. / (1 + cos(theta)))^alpha
x = r * cos(theta)
y = r * sin(theta)
x1 = [x[236: 360], x[0: 123]]
y1 = [y[236: 360], y[0: 123]]
; 上色並畫出磁層頂，建議先上色再畫線，以免線被蓋掉
polyfill, [x1 - 2, -20, -20], [y1, 20, -20], color=fsc_color('light cyan')
plot, x1, y1, xrange=[-18, 22], yrange=[-20, 20], /xstyle, /ystyle, /isotropic, /noerase, xticklen=-0.015, yticklen=-0.015, xtitle='X (Re)', ytitle='Y (Re)', thick=2
; 畫磁力線
for i = 0, 12 do begin
  if (i - 6) ne 0 then begin
    GEOPACK_SPHCAR, 1, (i - 6) * 5, 0, x, y, z, /DEGREE, /TO_RECT
    GEOPACK_TRACE, x, y, z, 1, parm, xf, yf, zf, FLINE=fline, /TS04, tilt=0, /noboundary
    oplot, fline[*,0], fline[*,2], COLOR=FSC_COLOR('blue')
    GEOPACK_TRACE, x, y, z, 1, parm, xf, yf, zf, FLINE=fline, tilt=0, /noboundary
    oplot, fline[*,0], fline[*,2], COLOR=FSC_COLOR('dark green'), linestyle=1, thick=2
  endif
endfor
; 畫地球
x2 = cos(theta)
y2 = sin(theta)
plot, x2, y2, /noerase, xstyle=5, ystyle=5, xrange=[-18, 20], yrange=[-20, 20], /isotropic
plot, [-8, 22], [0, 0], xstyle=5, ystyle=5, xrange=[-18, 22], yrange=[-20, 20], /isotropic, /noerase, color=fsc_color('gray')
; 剩下的箭頭、文字、紅點、角度
for i = 0, 3 do begin
  arrow, 21.7, 10 * i - 15, 15, 10 * i - 15, /data, color=fsc_color('gray'), thick=10, hthick=5, /solid
endfor
xyouts, -2, 17, 'Magnetopause'
xyouts, 21, 17, 'Solar!cWind', color=fsc_color('gray'), alignment=1
xyouts, 0, 10.5, 'Deformed!cFields B!ig', color=fsc_color('blue'), alignment=1
xyouts, 10, -12.5, 'Dipole Field B!id', color=fsc_color('dark green'), alignment=0.75
xyouts, r0, 7.5, 'Subsolar!cStandoff Distance r!i0', color=fsc_color('red')
xyouts, r0, -6.5, 'B!ig0!n!c      = 0.38 + 0.20 r!i0!n!cB!id0!cB!ig0!n = 13,207 r!i0!n!e-2.29', color=fsc_color('red')
oplot, [10, 12], [-7.1, -7.1], color=fsc_color('red')
xyouts, 1.25, 10, '85!m%', color=fsc_color('blue')
xyouts, 4.5, 9, '80!m%', color=fsc_color('blue')
xyouts, 6.5, 6, '75!m%', color=fsc_color('blue')
xyouts, 6.5, 3.25, '70!m%', color=fsc_color('blue')
xyouts, 5.25, 2, '65!m%', color=fsc_color('blue')
xyouts, 1.25, 0.5, '60!m%', color=fsc_color('blue')
polyfill, [x2[90: 269], 0, 0], [y2[90: 269], -1, 1]
plot, [0, 0], [0, 0], xstyle=5, ystyle=5, /noerase, xrange=[-18 - r0, 22 - r0], yrange=[-20, 20], /isotropic
polyfill, x2 * 0.3, y2 * 0.3, color=fsc_color('red')
end