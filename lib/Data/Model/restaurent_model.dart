class RestaurentModel {
  List<Data>? data;

  RestaurentModel({this.data});

  RestaurentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? otp;
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
  String? details;
  String? description;
  String? rank;
  String? userType;
  int? verified;
  bool? wished;
  UserDetail? userDetail;

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
        this.verified,
        this.wished,
        this.userDetail});

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
    verified = json['verified'];
    wished = json['wished'];
    userDetail = json['user_detail'] != null
        ? new UserDetail.fromJson(json['user_detail'])
        : null;
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
    data['verified'] = this.verified;
    data['wished'] = this.wished;
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail!.toJson();
    }
    return data;
  }
}

class UserDetail {
  int? id;
  String? name;
  String? address;
  String? phone;
  String? keyword;
  String? rank;
  List<String>? tags;
  String? storeStatus;
  String? note;
  String? locationLink;
  String? location;
  String? distance;
  String? discount;
  String? description;
  String? timing;
  String? openTime;
  String? closeTime;
  String? status;
  int? sellerId;
  String? managerId;
  String? riderId;
  String? customerId;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  String? verified;
  String? offerNote;
  String? costPerPerson;
  String? preprationTime;
  String? offerNoteOne;
  String? offerNoteTwo;
  String? offerNoteThree;
  String? offerNoteFour;
  String? serviceCharge;
  String? packingCharge;
  String? customStoreStatus;
  bool? isOpen;

  UserDetail(
      {this.id,
        this.name,
        this.address,
        this.phone,
        this.keyword,
        this.rank,
        this.tags,
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
        this.offerNoteOne,
        this.offerNoteTwo,
        this.offerNoteThree,
        this.offerNoteFour,
        this.serviceCharge,
        this.packingCharge,
        this.customStoreStatus,
        this.isOpen});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    keyword = json['keyword'];
    rank = json['rank'];
    tags = json['tags'].cast<String>();
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
    offerNoteOne = json['offer_note_one'];
    offerNoteTwo = json['offer_note_two'];
    offerNoteThree = json['offer_note_three'];
    offerNoteFour = json['offer_note_four'];
    serviceCharge = json['service_charge'];
    packingCharge = json['packing_charge'];
    customStoreStatus = json['custom_store_status'];
    isOpen = json['is_open'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['keyword'] = this.keyword;
    data['rank'] = this.rank;
    data['tags'] = this.tags;
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
    data['offer_note_one'] = this.offerNoteOne;
    data['offer_note_two'] = this.offerNoteTwo;
    data['offer_note_three'] = this.offerNoteThree;
    data['offer_note_four'] = this.offerNoteFour;
    data['service_charge'] = this.serviceCharge;
    data['packing_charge'] = this.packingCharge;
    data['custom_store_status'] = this.customStoreStatus;
    data['is_open'] = this.isOpen;
    return data;
  }
}
