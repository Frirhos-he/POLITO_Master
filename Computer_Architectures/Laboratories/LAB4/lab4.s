.data
V1: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
V2: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
V3: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
V4: .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
.text
main: daddui r1,r0,0 
 	daddui r2,r0,10 
cycle: l.d f1, v1(r2)
 	l.d f2, v2(r2)
	 l.d f3, v3(r2) 
 	div.d f6, f1, f2 
 	add.d f7, f1, f5 
	 s.d f7,v4(r1) 
	 daddui r1,r1,8 
 	daddi r2,r2,-1
 	bnez r2, cycle
	 halt