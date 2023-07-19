// ignore_for_file: file_names
 
class UserModel {
  final String firstName;
  final String lastName;
  final String email;

  UserModel(
      {required this.firstName, required this.lastName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> response) {
    return UserModel(
      firstName: response['firstName'],
      lastName: response['lastName'],
      email: response['email'],
    );
  }

static Map<String, String> toMap(UserModel user) {
    final Map<String, String> map = {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
    };
    return map;
  }
}
