a1 = 0
for i = 1, 5000 do a1 = a1 + 1./i
print, a1

a2 = 0
for i = 1, 50000 do a2 = a2 + i
print, a2

a3 = 0LL
a3 = 70LL + 120LL * 2LL^8 + 190LL * 2LL^16
print, a3

a4 = 1
b1 = 1
b2 = 1
print, b1
print, b2
for i = 3, 10 do begin
  b1 = b2
  b2 = a4
  a4 = b2 + b1
  print, a4
endfor

end