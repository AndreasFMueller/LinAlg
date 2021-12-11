#
# konjunktion.m
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

f = 50000
w = 3600
h = 2400
f * 0.000003

venus_heliocentric = [
	 67 + 13/60 + 38.6/3600,
	-(0 + 33/60 + 52.2/3600),
	0.7212006
];

uranus_heliocentric = [
	  4 +  2/60 + 45.3/3600,
	-(0 + 43/60 + 33/3600),
	20.0744704
];

earth_heliocentric = [
	(320 + 50/60 + 59.62/3600) - 180,
	-(0 + 0/60 + 0.29/3600),
	0.9866602
];

function retval = heliocentric_xyz(v) 
	z = v(3) * sind(v(2));
	r = v(3) * cosd(v(2));
	x = r * cosd(v(1));
	y = r * sind(v(1));
	retval = [ x; y; z ];
end

venus_xyz = heliocentric_xyz(venus_heliocentric)
uranus_xyz = heliocentric_xyz(uranus_heliocentric)
earth_xyz = heliocentric_xyz(earth_heliocentric)

v1 = venus_xyz - earth_xyz;
v2 = uranus_xyz - earth_xyz;
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
alpha = 0;
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

venus_p = [ venus_xyz; 1 ]
venus_b = P * venus_p
venus_b = venus_b / venus_b(3,1)

uranus_p = [ uranus_xyz; 1 ]
uranus_b = P * uranus_p
uranus_b = uranus_b / uranus_b(3,1)

d = venus_b - uranus_b
norm(d)
