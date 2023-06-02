class CustomerReviewModel {
  List<Data>? data;
  bool? status;
  String? message;

  CustomerReviewModel({this.data, this.status, this.message});

  CustomerReviewModel.fromJson(Map<String, dynamic> json) {
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
  RestrorentDetails? restrorentDetails;

  Data(
      {this.id,
      this.userId,
      this.restaurantId,
      this.rating,
      this.comment,
      this.createdAt,
      this.updatedAt,
      this.restrorentDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    restaurantId = json['restaurant_id'];
    rating = json['rating'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restrorentDetails = json['restrorent_details'] != null
        ? new RestrorentDetails.fromJson(json['restrorent_details'])
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
    if (this.restrorentDetails != null) {
      data['restrorent_details'] = this.restrorentDetails!.toJson();
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
  List<String>? tags;
  String? storeStatus;
  String? note;
  Null? locationLink;
  Null? location;
  Null? distance;
  Null? discount;
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