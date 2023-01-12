openr, 1, 'wind_mfi.dat'
num = 3000 ; wind_mfi.dat 有2883筆資料
; 總之先定義各個變數
year = intarr(num)
month = intarr(num)
day = intarr(num)
hour = intarr(num)
minute = intarr(num)
second = intarr(num)
bx = fltarr(num)
by = fltarr(num)
bz = fltarr(num)
dum = ''
yy = 1
mm = 1
dd = 1
hh = 1
mmi = 1
ss = 1
ax = 1.
ay = 1.
az = 1.
nn = 0
; 前三筆資料用不到，用3次readf略過
readf, 1, dum
readf, 1, dum
readf, 1, dum
; 用while來讀資料，讀到底時結束
while ~eof(1) do begin
  readf, 1, dd, mm, yy, hh, mmi, ss, ax, ay, az, $
    format = '(i2, 1x, i2, 1x, i4, 1x, i2, 1x, i2, x, i2, 4x, 3f23.5)'
  ; 將需要的變數存起來
  year[nn] = yy
  month[nn] = mm
  day[nn] = dd
  hour[nn] = hh
  minute[nn] = mmi
  second[nn] = ss
  bx[nn] = ax
  by[nn] = ay
  bz[nn] = az
  ; 填充NaN
  if ax eq -1.E+31 then bx[nn] = !values.f_nan
  if ay eq -1.E+31 then by[nn] = !values.f_nan
  if az eq -1.E+31 then bz[nn] = !values.f_nan
  nn = nn + 1
endwhile
close, 1

; 將剛才讀取的資料存成save
year = year[0: nn - 1]
month = month[0: nn - 1]
day = day[0: nn - 1]
hour = hour[0: nn - 1]
minute = minute[0: nn - 1]
second = second[0: nn - 1]
bx = bx[0: nn - 1]
by = by[0: nn - 1]
bz = bz[0: nn - 1]
save, year, month, day, hour, minute, second, bx, by, bz, filename = 'wind_mfi.save'

; 方式與以上相同
openr, 2, 'wind_swe.dat'
num = 3000 ; wind_swe.dat 有2009筆資料
year = intarr(num)
month = intarr(num)
day = intarr(num)
hour = intarr(num)
minute = intarr(num)
second = intarr(num)
vx = fltarr(num)
vy = fltarr(num)
vz = fltarr(num)
np = fltarr(num)
vth = fltarr(num)
yy = 1
mm = 1
dd = 1
hh = 1
mmi = 1
ss = 1
ax = 1.
ay = 1.
az = 1.
pp = 1.
vv = 1.
nn = 0
readf, 2, dum
readf, 2, dum
readf, 2, dum
while ~eof(2) do begin
  readf, 2, dd, mm, yy, hh, mmi, ss, vv, pp, ax, ay, az, $
    format = '(i2, 1x, i2, 1x, i4, 1x, i2, 1x, i2, x, i2, 4x, 2f14.4, 14x, 3f14.5)'
  year[nn] = yy
  month[nn] = mm
  day[nn] = dd
  hour[nn] = hh
  minute[nn] = mmi
  second[nn] = ss
  vx[nn] = ax
  vy[nn] = ay
  vz[nn] = az
  np[nn] = pp
  vth[nn] = vv
  if ax eq -1.E+31 then vx[nn] = !values.f_nan
  if ay eq -1.E+31 then vy[nn] = !values.f_nan
  if az eq -1.E+31 then vz[nn] = !values.f_nan
  if pp eq -1.E+31 then np[nn] = !values.f_nan
  if vv eq -1.E+31 then vth[nn] = !values.f_nan
  nn = nn + 1
endwhile
close, 2

year = year[0: nn - 1]
month = month[0: nn - 1]
day = day[0: nn - 1]
hour = hour[0: nn - 1]
minute = minute[0: nn - 1]
second = second[0: nn - 1]
vx = vx[0: nn - 1]
vy = vy[0: nn - 1]
vz = vz[0: nn - 1]
np = np[0: nn - 1]
vth = vth[0: nn - 1]
save, year, month, day, hour, minute, second, vx, vy, vz, np, vth, filename = 'wind_swe.save'

end