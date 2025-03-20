class CustomerInfo {
  final String fullName;
  final String email;

  CustomerInfo({
    required this.fullName,
    required this.email,
  });


  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
    };
  }
}
