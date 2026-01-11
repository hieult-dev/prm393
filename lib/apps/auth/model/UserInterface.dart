class UserInterface {
  final String? id;
  final String fullName;
  final String email;

  UserInterface({
    this.id,
    required this.fullName,
    required this.email,
  });

  factory UserInterface.fromJson(Map<String, dynamic> json) {
    return UserInterface(
      id: json['id'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
    };
  }
}
