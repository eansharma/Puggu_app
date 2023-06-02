class Address_List_Model {
  List<Data>? data;
  bool? status;
  String? message;

  Address_List_Model({this.data, this.status, this.message});

  Address_List_Model.fromJson(Map<String, dynamic> json) {
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
  int? addressType;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? latitude;
  String? longitude;
  String? landmark;
  String? streetAddress;
  String? city;
  int? cityId;

  Data(
      {this.id,
        this.userId,
        this.addressType,
        this.address,
        this.createdAt,
        this.updatedAt,
        this.latitude,
        this.longitude,
        this.landmark,
        this.streetAddress,
        this.city,
        this.cityId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    addressType = json['address_type'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    landmark = json['landmark'];
    streetAddress = json['street_address'];
    city = json['city'];
    cityId = json['city_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['address_type'] = this.addressType;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['landmark'] = this.landmark;
    data['street_address'] = this.streetAddress;
    data['city'] = this.city;
    data['city_id'] = this.cityId;
    return data;
  }
}
