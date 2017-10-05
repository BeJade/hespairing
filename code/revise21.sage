load("util.sage")

k = 21
x = 2^10
D = 3

num = 1
while num > 0 :

	# k = 3 mod 18 #
	rx = cyclotomic_polynomial(2*k)
	r = rx(x)
	t = x^(k/3 + 1) + 1
	q = (1/3) * (x^2 - x + 1) * (x^(2*k/3) - x^(k/3) + 1) + x^(k/3 + 1)

	if (q.denominator() == 1):
		if (ZZ(q).is_prime() and ZZ(r).is_prime()):

			deg = k/3
			tk = tn(t,deg,q)
			f2 = (4*q^deg - tk^2)/3
			if f2.is_square():
				f = sqrt(f2)
				t1 = (q^deg+1-(+3*f-tk)/2)
				t2 = (q^deg+1-(-3*f-tk)/2)
			else:
				t1 = 1
				t2 = 1

			if (q+1-t)%3 != 0 or (t1%3 != 0 and t2%3 != 0):
				x += 1
				continue

			fq = GF(q)

			y = sqrt((4*q - t^2) / D)
			a = 0
			b = find_b(q,t/2,y/2)

			fq_a = fq(a)
			fq_b = fq(b)

			E = EllipticCurve(fq,[fq_a,fq_b])
			nE = E.cardinality()

			if nE != (q+1-t) :
				x += 1
				continue

			print "x =",x
			print "t =",t
			print "q =",q
			print "r =",r
			print "a,b =",a,b

			num -= 1
	x += 1
