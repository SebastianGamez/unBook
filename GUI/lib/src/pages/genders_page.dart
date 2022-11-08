import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../styles/buttons_style.dart';

class GendersPage extends StatefulWidget {
  const GendersPage({super.key});

  @override
  State<GendersPage> createState() => _GendersPageState();
}

class _GendersPageState extends State<GendersPage> {
  List<String> _genders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UnBook')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const SizedBox(height: 20),
          const Text(
            'Selecciona tus géneros favoritos',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 28,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _createGender('science.png', 'Ciencia', 'science'),
              const SizedBox(height: 10),
              _createGender('fiction.png', 'Ciencia ficción', 'science_fiction'),
              const SizedBox(height: 10),
              _createGender('philosophy.png', 'Filosofía', 'philosophy'),
              const SizedBox(height: 10),
              _createGender('history.png', 'Historia', 'history'),
              const SizedBox(height: 10),
              _createGender('literature.png', 'Literatura', 'literature'),
              const SizedBox(height: 10),
              _createGender('poetry.png', 'Poesía', 'poetry'),
              const SizedBox(height: 10)
            ]
          ),
          // Register and login button
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, 'genders_selected'),
            style: getTextButtonPrimaryStyle(),
            child: const Text(
              'Siguiente',
              style: TextStyle(fontSize: 16)
            )
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _getGenders();
  }

  void _getGenders() async {
    var preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getStringList('genders') != null) {
        _genders = preferences.getStringList('genders')!;
      }
    });
  }

  _selectGender(String value) async {
    var preferences = await SharedPreferences.getInstance();
    if (preferences.get('genders') == null) {
      preferences.setStringList('genders', [value]);
    } else {
      List<String> genders = preferences.getStringList('genders')!;
      if (genders.contains(value)) {
        genders.remove(value);
        preferences.setStringList('genders', genders);
      } else {
        genders.add(value);
        preferences.setStringList('genders', genders);
      }
    }

    setState(() => _genders = preferences.getStringList('genders')!);
  }

  Color _selectColor(String value) {
    Color color;

    if (_genders.contains(value)) {
      color = Colors.green[300]!;
    } else {
      color = const Color.fromARGB(125, 158, 158, 158);
    }

    return color;
  }

  Widget _createGender(String icon, String gender, String value) {
    return ElevatedButton(
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 150),
          backgroundColor: _selectColor(value),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image(image: AssetImage('assets/icons/$icon'), width: 100),
        Text(
          gender,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ]),
      onPressed: () => _selectGender(value),
    );
  }
}
