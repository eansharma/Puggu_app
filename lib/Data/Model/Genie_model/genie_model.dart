class show_genies_model {
  Data? data;
  String? message;
  bool? success;

  show_genies_model({this.data, this.message, this.success});

  show_genies_model.fromJson(Map<String, dynamic> json) {
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
  String? pickupName;
  String? pickupPhone;
  String? pickupMapAddress;
  String? pickupLatitude;
  String? pickupLongitude;
  String? pickupCity;
  String? pickupLandmarkAddress;
  String? pickupStreetAddress;
  String? dropName;
  String? dropPhone;
  String? dropMapAddress;
  String? dropLatitude;
  String? dropLongitude;
  String? dropCity;
  String? dropLandmarkAddress;
  String? dropStreetAddress;
  String? category;
  String? task;
  String? description;
  String? status;
  String? userId;
  String? schedule;
  String? call;
  String? km;
  String? autoDeliveryCharge;
  String? customDeliveryCharge;
  String? deliveryCharge;
  String? note;
  String? offerNote;
  String? otherNote;
  String? slug;
  String? role;
  String? image;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.pickupName,
        this.pickupPhone,
        this.pickupMapAddress,
        this.pickupLatitude,
        this.pickupLongitude,
        this.pickupCity,
        this.pickupLandmarkAddress,
        this.pickupStreetAddress,
        this.dropName,
        this.dropPhone,
        this.dropMapAddress,
        this.dropLatitude,
        this.dropLongitude,
        this.dropCity,
        this.dropLandmarkAddress,
        this.dropStreetAddress,
        this.category,
        this.task,
        this.description,
        this.status,
        this.userId,
        this.schedule,
        this.call,
        this.km,
        this.autoDeliveryCharge,
        this.customDeliveryCharge,
        this.deliveryCharge,
        this.note,
        this.offerNote,
        this.otherNote,
        this.slug,
        this.role,
        this.image,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pickupName = json['pickup_name'];
    pickupPhone = json['pickup_phone'];
    pickupMapAddress = json['pickup_map_address'];
    pickupLatitude = json['pickup_latitude'];
    pickupLongitude = json['pickup_longitude'];
    pickupCity = json['pickup_city'];
    pickupLandmarkAddress = json['pickup_landmark_address'];
    pickupStreetAddress = json['pickup_street_address'];
    dropName = json['drop_name'];
    dropPhone = json['drop_phone'];
    dropMapAddress = json['drop_map_address'];
    dropLatitude = json['drop_latitude'];
    dropLongitude = json['drop_longitude'];
    dropCity = json['drop_city'];
    dropLandmarkAddress = json['drop_landmark_address'];
    dropStreetAddress = json['drop_street_address'];
    category = json['category'];
    task = json['task'];
    description = json['description'];
    status = json['status'];
    userId = json['user_id'];
    schedule = json['schedule'];
    call = json['call'];
    km = json['km'];
    autoDeliveryCharge = json['auto_delivery_charge'];
    customDeliveryCharge = json['custom_delivery_charge'];
    deliveryCharge = json['delivery_charge'];
    note = json['note'];
    offerNote = json['offer_note'];
    otherNote = json['other_note'];
    slug = json['slug'];
    role = json['role'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pickup_name'] = this.pickupName;
    data['pickup_phone'] = this.pickupPhone;
    data['pickup_map_address'] = this.pickupMapAddress;
    data['pickup_latitude'] = this.pickupLatitude;
    data['pickup_longitude'] = this.pickupLongitude;
    data['pickup_city'] = this.pickupCity;
    data['pickup_landmark_address'] = this.pickupLandmarkAddress;
    data['pickup_street_address'] = this.pickupStreetAddress;
    data['drop_name'] = this.dropName;
    data['drop_phone'] = this.dropPhone;
    data['drop_map_address'] = this.dropMapAddress;
    data['drop_latitude'] = this.dropLatitude;
    data['drop_longitude'] = this.dropLongitude;
    data['drop_city'] = this.dropCity;
    data['drop_landmark_address'] = this.dropLandmarkAddress;
    data['drop_street_address'] = this.dropStreetAddress;
    data['category'] = this.category;
    data['task'] = this.task;
    data['description'] = this.description;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['schedule'] = this.schedule;
    data['call'] = this.call;
    data['km'] = this.km;
    data['auto_delivery_charge'] = this.autoDeliveryCharge;
    data['custom_delivery_charge'] = this.customDeliveryCharge;
    data['delivery_charge'] = this.deliveryCharge;
    data['note'] = this.note;
    data['offer_note'] = this.offerNote;
    data['other_note'] = this.otherNote;
    data['slug'] = this.slug;
    data['role'] = this.role;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
