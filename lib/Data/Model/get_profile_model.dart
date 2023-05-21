class GetProfileModel {
  Data? data;
  String? message;
  bool? success;

  GetProfileModel({this.data, this.message, this.success});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  Null? email;
  String? phone;
  Null? emailVerifiedAt;
  Null? otp;
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
  int? verified;

  Data(
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
      this.otpExpiresAt,
      this.verified});

  Data.fromJson(Map<String, dynamic> json) {
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
    verified = json['verified'];
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
    data['verified'] = this.verified;
    return data;
  }
}