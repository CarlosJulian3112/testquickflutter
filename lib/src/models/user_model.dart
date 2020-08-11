class User {
  String id;
  String firstName;
  String lastName;
  String gender;
  String dob;
  String email;
  String phone;
  String website;
  String address;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.dob,
    this.email,
    this.phone,
    this.website,
    this.address,
  });
  User.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dob = json['dob'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address = json['address'];
  }
}
