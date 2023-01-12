window, xsize = 900, ysize = 900
!p.background = 255
!p.color = 0
device, decomposed = 0

; 第一題
restore, 'wind_swe.save'
jd_swe = julday(month, day, year, hour, minute, second)
restore, 'wind_mfi.save'
jd_mfi = julday(month, day, year, hour, minute, second)
np = float(interpol(np, jd_swe, jd_mfi))
vx = float(interpol(vx, jd_swe, jd_mfi))
save, year, month, day, hour, minute, second, np, vx, bx, by, bz, filename='wind_merge.save'

; 第二題
restore, 'wind_all.save'
; 公式部分
dp = 1.6726e-06 * np * vx^2
r0 = fltarr(2880)
for i = 0, 2879 do begin
  if bz[i] GE 0 then begin
    r0[i] = (11.4 + 0.013 * bz[i]) * dp[i]^(-1. / 6.6)
  endif else begin
    r0[i] = (11.4 + 0.14 * bz[i]) * dp[i]^(-1. / 6.6)
  endelse
endfor
alpha = (0.58 - 0.01 * bz) * (1 + 0.01 * dp)
theta = [0: 360] * !dtor
ii = 0
; 開始作圖
while ii le 2879 do begin
  temp = ii
  r = r0[ii] * (2. / (1 + cos(theta)))^alpha[ii]
  ; 避免有些點畫不出來，所以我寫了這段while
  while finite(r[1]) eq 0 do begin
    ii = ii + 1
    r = r0[ii] * (2. / (1 + cos(theta)))^alpha[ii]
  endwhile
  ; 處理每一張圖
  tm = string(month[ii], format='(i2.2)') + '/'
  td = string(day[ii], format='(i2.2)') + '/'
  ty = string(year[ii], format='(i4)') + ' '
  th = string(hour[ii], format='(i2.2)') + ':'
  tmi = string(minute[ii], format='(i2.2)')
  tbz = '!cBz =' + string(bz[ii], format='(f6.1)') + ' nT,  '
  tdp = 'Dp =' + string(dp[ii], format='(f6.1)') + ' nPa'
  title = tm + td + ty + th + tmi + tbz + tdp
  plot, r, theta, xrange=[-60, 20], yrange=[-40, 40], title=title, thick=2, xtitle='X (Re)', ytitle='Y (Re)', /polar, /xstyle, /ystyle, /isotropic
  oplot, [0, 0], [-40, 40], linestyle=1
  oplot, [-60, 20], [0, 0], linestyle=1
  ii = temp + 80
  ; 製作gif
  write_gif, 'wind_all.gif', tvrd(), /multiple
endwhile

end