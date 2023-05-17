class NumberOtp {
  bool? success;
  int? code;
  String? message;
  User? user;
  String? token;

  NumberOtp({this.success, this.code, this.message, this.user, this.token});

  NumberOtp.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? email;
  String? phone;
  Null? emailVerifiedAt;
  String? otp;
  int? otpValidate;
  String? role;
  String? status;
  String? location;
  Null? city;
  Null? address;
  Null? streetAddress;
  Null? image;
  String? createdAt;
  String? updatedAt;
  Null? details;
  String? description;
  String? rank;
  Null? userType;
  Null? column;
  Null? extraColumn;
  Null? otpExpiresAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.otp,
      this.otpValidate,
      this.role,
      this.status,
      this.location,
      this.city,
      this.address,
      this.streetAddress,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.details,
      this.description,
      this.rank,
      this.userType,
      this.column,
      this.extraColumn,
      this.otpExpiresAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    otp = json['otp'];
    otpValidate = json['otp_validate'];
    role = json['role'];
    status = json['status'];
    location = json['location'];
    city = json['city'];
    address = json['address'];
    streetAddress = json['street_address'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    details = json['details'];
    description = json['description'];
    rank = json['rank'];
    userType = json['user_type'];
    column = json['column'];
    extraColumn = json['extra_column'];
    otpExpiresAt = json['otp_expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['otp'] = this.otp;
    data['otp_validate'] = this.otpValidate;
    data['role'] = this.role;
    data['status'] = this.status;
    data['location'] = this.location;
    data['city'] = this.city;
    data['address'] = this.address;
    data['street_address'] = this.streetAddress;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['details'] = this.details;
    data['description'] = this.description;
    data['rank'] = this.rank;
    data['user_type'] = this.userType;
    data['column'] = this.column;
    data['extra_column'] = this.extraColumn;
    data['otp_expires_at'] = this.otpExpiresAt;
    return data;
  }
}