class ResponseModel {
  // Properties
  String _result = '';
  String _error = '';

  // Constructors
  ResponseModel(this._result, this._error);

  ResponseModel.empty();

  ResponseModel.fromJson(Map<String, dynamic> json)
      : _result = json['result'],
        _error = json['error'];

  // Methods
  Map<String, String> toJson() => {
    'result': _result,
    'error': _error,
  };

  // Getters
  get getResult => _result;
  get getError => _error;

}