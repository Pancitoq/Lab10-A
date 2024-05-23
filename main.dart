import 'package:flutter/material.dart';

class Pelicula {
  String nombrePel;
  DateTime fecha;
  String duracion;
  String img;
  String descripcion;
  String categoria;

  Pelicula({
    required this.nombrePel,
    required this.fecha,
    required this.duracion,
    required this.img,
    required this.descripcion,
    required this.categoria,
  });
}

class PeliculaCard extends StatelessWidget {
  final Pelicula pelicula;

  PeliculaCard({required this.pelicula});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Image.network(
              pelicula.img,
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pelicula.nombrePel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Categoría: ${pelicula.categoria}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Duración: ${pelicula.duracion}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Fecha: ${pelicula.fecha.day}/${pelicula.fecha.month}/${pelicula.fecha.year}",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Descripción: ${pelicula.descripcion}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartelera',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Pelicula> peliculas = [
    Pelicula(
      nombrePel: "Furiosa: de la Saga Mad Max",
      fecha: DateTime.now(),
      duracion: "2hrs 30min",
      img: "https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00001927?referenceScheme=HeadOffice&allowPlaceHolder=true",
      descripcion: "Mientras el mundo caía, la joven Furiosa es arrebatada del Lugar Verde de Muchas Madres y cae en manos de una gran Horda de Motociclistas liderada por el Señor de la Guerra Dementus. Navegando por Wasteland, se encuentran con la Ciudadela presidida por The Immortan Joe. Mientras los dos Tiranos luchan por el dominio, Furiosa debe sobrevivir a muchas pruebas mientras reúne los medios para encontrar el camino a casa.",
      categoria: "Accion",
    ),
    Pelicula(
      nombrePel: "Los Extraños: Capitulo 1",
      fecha: DateTime.now(),
      duracion: "1hrs 40min",
      img: "https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00002019?referenceScheme=HeadOffice&allowPlaceHolder=true",
      descripcion: "La trama se centra en una pareja joven que debe viajar para tener un nuevo comienzo. Desafortunadamente no tendrán otra oportunidad que detenerse en un AirBnb aislado en Oregón. Una noche de terror contra tres desconocidos enmascarados se avecina.",
      categoria: "Terror",
    ),
    Pelicula(
      nombrePel: "Inmaculada",
      fecha: DateTime.now(),
      duracion: "2hrs 0min",
      img: "https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00002022?referenceScheme=HeadOffice&allowPlaceHolder=true",
      descripcion: "Cecilia (Sydney Sweeney), una monja fervientemente devota, se aventura hacia un remoto convento en la campiña italiana en busca de la consagración espiritual. Sin embargo, lo que inicialmente prometía ser un encuentro espiritual se transforma en una oscura y aterradora pesadilla. Pronto, se verá atrapada en una red de fuerzas malignas que acechan en las sombras, amenazando con desgarrar su alma y poner en duda su fe en la Iglesia. Cada giro del destino desentrañará más terror, sumergiendo a Cecilia en un abismo de angustia y desesperación.",
      categoria: "Terror",
    ),
    Pelicula(
      nombrePel: "Viejas Amigas",
      fecha: DateTime.now(),
      duracion: "1hrs 20min",
      img: "https://cdn.apis.cineplanet.com.pe/CDN/media/entity/get/FilmPosterGraphic/HO00001978?referenceScheme=HeadOffice&allowPlaceHolder=true",
      descripcion: "Pilar, Charito, Meche y Cristina son cuatro entrañables amigas amantes de la timba y el lonchecito que se reúnen todos los fines de semana. Cuando descubren que una de ellas enfrenta la batalla contra el cáncer, deciden llevar a cabo un plan de rescate, determinadas a impedir que la enfermedad se la lleve. Se ven forzadas a raptarla de la clínica para emprender un viaje hacia el norte lleno de aventuras, y con una absoluta fe en los milagros de la Virgen de La Puerta en Otuzco.",
      categoria: "Comedia",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartelera'),
      ),
      body: ListView.builder(
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PeliculaCard(pelicula: peliculas[index]),
          );
        },
      ),
    );
  }
}
