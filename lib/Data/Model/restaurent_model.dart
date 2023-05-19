class RestaurentModel {
  RestaurentModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;
  
  RestaurentModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.address,
     this.phone,
     this.keyword,
     this.rank,
     this.tags,
    required this.storeStatus,
     this.note,
     this.locationLink,
     this.location,
     this.distance,
     this.discount,
    required this.description,
     this.timing,
    required this.openTime,
    required this.closeTime,
    required this.status,
     this.sellerId,
     this.managerId,
     this.riderId,
     this.customerId,
    required this.addedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.verified,
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
  late final int id;
  late final String name;
  late final String address;
  late final String? phone;
  late final String? keyword;
  late final Null rank;
  late final List<String>? tags;
  late final String storeStatus;
  late final String? note;
  late final Null locationLink;
  late final Null location;
  late final Null distance;
  late final String? discount;
  late final String description;
  late final String? timing;
  late final String openTime;
  late final String closeTime;
  late final String status;
  late final int? sellerId;
  late final int? managerId;
  late final int? riderId;
  late final Null customerId;
  late final int addedBy;
  late final String createdAt;
  late final String updatedAt;
  late final String verified;
  late final String? offerNote;
  late final String? costPerPerson;
  late final String? preprationTime;
  late final Null offerImg;
  late final Null column;
  late final Null extraColumn;
  late final String? offerNoteOne;
  late final String? offerNoteTwo;
  late final String? offerNoteThree;
  late final String? offerNoteFour;
  late final Null call;
  late final String? serviceCharge;
  late final String? packingCharge;
  late final String? customStoreStatus;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = null;
    keyword = json['keyword'];
    rank = null;
    tags = null;
    storeStatus = json['store_status'];
    note = null;
    locationLink = null;
    location = null;
    distance = null;
    discount = null;
    description = json['description'];
    timing = null;
    openTime = json['open_time'];
    closeTime = json['close_time'];
    status = json['status'];
    sellerId = null;
    managerId = null;
    riderId = null;
    customerId = null;
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    verified = json['verified'];
    offerNote = null;
    costPerPerson = null;
    preprationTime = null;
    offerImg = null;
    column = null;
    extraColumn = null;
    offerNoteOne = null;
    offerNoteTwo = null;
    offerNoteThree = null;
    offerNoteFour = null;
    call = null;
    serviceCharge = null;
    packingCharge = null;
    customStoreStatus = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['phone'] = phone;
    _data['keyword'] = keyword;
    _data['rank'] = rank;
    _data['tags'] = tags;
    _data['store_status'] = storeStatus;
    _data['note'] = note;
    _data['location_link'] = locationLink;
    _data['location'] = location;
    _data['distance'] = distance;
    _data['discount'] = discount;
    _data['description'] = description;
    _data['timing'] = timing;
    _data['open_time'] = openTime;
    _data['close_time'] = closeTime;
    _data['status'] = status;
    _data['seller_id'] = sellerId;
    _data['manager_id'] = managerId;
    _data['rider_id'] = riderId;
    _data['customer_id'] = customerId;
    _data['added_by'] = addedBy;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['verified'] = verified;
    _data['offer_note'] = offerNote;
    _data['cost_per_person'] = costPerPerson;
    _data['prepration_time'] = preprationTime;
    _data['offer_img'] = offerImg;
    _data['column'] = column;
    _data['extra_column'] = extraColumn;
    _data['offer_note_one'] = offerNoteOne;
    _data['offer_note_two'] = offerNoteTwo;
    _data['offer_note_three'] = offerNoteThree;
    _data['offer_note_four'] = offerNoteFour;
    _data['call'] = call;
    _data['service_charge'] = serviceCharge;
    _data['packing_charge'] = packingCharge;
    _data['custom_store_status'] = customStoreStatus;
    return _data;
  }
}