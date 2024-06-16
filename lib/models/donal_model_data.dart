import 'dart:developer';

class DonarModelData {
  int? count;
  String? next;
  String? previous;
  List<DonarData>? donarData;

  DonarModelData(
    this.count,
    this.next,
    this.previous,
    this.donarData,
  );

  DonarModelData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];

    donarData = json['results'].map<DonarData>((data) {
      var ab = DonarData.fromJson(data);
      return ab;
    }).toList();
  }
}

class DonarData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? dateOfBirth;
  String? gender;
  String? bloodGroup;
  String? mobileNumber;
  String? lat;
  String? lon;
  String? image;

  DonarData(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.bloodGroup,
    this.mobileNumber,
    this.lat,
    this.lon,
    this.image,
  );

  get getId => id;

  DonarData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    bloodGroup = json['blood_group'];
    mobileNumber = json['mobile_number'];
    lat = json['lat'];
    lon = json['lon'];
    image = json['image'];
  }

  String get fullName => '$firstName $lastName';
}
