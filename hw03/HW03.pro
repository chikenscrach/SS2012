file = filepath('marsglobe.jpg', subdirectory=['examples', 'data'])
read_jpeg, file, img1

window, 0, xsize = 800, ysize = 400

tv, img1, 0, true = 1

red = reform(img1[0, *, *])
green = reform(img1[1, *, *])
blue = reform(img1[2, *, *])

window, 1, xsize = 1200, ysize = 400
tv, red, 0
tv, green, 1
tv, blue, 2

red2 = red
green2 = green
blue2 = blue
red2[where(red2 LT 120, /NULL)] = 0
green2[where(green2 LT 120, /NULL)] = 0
blue2[where(blue2 LT 120, /NULL)] = 0

window, 2, xsize = 1200, ysize = 800
tv, red, 0
tv, green, 1
tv, blue, 2
tv, red2, 3
tv, green2, 4
tv, blue2, 5

img2 = bytarr(3, 400, 400)
img2[0, *, *] = red
img2[1, *, *] = green
img2[2, *, *] = blue
wset, 0 & tv, img2, 1, true = 1
end