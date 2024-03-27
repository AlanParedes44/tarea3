entretenimiento.
electrodomestico.
batidora.
lavadora.
parlantes.

% categoria GLOBAL
producto.

esProducto("LG-510").
esProducto("Samsung B125").
esProducto("LG Batimix").
esProducto("Samsung L-200").
esProducto("Bose").
esProducto("LG").

esCategoria(entretenimiento).
esCategoria(electrodomestico).
esCategoria(batidora).
esCategoria(lavadora).
esCategoria(parlantes).
esCategoria(producto).

estaEnCategoria("LG-510", batidora).
estaEnCategoria("Samsung B125", batidora).
estaEnCategoria("LG Batimix", lavadora).
estaEnCategoria("Samsung L-200", lavadora).
estaEnCategoria("Bose", parlantes).
estaEnCategoria("LG", parlantes).

% categoria dentro de categoria
estaEnCategoria(batidora, electrodomestico).
estaEnCategoria(lavadora, electrodomestico).
estaEnCategoria(parlantes, entretenimiento).

% categoria en categoria global
estaEnCategoria(electrodomestico, producto).
estaEnCategoria(lavadora, producto).

esProductoDentrodeCategoria(Producto, Categoria):-esProducto(Producto),esCategoria(Categoria),estaEnCategoria(Producto, Categoria).
esProductoDentrodeCategoria(Producto, Categoria):-estaEnCategoria(Categoria2, Categoria),esProductoDentrodeCategoria(Producto, Categoria2).

% Preferencias de Maria
tieneCaracteristicas("LG-510", blanco, barato, bueno).
tieneCaracteristicas("Samsung B125", negro, caro, malo).
tieneCaracteristicas("LG Batimix", rojo, barato, malo).
tieneCaracteristicas("Samsung L-200", negro, caro, bueno).
tieneCaracteristicas("Bose", blanco, caro, bueno ).
tieneCaracteristicas("LG", rojo, barato, malo).

recomendarAMaria1(Producto):-esProducto(Producto),tieneCaracteristicaS(Producto, verde, _ , _ ),esProductoDentroDeCategoria(Producto, producto).

recomendarAMaria2(Producto):-esProducto(Producto),tieneCaracteristicaS(Producto, blanco, barato , _ ),esProductoDentroDeCategoria(Producto, entretenimiento).

recomendarAMaria3(Producto):-esProducto(Producto),tieneCaracteristicaS(Producto, rojo, _ , malo ),esProductoDentroDeCategoria(Producto, electrodomestico).

recomendarAMaria4(Producto):-esProducto(Producto),tieneCaracteristicaS(Producto, _ , _ , caro ),esProductoDentroDeCategoria(Producto, producto).