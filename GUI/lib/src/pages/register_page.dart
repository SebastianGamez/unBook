// Imports
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:un_book/src/repositories/firebase_api.dart';
import 'package:http/http.dart' as http;

import 'package:un_book/src/styles/buttons_style.dart';
import '../models/user_model.dart';

// Register widget (This widget has a variable state)
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

// This enum has the valid genders for the app
enum Gender { male, femme, noBinary }

// Register state
class RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();

  // Inputs controllers
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _repeatPassword = TextEditingController();
  final TextEditingController _date = TextEditingController();

  // Declare and define a default value for the gender property
  Gender? _gender = Gender.femme;

  // Pleasures or likes travel topics
  bool _scienceFiction = false;
  bool _literature = false;
  bool _poetry = false;
  bool _science = false;
  bool _philosophy = false;
  bool _history = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Center(
          child: ListView(
            children: <Widget>[
              // There's rendering the logo
              const Image(image: AssetImage('assets/images/logo.png')),
              const SizedBox(height: 32),
              const Text('Información básica:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              // There's the input text fields
              const SizedBox(height: 16),
              _createInputTextField('Nombre', TextInputType.text, false, _name,
                  'Pepita Pérez', Icons.account_circle),
              const SizedBox(height: 16),
              _createInputTextField(
                  'Correo electrónico',
                  TextInputType.emailAddress,
                  false,
                  _email,
                  'ejemplo@email.com',
                  Icons.alternate_email),
              const SizedBox(height: 16),
              _createInputTextField('Contraseña', TextInputType.text, true,
                  _password, '******', Icons.stream_rounded),
              const SizedBox(height: 16),
              _createInputTextField('Repertir contraseña', TextInputType.text,
                  true, _repeatPassword, '******', Icons.stream_rounded),

              const SizedBox(height: 33),
              // Date input field
              TextFormField(
                controller: _date,
                decoration: InputDecoration(
                    label: const Text('Fecha'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    icon: const Icon(Icons.calendar_month)),
                keyboardType: TextInputType.text,
                onTap: (() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _useDatePicker();
                }),
              ),
              const SizedBox(height: 32),

              // Sex select radios
              const Text("Sexo:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              _createRadio('Femenino', Gender.femme),
              _createRadio('Masculino', Gender.male),
              _createRadio('No binario', Gender.noBinary),
              const SizedBox(height: 32),

              // Activities checkboxes
              const Text("¿Cuáles son tus géneros favoritos?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
              CheckboxListTile(
                  title: const Text('Ciencia ficción'),
                  value: _scienceFiction,
                  onChanged: (bool? selected) =>
                      setState(() => _scienceFiction = selected!)),
              CheckboxListTile(
                  title: const Text('Ciencia'),
                  value: _science,
                  onChanged: (bool? selected) =>
                      setState(() => _science = selected!)),
              CheckboxListTile(
                  title: const Text('Filosofía'),
                  value: _philosophy,
                  onChanged: (bool? selected) =>
                      setState(() => _philosophy = selected!)),
              CheckboxListTile(
                  title: const Text('Historia'),
                  value: _history,
                  onChanged: (bool? selected) =>
                      setState(() => _history = selected!)),
              CheckboxListTile(
                  title: const Text('Literatura'),
                  value: _literature,
                  onChanged: (bool? selected) =>
                      setState(() => _literature = selected!)),
              CheckboxListTile(
                  title: const Text('Poesía'),
                  value: _poetry,
                  onChanged: (bool? selected) =>
                      setState(() => _poetry = selected!)),
              const SizedBox(height: 32),

              // Register and login button
              ElevatedButton(
                  onPressed: _onCLickRegister,
                  style: getTextButtonPrimaryStyle(),
                  child: const Text('Registrarse',
                      style: TextStyle(fontSize: 16))),

              TextButton(
                child: const Text('Iniciar sesión',
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                onPressed: () => Navigator.pushNamed(context, 'login'),
              ),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }

  // This method returns an input text field
  Widget _createInputTextField(
      String title,
      TextInputType textInputType,
      bool obscured,
      TextEditingController controller,
      String hintText,
      IconData icon) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          label: Text(title),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          icon: Icon(icon)),
      keyboardType: textInputType,
      obscureText: obscured,
    );
  }

  // This method returns an radio button
  Widget _createRadio(String title, Gender value) {
    return ListTile(
      title: Text(title),
      leading: Radio<Gender>(
        value: value,
        groupValue: _gender,
        onChanged: ((Gender? option) => setState(() => _gender = option)),
      ),
    );
  }

  // This method shows the date picker
  void _useDatePicker() async {
    DateTime? datePicker = await showDatePicker(
        locale: const Locale('es', 'CO'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2030),
        helpText: "Selcciona una fecha");

    setState(() => {
          if (datePicker != null)
            {
              _date.text = datePicker.toString().split(' ')[0],
            }
          else
            {_showMessage('Debes seleccionar una fecha')}
        });
  }

  // This method shows a message in the bottom screen
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

  Future<void> _saveUser(User user) async {
    String? result =
        await _firebaseApi.registerUser(user.getEmail, user.getPassword);

    String message = 'Usuario registrado con exito';
    if (result == 'invalid-email') {
      message = ('El correo invalido');
      return;
    } else if (result == 'weak-password') {
      message = 'La contraseña muy debíl';
      return;
    } else if (result == 'email-already-in-use') {
      message = 'El correo ya está en uso';
      return;
    } else if (result == 'network-request-failed') {
      message = 'Verifica tu conexión a la red';
      return;
    }

    user.setId = result!;

    var url =
        Uri.parse('https://web-production-f5c8.up.railway.app/api/user');

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json", "Accept" : "application/json"},
      body: jsonEncode(user.toJson()),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    _showMessage(message);
  }

  // This method register the user data and the redirects to the login
  void _onCLickRegister() {
    if (_password.text != _repeatPassword.text) {
      _showMessage('Las contraseñas deben coincidir');
      return;
    }

    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _name.text.isEmpty ||
        _date.text.isEmpty) {
      _showMessage('Por favor complete todos los campos');
      return;
    }

    String gender = 'Femenino';
    if (_gender == Gender.male) {
      gender = 'Masculino';
    } else if (_gender == Gender.noBinary) {
      gender = "No binario";
    }

    String genderBooks = '';

    if (_literature) genderBooks += 'literature';
    if (_scienceFiction) genderBooks += ', science_fiction';
    if (_poetry) genderBooks += ', poetry';
    if (_science) genderBooks += ', science';
    if (_philosophy) genderBooks += ', philosophy';
    if (_history) genderBooks += ', history';

    User user = User(_name.text, _email.text, _password.text, gender,
        _date.text, genderBooks);

    _saveUser(user);

    Navigator.pushReplacementNamed(context, 'login');
  }
}
