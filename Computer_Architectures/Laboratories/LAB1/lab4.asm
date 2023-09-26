.data
comments Clock cycles
V1: .double “10 values”
V2: .double “10 values”
V3: .double “10 values”
V4: .double “10 values”
.text
main: daddui r1,r0,0 
 daddui r2,r0,10 
cycle: l.d f1, v1(r2)
 l.d f2, v2(r2)
 l.d f3, v3(r2) 
 mul.d f5,f3,f4 
 div.d f6, f1, f2 
 add.d f7, f6, f5 
 s.d f7,v4(r1) 
 daddui r1,r1,8 
 daddi r2,r2,-1
 bnez r2, cycle
 halt