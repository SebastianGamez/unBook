import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('UnBook'),
      ),
      body: Column(
        children: [
          _createCard(Colors.deepPurpleAccent, Icons.find_in_page_sharp, 'Explorar', 'Encuentra libros de tu interés', 'explore', context),
          _createCard(Colors.blueAccent, Icons.my_library_books, 'Géneros', 'Visualiza libros por género', 'genders', context),
          _createCard(Colors.redAccent, Icons.bookmarks, 'Favoritos', 'Busca entre tus selecciones', 'favorites', context)
        ],
      ),
    );
  }

  Widget _createCard(Color color, IconData icon, String title, String description, String redirection, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 16,
            color: Color.fromARGB(255, 75, 75, 75),
            spreadRadius: 1,
            offset: Offset(0, 4)
          )
        ]
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(icon, color: Colors.white, size: 50),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 28
              )
            ),
            subtitle: Text(
              description,
              style: const TextStyle(
                color: Colors.white70
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, redirection), 
                child: const Text(
                  'Ir ahora',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
