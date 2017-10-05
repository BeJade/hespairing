load("util.sage")

def w2h(fp,a,b):

	E = EllipticCurve(fp,[a,b])
	nE = E.cardinality()

	h = nE
	while (h%3 == 0):
		h /= 3

	p3 = E([0,1,0])
	while (p3.is_zero()):
		p3 = E.random_element()
		p3 = ZZ(h)*p3
		while not(3*p3).is_zero():
			p3 = 3*p3

	u3 = p3[0]
	v3 = p3[1]

	##############################

	# Weierstrass -> Triangular
	# W: v^2 = u^3 + e6
	# T: y^2 + dxy + ay = x^3

	c3 = 2*v3
	c4 = 3*u3^2

	lampda = c4/c3

	a1 = 2*lampda
	a3 = c3

	td = fp(a1)
	ta = fp(a3)

	##############################

	# Triangular -> Twisted Hessian
	# H: a'X^3 + Y^3 + Z^3 = d'XYZ

	ha = (td^3 - 27*ta)
	hd = 3*td

	omega = findCubeRoot(q)

	print "u3 =",u3
	print "v3 =",v3
	print "d  =",td
	print "a  =",ta
	print "a' =",ha
	print "d' =",hd
	print "w  =",omega

##################################################

r = 277784988873145112452421916846435035271854071
q = 60388831224640627688578323697279079263669799534119323634669
a = 0
b = 144

fp = GF(q)
w2h(fp,fp(a),fp(b))
