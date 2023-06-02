class RestrorentReviewModel {
  List<Data>? data;
  bool? status;
  String? message;

  RestrorentReviewModel({this.data, this.status, this.message});

  RestrorentReviewModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  int? restaurantId;
  int? rating;
  String? comment;
  String? createdAt;
  String? updatedAt;
  UserDetails? userDetails;

  Data(
      {this.id,
      this.userId,
      this.restaurantId,
      this.rating,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.userDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class UserDetails {
  int? id;
  String? name;
  String? email;
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
  int? verified;

  UserDetails(
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

  UserDetails.fromJson(Map<String, dynamic> json) {
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