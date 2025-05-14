// class UserModel {
//   late final String id;
//   late final String email;
//   late final String firstName;
//   late final String lastName;
//   late final String mobile;
//   late final String createdDate;
//       UserModel ();
//   UserModel.fromJson(Map<String, dynamic> jsonData) {
//     id = jsonData['_id'];
//     email = jsonData['email'];
//     firstName = jsonData['firstName'];
//     lastName = jsonData['lastName'];
//     mobile = jsonData['mobile'];
//     createdDate = jsonData['createdDate'];
//   }
// }

class UserModel {
  late final String id;
  late final String email;
  late final String firstName;
  late final String lastName;
  late final String mobile;
  late final String createdDate;

  UserModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData['_id'] ?? '';
    email = jsonData['email'] ?? '';
    ;
    firstName = jsonData['firstName'] ?? '';
    ;
    lastName = jsonData['lastName'] ?? '';
    ;
    mobile = jsonData['mobile'] ?? '';
    ;
    createdDate = jsonData['createdDate'] ?? '';
    ;
  }

  Map <String, dynamic> toJson () {
    return {
      '_id' : id,
      'email' : email,
      'firstName' : firstName,
      'lastName' : lastName,
      'mobile' : mobile,
      'createdDate' : createdDate,

    };
  }


}









//////////////////////////////////////////////////////////////////////////////

// class UserModel {
//    final String id;
//    final String email;
//    final String firstName;
//    final String lastName;
//    final String mobile;
//    final String createdDate;
//
//    UserModel ();
//
//   UserModel.fromJson(Map<String, dynamic> jsonData) {
//     id = jsonData['_id'] ?? '';
//     email = jsonData['email'] ?? '';;
//     firstName = jsonData['firstName'] ?? '';;
//     lastName = jsonData['lastName'] ?? '';;
//     mobile = jsonData['mobile'] ?? '';;
//     createdDate = jsonData['createdDate'] ?? '';;
//   }
// }
