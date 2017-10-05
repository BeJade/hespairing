def tn(t,n,q):
	if n == 0: return 2
	elif n == 1: return t
	else: return t*tn(t,n-1,q) - q*tn(t,n-2,q)

def tHesADD(P,Q,a):
	X1,Y1,Z1 = P[0],P[1],P[2]
	X2,Y2,Z2 = Q[0],Q[1],Q[2]
	A = X1 * Z2
	B = Z1 * Z2
	C = Y1 * X2
	D = Y1 * Y2
	E = Z1 * Y2
	F = X1 * X2 * a
	X3 = A*B - C*D
	Y3 = D*E - F*A
	Z3 = F*C - B*E
	return [X3,Y3,Z3]

def tHesDBL(P,a):
	X1,Y1,Z1 = P[0],P[1],P[2]
	D = X1^3
	E = Y1^3
	F = Z1^3
	G = a*D
	X3 = X1 * (E - F)
	Y3 = Z1 * (G - E)
	Z3 = Y1 * (F - G)
	return [X3,Y3,Z3]

def expmod_loop(b,e,m):
        p = b
        t = 1
        while e > 0 :
                if e&1 : t = (t*p) % m
                e = e >> 1
                p = (p*p) % m
        return t

def find_b(p,U,V):
# suppose d = 3 for y^2 = x^3 + b
        exp = ZZ((p-1)/6)

	if ((2*V)%3 == 0 and (2*U)%3 == 2):
		return 16
	if ((2*V)%3 == 0 and (2*U)%3 == 1):
		b = 1
		found = false
		while not found:
			chk = expmod_loop(b,exp,p)
			if chk == GF(p)(-1):
				found = true
				return 16*b
			else:
				b += 1
	if ((2*V)%3 != 0 and (2*U)%3 == 2):
		if ((2*V)%3 != 1):
			V = -V
		if ((2*U)%3 == 2):
			b = 1
			found = false
			while not found:
				chk = expmod_loop(b,exp,p)
				rem = ((2*U)/(3*V-U))%p
				if chk == GF(p)(rem):
					found = true
					return 16*b
				else:
					b += 1
	else:
		b = 1
		found = false
		while not found:
			chk = expmod_loop(b,exp,p)
			rem = ((2*U)/(3*V+U))%p
			if chk == GF(p)(rem):
				found = true
				return 16*b
			else:
				b += 1

def findCubeRoot(p):

	exp = ZZ((p-1)/3)
	a = 2
	found = false
	while not found:
		w = expmod_loop(a,exp,p)
		if (w^3) == GF(p)(1) and not(w == 1):
			found = true
		else:
			a += 1
	return w

