+++++++++++++++++++++++// ignore_for_file: non_constant_identifier_names

class UserModel {
  String? email;
  String? name;
  String? phone;
 

  UserModel({
    required this.email,
    required this.name,
    required this.phone,
   
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];

    // selectedStartingDate = json['selectedStartingDate'].toDate();

 
  }

  Map<String, dynamic> tomap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
  
    };
  }
}
