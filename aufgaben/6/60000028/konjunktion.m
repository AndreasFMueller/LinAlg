#
# konjunktion.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

f = 100000
w = 3600
h = 2400
f * 0.000003

jupiter_heliocentric = [
	306 + 3/60 + 18.3/3600,
	-(0 + 33/60 + 29.3/3600),
	5.0991952
];

saturn_heliocentric = [
	303 + 19/60 + 51.8/3600,
	-(0 + 24/60 + 37.1/3600),
	9.9886216
];

earth_heliocentric = [
	(270 + 20/60 + 13.27/3600) - 180,
	0 + 0/60 + 0.79/3600,
	0.9836927
];

function retval = heliocentric_xyz(v) 
	z = v(3) * sind(v(2));
	r = v(3) * cosd(v(2));
	x = r * cosd(v(1));
	y = r * sind(v(1));
	retval = [ x; y; z ];
end

jupiter_xyz = heliocentric_xyz(jupiter_heliocentric)
saturn_xyz = heliocentric_xyz(saturn_heliocentric)
earth_xyz = heliocentric_xyz(earth_heliocentric)

v1 = jupiter_xyz - earth_xyz;
v2 = saturn_xyz - earth_xyz;
separation = acosd(dot(v1,v2) / (norm(v1) * norm(v2)))

K = [
        f,   0,  w/2;
        0,   f,  h/2;
        0,   0,   1
]

c = earth_xyz;

# Bestimmung der Drehmatrix
v = 0.5 * (v1 + v2);
e3 = [ 0; 0; 1 ];

D = eye(3);
D(:,3) = v / norm(v);
u = -cross(v, e3);
D(:,1) = u / norm(u);
D(:,2) = -cross(D(:,1), D(:,3));
alpha = 30;
D;
D = D * [
	cosd(alpha), -sind(alpha), 0;
	sind(alpha),  cosd(alpha), 0;
	     0     ,       0     , 1
];
det(D)
D*D'

D = D'

[ eye(3), -c ]
P = K * D * [ eye(3), -c ]

jupiter_p = [ jupiter_xyz; 1 ]
jupiter_b = P * jupiter_p
jupiter_b = jupiter_b / jupiter_b(3,1)

saturn_p = [ saturn_xyz; 1 ]
saturn_b = P * saturn_p
saturn_b = saturn_b / saturn_b(3,1)

d = jupiter_b - saturn_b
norm(d)
