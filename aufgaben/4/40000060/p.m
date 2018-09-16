a: [ 10, 5, -7 ];
b: [ 1, 2, -7 ];
p: [ 2, 6, 3 ] + t * [ 3, -1, 2 ];
da: a - p;
db: b - p;
da.da;
ratsimp(da.da);
db.db;
ratsimp(db.db);
ratsimp(da.da -db.db);

