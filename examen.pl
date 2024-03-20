% Definición de productos
producto('LG-510', electrodomestico, blanco, barato, bueno).
producto('Samsung B125', electrodomestico, negro, caro, malo).
producto('LG Batimix', electrodomestico, rojo, barato, malo).
producto('Samsung L 200', electrodomestico, negro, caro, bueno).
producto('Bose', entretenimiento, blanco, caro, bueno).  % Corregido el color
producto('Parlantes LG', entretenimiento, rojo, barato, malo).
producto('XBox 360', consola, verde, barato, malo).
producto('XBox One', consola, verde, caro, bueno).
producto('PS 2', computadora, negro, barato, bueno).
producto('PS 3', computadora, negro, barato, bueno).
producto('Omen 560', computadora, plateado, barato, malo).
producto('Pavillon 15a', computadora, plateado, caro, bueno).
producto('Destrunaitor 500', escritorio, plateado, barato, bueno).

% Definición de clientes
cliente(maria, [blanco, barato], [rojo, malo], [electrodomestico, entretenimiento], [caro]).
cliente(juana, [negro, caro], [], [entretenimiento, computadora], [barato]).  % Corregida la categoría
cliente(jeremias, [], [bueno, caro], [electrodomestico], [barato]).

% Reglas para identificar productos según características
es_producto(Nombre) :- producto(Nombre, _, _, _, _).
es_cliente(Nombre) :- cliente(Nombre, _, _, _, _).
es_categoria(Categoria) :- producto(_, Categoria, _, _, _).

% Reglas para identificar productos de un color específico
productos_de_color_recursivo([], _, []).
productos_de_color_recursivo([Producto|RestoProductos], Color, [Producto|ProductosDeColor]) :-
    producto(Producto, _, Color, _, _),
    productos_de_color_recursivo(RestoProductos, Color, ProductosDeColor).
productos_de_color_recursivo([_|RestoProductos], Color, ProductosDeColor) :-
    productos_de_color_recursivo(RestoProductos, Color, ProductosDeColor).

% Reglas para identificar productos de una calidad específica
productos_de_calidad_recursivo([], _, []).
productos_de_calidad_recursivo([Producto|RestoProductos], Calidad, [Producto|ProductosDeCalidad]) :-
    producto(Producto, _, _, Calidad, _),
    productos_de_calidad_recursivo(RestoProductos, Calidad, ProductosDeCalidad).
productos_de_calidad_recursivo([_|RestoProductos], Calidad, ProductosDeCalidad) :-
    productos_de_calidad_recursivo(RestoProductos, Calidad, ProductosDeCalidad).

% Reglas para identificar productos de un precio específico
productos_de_precio_recursivo([], _, []).
productos_de_precio_recursivo([Producto|RestoProductos], Precio, [Producto|ProductosDePrecio]) :-
    producto(Producto, _, _, _, Precio),
    productos_de_precio_recursivo(RestoProductos, Precio, ProductosDePrecio).
productos_de_precio_recursivo([_|RestoProductos], Precio, ProductosDePrecio) :-
    productos_de_precio_recursivo(RestoProductos, Precio, ProductosDePrecio).

% Reglas para identificar productos según su categoría
productos_de_categoria_recursivo([], _, []).
productos_de_categoria_recursivo([Producto|RestoProductos], Categoria, [Producto|ProductosDeCategoria]) :-
    producto(Producto, Categoria, _, _, _),
    productos_de_categoria_recursivo(RestoProductos, Categoria, ProductosDeCategoria).
productos_de_categoria_recursivo([_|RestoProductos], Categoria, ProductosDeCategoria) :-
    productos_de_categoria_recursivo(RestoProductos, Categoria, ProductosDeCategoria).

% Reglas para recomendar productos a los clientes según sus gustos
recomendar_a_cliente(Nombre, Producto) :-
    es_cliente(Nombre),
    cliente(Nombre, Colores, Calidades, Categorias, Precios),
    productos_de_color_recursivo(Productos, Colores),
    productos_de_calidad_recursivo(Productos, Calidades),
    productos_de_categoria_recursivo(Productos, Categorias),
    productos_de_precio_recursivo(Productos, Precios).