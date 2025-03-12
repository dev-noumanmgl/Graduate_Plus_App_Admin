class StudentInfoModel {
  String studentId;
  String name;
  String email;
  String phone;
  String address;
  String password; // Added password field

  StudentInfoModel({
    required this.studentId,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.password, // Updated model
  });

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'password': password, // Added in JSON
    };
  }

  // Create object from JSON
  factory StudentInfoModel.fromJson(Map<String, dynamic> json) {
    return StudentInfoModel(
      studentId: json['studentId'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      password: json['password'], // Updated model
    );
  }
}
