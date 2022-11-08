class BookModel {
  // Properties
  final int _id;
  final String _author;
  final String _title;
  final String _releaseDate;
  final String _gender;
  final String _image;

  // Constructors
  BookModel(this._id, this._author, this._title, this._releaseDate,
      this._gender, this._image);

  BookModel.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _author = json['author'],
        _title = json['title'],
        _releaseDate = json['releaseDate'],
        _gender = json['gender'],
        _image = json['image'];

  // Methods
  Map<String, dynamic> toJson() => {
        'id': _id,
        'author': _author,
        'title': _title,
        'releaseDate': _releaseDate,
        'gender': _gender,
        'image': _image
      };

  // Getters
  get getId => _id;
  get getAuthor => _author;
  get getTitle => _title;
  get getReleaseDate => _releaseDate;
  get getGender => _gender;
  get getImage => _image;

}
