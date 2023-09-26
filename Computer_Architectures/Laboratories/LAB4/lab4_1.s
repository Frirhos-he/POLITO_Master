.data

V1: .double 1,1,1,1,1,1,1,1,1,1
V2: .double 1,1,1,1,1,1,1,1,1,1
V3: .double 1,1,1,1,1,1,1,1,1,1
V5: .double 1,1,1,1,1,1,1,1,1,1
.text
main: daddui r1,r0,0 
 	daddui r2,r0,10 
loop: l.d f1,v1(r1) 
 l.d f2,v2(r1) 
 mul.d f5,f1,f2 
 l.d f3,v3(r1) 
 l.d f4,v4(r1) 
 div.d f6, f3, f4 
 sub.d f5,f5,f6 
 s.d f5,v5(r1) 
 daddui r1,r1,8 
 daddi r2,r2,-1 
 bnez r2,loop
 halt