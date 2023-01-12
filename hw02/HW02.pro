; 第一題
a1 = findgen(5000, start=1)
print, TOTAL(1/a1) 
;與HW01結果相同

; 第二題
a2 = long(findgen(50000, start=1))
print, TOTAL(a2) 
;與HW01結果相同

; 第三題
F = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

a3 = 0
for i = 0, 9 do begin
  if F[i] lt 30 then a3 = a3 + F[i]
endfor
print, a3

; 第四題
a4 = 0
i = 0
while F[i] lt 30 do begin
  a4 = a4 + F[i]
  i = i + 1
endwhile
print, a4

end