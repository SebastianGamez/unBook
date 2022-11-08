import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:un_book/src/models/book_model.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<BookModel> _books = [];
  List<String> _favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Explorar')),
        body: ListView(children: _createListBooks()));
  }

  @override
  void initState() {
    super.initState();
    _loadFavorites();
    _getBooks();
  }

  Future<void> _loadFavorites() async {
    var preferences = await SharedPreferences.getInstance();
    _favorites = preferences.getStringList('favorites')!;
  }

  void _showInfo(BookModel book) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title:
            Text(book.getTitle, style: const TextStyle(color: Colors.purple)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Text('Autor: ${book.getAuthor}'),
          Text('Género: ${book.getGender}'),
          Text('Año de publicación: ${book.getReleaseDate}'),
          const Divider(),
          FadeInImage(
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage(book.getImage),
            fadeInDuration: const Duration(seconds: 1),
            fadeInCurve: Curves.easeIn,
            width: 100,
          )
        ]),
        actions: <Widget>[
          TextButton(
              onPressed: () => Navigator.pop(context), child: const Text('Ok!'))
        ],
      ),
    );
  }

  void _addFavorite(BookModel book) async {
    var preferences = await SharedPreferences.getInstance();
    if (preferences.get('favorites') == null) {
      preferences.setStringList('favorites', [book.getId.toString()]);
    } else {
      List<String> favorites = preferences.getStringList('favorites')!;
      if (favorites.contains(book.getId.toString())) {
        favorites.remove(book.getId.toString());
        preferences.setStringList('favorites', favorites);
      } else {
        favorites.add(book.getId.toString());
        preferences.setStringList('favorites', favorites);
      }
    }
    setState(() => _favorites = preferences.getStringList('favorites')!);
  }

  Color _selectFavoriteIconColor(String id) {
    Color color;

    if (_favorites.contains(id)) {
      color = Colors.red;
    } else {
      color = Colors.grey[600]!;
    }

    return color;
  }

  Widget _createCard(BookModel book) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  blurRadius: 16,
                  color: Color.fromARGB(255, 75, 75, 75),
                  spreadRadius: 1,
                  offset: Offset(0, 4))
            ]),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.hardEdge,
              child: FadeInImage(
                height: 100,
                width: 70,
                fit: BoxFit.cover,
                image: NetworkImage(book.getImage),
                fadeInDuration: const Duration(seconds: 1),
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                fadeInCurve: Curves.bounceInOut,
              ),
            ),
            SizedBox(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.getTitle,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(book.getAuthor,
                      style: const TextStyle(
                          fontSize: 12, fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () => _showInfo(book)),
                IconButton(
                    icon: Icon(Icons.favorite,
                        color: _selectFavoriteIconColor(book.getId.toString())),
                    onPressed: () => _addFavorite(book))
              ],
            ),
          ],
        ));
  }

  List<Widget> _createListBooks() {
    return _books.map((book) => _createCard(book)).toList();
  }

  void _getBooks() async {
    Uri url =
        Uri.parse('https://web-production-f5c8.up.railway.app/api/books/');

    var response = await http.get(url);
    List result = jsonDecode(response.body);

    setState(() {
      _books = result.map((book) => BookModel.fromJson(book)).toList();
    });
  }
}
