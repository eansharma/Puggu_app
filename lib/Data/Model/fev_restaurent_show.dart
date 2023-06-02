class FavRestaurantShow {
  String? type;
  bool? success;
  String? message;
  List<Data>? data;

  FavRestaurantShow({this.type, this.success, this.message, this.data});

  FavRestaurantShow.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? customerId;
  int? restaurantId;
  String? createdAt;
  String? updatedAt;
  RestrorentDetails? restrorentDetails;
  RestrorentDetailsImg? restrorentDetailsImg;

  Data(
      {this.id,
        this.customerId,
        this.restaurantId,
        this.createdAt,
        this.updatedAt,
        this.restrorentDetails,
        this.restrorentDetailsImg});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    restaurantId = json['restaurant_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restrorentDetails = json['restrorent_details'] != null
        ? new RestrorentDetails.fromJson(json['restrorent_details'])
        : null;
    restrorentDetailsImg = json['restrorent_details_img'] != null
        ? new RestrorentDetailsImg.fromJson(json['restrorent_details_img'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['restaurant_id'] = this.restaurantId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.restrorentDetails != null) {
      data['restrorent_details'] = this.restrorentDetails!.toJson();
    }
    if (this.restrorentDetailsImg != null) {
      data['restrorent_details_img'] = this.restrorentDetailsImg!.toJson();
    }
    return data;
  }
}

class RestrorentDetails {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? keyword;
  Null? rank;
  // List<String>? tags;
  String? storeStatus;
  String? note;
  Null? locationLink;
  Null? location;
  Null? distance;
  String? discount;
  String? description;
  String? timing;
  String? openTime;
  String? closeTime;
  String? status;
  int? sellerId;
  Null? managerId;
  Null? riderId;
  Null? customerId;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  String? verified;
  String? offerNote;
  String? costPerPerson;
  String? preprationTime;
  Null? offerImg;
  Null? column;
  Null? extraColumn;
  String? offerNoteOne;
  String? offerNoteTwo;
  String? offerNoteThree;
  String? offerNoteFour;
  Null? call;
  String? serviceCharge;
  String? packingCharge;
  String? customStoreStatus;

  RestrorentDetails(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.keyword,
        this.rank,
        // this.tags,
        this.storeStatus,
        this.note,
        this.locationLink,
        this.location,
        this.distance,
        this.discount,
        this.description,
        this.timing,
        this.openTime,
        this.closeTime,
        this.status,
        this.sellerId,
        this.managerId,
        this.riderId,
        this.customerId,
        this.addedBy,
        this.createdAt,
        this.updatedAt,
        this.verified,
        this.offerNote,
        this.costPerPerson,
        this.preprationTime,
        this.offerImg,
        this.column,
        this.extraColumn,
        this.offerNoteOne,
        this.offerNoteTwo,
        this.offerNoteThree,
        this.offerNoteFour,
        this.call,
        this.serviceCharge,
        this.packingCharge,
        this.customStoreStatus});

  RestrorentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    keyword = json['keyword'];
    rank = json['rank'];
    // tags = json['tags'].cast<String>();
    storeStatus = json['store_status'];
    note = json['note'];
    locationLink = json['location_link'];
    location = json['location'];
    distance = json['distance'];
    discount = json['discount'];
    description = json['description'];
    timing = json['timing'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
    status = json['status'];
    sellerId = json['seller_id'];
    managerId = json['manager_id'];
    riderId = json['rider_id'];
    customerId = json['customer_id'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    verified = json['verified'];
    offerNote = json['offer_note'];
    costPerPerson = json['cost_per_person'];
    preprationTime = json['prepration_time'];
    offerImg = json['offer_img'];
    column = json['column'];
    extraColumn = json['extra_column'];
    offerNoteOne = json['offer_note_one'];
    offerNoteTwo = json['offer_note_two'];
    offerNoteThree = json['offer_note_three'];
    offerNoteFour = json['offer_note_four'];
    call = json['call'];
    serviceCharge = json['service_charge'];
    packingCharge = json['packing_charge'];
    customStoreStatus = json['custom_store_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['keyword'] = this.keyword;
    data['rank'] = this.rank;
    // data['tags'] = this.tags;
    data['store_status'] = this.storeStatus;
    data['note'] = this.note;
    data['location_link'] = this.locationLink;
    data['location'] = this.location;
    data['distance'] = this.distance;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['timing'] = this.timing;
    data['open_time'] = this.openTime;
    data['close_time'] = this.closeTime;
    data['status'] = this.status;
    data['seller_id'] = this.sellerId;
    data['manager_id'] = this.managerId;
    data['rider_id'] = this.riderId;
    data['customer_id'] = this.customerId;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['verified'] = this.verified;
    data['offer_note'] = this.offerNote;
    data['cost_per_person'] = this.costPerPerson;
    data['prepration_time'] = this.preprationTime;
    data['offer_img'] = this.offerImg;
    data['column'] = this.column;
    data['extra_column'] = this.extraColumn;
    data['offer_note_one'] = this.offerNoteOne;
    data['offer_note_two'] = this.offerNoteTwo;
    data['offer_note_three'] = this.offerNoteThree;
    data['offer_note_four'] = this.offerNoteFour;
    data['call'] = this.call;
    data['service_charge'] = this.serviceCharge;
    data['packing_charge'] = this.packingCharge;
    data['custom_store_status'] = this.customStoreStatus;
    return data;
  }
}

class RestrorentDetailsImg {
  int? id;
  String? name;
  String? email;
  String? phone;
  Null? emailVerifiedAt;
  Null? otp;
  int? otpValidate;
  String? role;
  String? status;
  String? location;
  String? city;
  String? address;
  String? streetAddress;
  String? image;
  String? createdAt;
  String? updatedAt;
  Null? details;
  String? description;
  String? rank;
  String? userType;
  Null? column;
  Null? extraColumn;
  Null? otpExpiresAt;
  int? verified;

  RestrorentDetailsImg(
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

  RestrorentDetailsImg.fromJson(Map<String, dynamic> json) {
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
