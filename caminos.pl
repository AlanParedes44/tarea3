% Hechos
ciudad(laPaz).
ciudad(oruro).
ciudad(potosi).
ciudad(cochabamba).
ciudad(chuquisaca).
ciudad(tarija).
ciudad(santaCruz).
ciudad(beni).
ciudad(pando).
ciudad(apolo).
ciudad(uyuni).
ciudad(villaMontes).
ciudad(sucre).
ciudad(cobija).
ciudad(riberalta).
ciudad(trinidad).
ciudad(sanJoseDeChiquitos).
ciudad(puertoSuarez).

departamento(laPaz).
departamento(oruro).
departamento(potosi).
departamento(cochabamba).
departamento(chuquisaca).
departamento(tarija).
departamento(santaCruz).
departamento(beni).
departamento(pando).

pertenece_a(sucre, chuquisaca).
pertenece_a(ciudad_de_tarija, tarija).

conectado_directamente(cobija, apolo).
conectado_directamente(apolo, cobija).
% Otras conexiones omitidas por brevedad...

% Reglas
estaEnDepartamento(Ciudad, Departamento) :- pertenece_a(Ciudad, Departamento).

conectada(Ciudad1, Ciudad2) :- conectado_directamente(Ciudad1, Ciudad2); conectado_directamente(Ciudad2, Ciudad1).

ciudadesConConexion(Ciudad, Ciudades) :- conectada(Ciudad, OtraCiudad), Ciudad \= OtraCiudad, findall(OtraCiudad, conectada(Ciudad, OtraCiudad), Ciudades).

departamentosConConexion(Departamento, Departamentos) :- conectada(Departamento, OtroDepartamento), Departamento \= OtroDepartamento, findall(OtroDepartamento, conectada(Departamento, OtroDepartamento), Departamentos).

ciudadesParaLlegarACapital(Ciudad, Ciudades) :- pertenece_a(Capital, _), conectada(Ciudad, Capital), findall(CiudadCon, conectada(Ciudad, CiudadCon), Ciudades).

departamentosConCapital(Departamentos) :- findall(Departamento, pertenece_a(_, Departamento), Departamentos).

% Reglas adicionales
ciudades_destino_desde(CiudadOrigen, CiudadDestino) :-
    conectado_directamente(CiudadOrigen, CiudadDestino).
ciudades_destino_desde(CiudadOrigen, CiudadDestino) :-
    conectado_directamente(CiudadOrigen, CiudadIntermedia),
    ciudades_destino_desde(CiudadIntermedia, CiudadDestino),
    CiudadOrigen \= CiudadDestino.

ciudades_con_acceso_directo_a_sucre(CiudadOrigen) :-
    conectado_directamente(CiudadOrigen, sucre).
ciudades_con_acceso_directo_a_sucre(CiudadOrigen) :-
    conectado_directamente(CiudadOrigen, CiudadIntermedia),
    ciudades_con_acceso_directo_a_sucre(CiudadIntermedia),
    CiudadOrigen \= sucre.