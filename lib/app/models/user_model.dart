class UserModel{
  late  String language;


  UserModel( {
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'language': this.language,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      language: map['language'] as String,
    );
  }
}