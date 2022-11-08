class User {
  
  // Properties
  String _id = '';
  String _name = '';
  String _email = '';
  String _password = '';
  String _sex = '';
  String _birthDate = '';
  String _genders = '';

  // Constructors
  User(this._name, this._email, this._password, this._sex, this._birthDate,
      this._genders);

  User.empty();

  User.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _sex = json['sex'],
        _birthDate = json['birthDate'],
        _genders = json['genders'];

  // Methods
  Map<String, String> toJson() => {
        'id': _id,
        'name': _name,
        'sex': _sex,
        'birthDate': _birthDate,
        'genders': _genders
      };

  // Getters
  get getId => _id;
  get getName => _name;
  get getEmail => _email;
  get getPassword => _password;
  get getSex => _sex;
  get getBirthDate => _birthDate;
  get getGenders => _genders;

  //Setters
  set setId(String id) => _id = id;
  set setName(String name) => _name = name;
  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;
  set setSex(String sex) => _sex = sex;
  set setBirthDate(String birthDate) => _birthDate = birthDate;
  set setGenders(String genders) => _genders = genders;

}
