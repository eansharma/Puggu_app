class RestaurantModel {
  String? message;
  List<Data>? data;

  RestaurantModel({this.message, this.data});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  String? discount;
  String? description;
  String? timing;
  String? openTime;
  String? closeTime;
  String? status;
  int? sellerId;
  int? managerId;
  int? riderId;
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

  Data({
    this.id,
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
    this.customStoreStatus,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    keyword = json['keyword'];
    rank = json['rank'];
    tags = List<String>.from(json['tags'] ?? []);
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['keyword'] = keyword;
    data['rank'] = rank;
    data['tags'] = tags;
    data['store_status'] = storeStatus;
    data['note'] = note;
    data['location_link'] = locationLink;
    data['location'] = location;
    data['distance'] = distance;
    data['discount'] = discount;
    data['description'] = description;
    data['timing'] = timing;
    data['open_time'] = openTime;
    data['close_time'] = closeTime;
    data['status'] = status;
    data['seller_id'] = sellerId;
    data['manager_id'] = managerId;
    data['rider_id'] = riderId;
    data['customer_id'] = customerId;
    data['added_by'] = addedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['verified'] = verified;
    data['offer_note'] = offerNote;
    data['cost_per_person'] = costPerPerson;
    data['prepration_time'] = preprationTime;
    data['offer_img'] = offerImg;
    data['column'] = column;
    data['extra_column'] = extraColumn;
    data['offer_note_one'] = offerNoteOne;
    data['offer_note_two'] = offerNoteTwo;
    data['offer_note_three'] = offerNoteThree;
    data['offer_note_four'] = offerNoteFour;
    data['call'] = call;
    data['service_charge'] = serviceCharge;
    data['packing_charge'] = packingCharge;
    data['custom_store_status'] = customStoreStatus;
    return data;
  }
}
