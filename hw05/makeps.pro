PRO MAKEPS,name,xdim,ydim,landscape=land,inches=inches
;start PostScript output file
;dimensions in centimeters, unless keyword inches set
;all parameters are optional, defaults used if not given are:
;  name=IDLPLOT
;  xdim=.75*20.
;  ydim=.75*27.

; save some system plot/device variables which we will change
common save,dname,pfont,pthick,xthick,ythick
dname=!d.name
pfont=!p.font
pthick=!p.thick
xthick=!x.thick
ythick=!y.thick

set_plot,'PS'
;change some system variables which make the PS plots look better
!p.font=0
!p.thick=2
!x.thick=2
!y.thick=2

; get number of arguments
narg=N_PARAMS()

IF narg GE 1 THEN filename=name+'.ps' ELSE filename='idlplot.ps'
DEVICE,FILENAME=filename

IF keyword_set(land) THEN BEGIN
  DEVICE,/LANDSCAPE
  maxx=27.
  maxy=20.
ENDIF ELSE BEGIN
  DEVICE,/PORTRAIT
  maxx=20.
  maxy=27.
ENDELSE

IF narg GE 3 THEN BEGIN
  xlen=xdim
  ylen=ydim
  IF keyword_set(inches) THEN BEGIN
    xlen=xlen*2.54
    ylen=ylen*2.54
  ENDIF
ENDIF ELSE BEGIN
  xlen=0.75*maxx
  ylen=0.75*maxy
ENDELSE

;make sure given lengths are not too big
xlen=MIN([maxx,xlen])
ylen=MIN([maxy,ylen])

; center plot on page
IF keyword_set(land) THEN BEGIN
; offset's in landscape mode are not as expected
  xoff=1.0+(maxy-ylen)/2.
  yoff=0.5+maxx - (maxx-xlen)/2.
ENDIF ELSE BEGIN
  xoff=1.0+(maxx-xlen)/2.
  yoff=0.5+(maxy-ylen)/2.
ENDELSE

device,xsize=xlen,ysize=ylen,xoffset=xoff,yoffset=yoff
RETURN
END
