import 'package:flutter/material.dart';

import '../styles/buttons_style.dart';
import 'package:un_book/src/repositories/firebase_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final FirebaseApi _firebaseApi = FirebaseApi();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: <Widget>[
            // There's rendering the logo
            const Image(image: AssetImage('assets/images/logo.png')),

            // Email and password inputs
            const SizedBox(height: 16.0),
            _createFormTextField(_email, 'Correo electrónico',
                'ejemplo@email.com', false, Icons.alternate_email_outlined),
            const SizedBox(height: 16.0),
            _createFormTextField(_password, 'Contraseña', '*******', true,
                Icons.stream_outlined),
            const SizedBox(height: 16.0),

            // Login button
            ElevatedButton(
              style: getTextButtonPrimaryStyle(),
              onPressed: _onClickLogin,
              child: const Text('Iniciar Sesión'),
            ),

            // Register redirect button
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic)),
              onPressed: () => Navigator.pushNamed(context, 'register'),
              child: const Text('Registrarse'),
            ),
          ],
        ))),
      ),
    );
  }

  // This method returns a form text field
  Widget _createFormTextField(TextEditingController controller, String label,
      String hintText, bool obscured, IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: label,
          hintText: hintText),
      keyboardType: TextInputType.text,
      obscureText: obscured,
    );
  }

  _onClickLogin() async {
    String message = 'Bienvenido!';

    if (_email.text.isEmpty || _password.text.isEmpty) {
      message = 'Por favor complete todos los campos';
    } else {
      String? result =
          await _firebaseApi.loginUser(_email.text, _password.text);

      if (result == 'invalid-email') {
        message = 'El correo o contraseña es incorrecta';
      } else if (result == 'user-not-found') {
        message = 'El correo o contraseña es incorrecta';
      } else if (result == 'wrong-password') {
        message = 'El correo o contraseña es incorrecta';
      } else if (result == 'network-request-failed') {
        message = 'Verifica tu conexión a la red';
      } else {
        _homePageRedirect();
      }
    }

    _showMessage(message);
  }

  void _homePageRedirect() {
    Navigator.pushNamed(context, 'home');
  }

  void _showMessage(String message) {
    ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () => scaffoldMessenger.hideCurrentSnackBar(),
      ),
    ));
  }
}
