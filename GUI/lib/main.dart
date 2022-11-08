// Imports
import 'package:flutter/material.dart';
import 'package:un_book/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



// There's running the application
void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// App widget 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // There's deactivating the debug banner
      debugShowCheckedModeBanner: false,
      
      // Application properties
      title: 'UnBook',
      initialRoute: '/',
      routes: getRoutes(),
      
      // Language settings
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("es", "CO"),
      ],

      // Style properties
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white
      ),

    );
  }
}
