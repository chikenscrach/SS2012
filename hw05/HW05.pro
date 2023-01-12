; 測試用 window, xsize=960, ysize=360
makeps, 'pause', 792, 612
device, decomposed = 0
!p.multi=[0, 2, 1]
!p.background = 255
!p.color = 0

; 公式部分
theta = [0: 360] * !dtor
r = 11 * (2 / (1 + cos(theta)))^0.3
plot, r, theta, xrange=[-40, 25], yrange=[0, 40], xtitle='X (Re)', ytitle='R (Re)', $
  ; 要在.ps顯示alpha要用!9a
  title = 'Fixed !9a!3 (=0.3) and variable r!I0!N', $
  /polar, /xstyle, /ystyle, /isotropic
  
L = 4  
for i = 7, 10 do begin
  r = i * (2 / (1 + cos(theta)))^0.3
  oplot, r, theta, linestyle = L, /polar
  L = L - 1
endfor

P = 23
L = 12
front = 'r!I0!N = '
back = '.000 Re'
for i = 1, 5 do begin
  oplot, [-11, -1], [P, P], linestyle = i - 1
  a = string(L - i, format='(i2)')
  ; xyouts要自己找位置
  xyouts, 0, P, front + a + back
  P = P + 3
endfor

r = 9 * (2 / (1 + cos(theta)))^0.2
plot, r, theta, xrange=[-40, 25], yrange=[0, 40], xtitle='X (Re)', ytitle='R (Re)', $
  title = 'Fixed r!I0!N (= 9 Re) and variable !9a!3', $
  /polar, /xstyle, /ystyle, /isotropic

for i = 3, 6 do begin
  r = 9 * (2 / (1 + cos(theta)))^(0.1 * i)
  oplot, r, theta, linestyle = i - 1, /polar
endfor

P = 23
L = 1
front = '!9a!3 = 0.'
back = '00'
for i = 1, 5 do begin
  oplot, [-4, 6], [P, P], linestyle = i - 1
  a = string(L + i, format='(i1)')
  xyouts, 7, P, front + a + back
  P = P + 3
endfor
endps
end