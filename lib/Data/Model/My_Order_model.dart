class my_order_model {
  List<Data_Order>? data;
  List<RiderDetails>? riderDetails;
  bool? status;
  String? message;

  my_order_model({this.data, this.riderDetails, this.status, this.message});

  my_order_model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data_Order>[];
      json['data'].forEach((v) { data!.add(new Data_Order.fromJson(v)); });
    }
    if (json['rider_details'] != null) {
      riderDetails = <RiderDetails>[];
      json['rider_details'].forEach((v) { riderDetails!.add(new RiderDetails.fromJson(v)); });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.riderDetails != null) {
      data['rider_details'] = this.riderDetails!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data_Order {
  int? id;
  int? userId;
  Null? riderId;
  String? total;
  String? status;
  String? phone;
  String? createdAt;
  String? updatedAt;
  int? addressId;
  int? userDetailId;
  String? paymentMode;
  String? deliveryCharge;
  int? orderType;
  Null? timeSchedule;
  String? orderDesc;
  String? weatherCharge;
  String? km;
  String? userName;
  String? userPhone;
  String? call;
  Null? time;
  Null? date;
  Null? column;
  Null? columnone;
  Null? columntwo;
  Null? columnthree;
  List<Orderitem>? orderitem;
  Address? address;
  OrderRiderDetail? orderRiderDetail;

  Data_Order({this.id, this.userId, this.riderId, this.total, this.status, this.phone, this.createdAt, this.updatedAt, this.addressId, this.userDetailId, this.paymentMode, this.deliveryCharge, this.orderType, this.timeSchedule, this.orderDesc, this.weatherCharge, this.km, this.userName, this.userPhone, this.call, this.time, this.date, this.column, this.columnone, this.columntwo, this.columnthree, this.orderitem, this.address, this.orderRiderDetail});

  Data_Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    riderId = json['rider_id'];
    total = json['total'];
    status = json['status'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addressId = json['address_id'];
    userDetailId = json['user_detail_id'];
    paymentMode = json['payment_mode'];
    deliveryCharge = json['delivery_charge'];
    orderType = json['order_type'];
    timeSchedule = json['time_schedule'];
    orderDesc = json['order_desc'];
    weatherCharge = json['weather_charge'];
    km = json['km'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    call = json['call'];
    time = json['time'];
    date = json['date'];
    column = json['column'];
    columnone = json['columnone'];
    columntwo = json['columntwo'];
    columnthree = json['columnthree'];
    if (json['orderitem'] != null) {
      orderitem = <Orderitem>[];
      json['orderitem'].forEach((v) { orderitem!.add(new Orderitem.fromJson(v)); });
    }
    address = json['address'] != null ? new Address.fromJson(json['address']) : null;
    orderRiderDetail = json['order_rider_detail'] != null ? new OrderRiderDetail.fromJson(json['order_rider_detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['rider_id'] = this.riderId;
    data['total'] = this.total;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['address_id'] = this.addressId;
    data['user_detail_id'] = this.userDetailId;
    data['payment_mode'] = this.paymentMode;
    data['delivery_charge'] = this.deliveryCharge;
    data['order_type'] = this.orderType;
    data['time_schedule'] = this.timeSchedule;
    data['order_desc'] = this.orderDesc;
    data['weather_charge'] = this.weatherCharge;
    data['km'] = this.km;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['call'] = this.call;
    data['time'] = this.time;
    data['date'] = this.date;
    data['column'] = this.column;
    data['columnone'] = this.columnone;
    data['columntwo'] = this.columntwo;
    data['columnthree'] = this.columnthree;
    if (this.orderitem != null) {
      data['orderitem'] = this.orderitem!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.orderRiderDetail != null) {
      data['order_rider_detail'] = this.orderRiderDetail!.toJson();
    }
    return data;
  }
}

class Orderitem {
  int? id;
  int? orderId;
  int? subMenuId;
  int? qty;
  String? specialRequirements;
  String? attribute;
  String? prices;
  String? createdAt;
  String? updatedAt;
  Submenu? submenu;

  Orderitem({this.id, this.orderId, this.subMenuId, this.qty, this.specialRequirements, this.attribute, this.prices, this.createdAt, this.updatedAt, this.submenu});

  Orderitem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    subMenuId = json['sub_menu_id'];
    qty = json['qty'];
    specialRequirements = json['special_requirements'];
    attribute = json['attribute'];
    prices = json['prices'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    submenu = json['submenu'] != null ? new Submenu.fromJson(json['submenu']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['sub_menu_id'] = this.subMenuId;
    data['qty'] = this.qty;
    data['special_requirements'] = this.specialRequirements;
    data['attribute'] = this.attribute;
    data['prices'] = this.prices;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.submenu != null) {
      data['submenu'] = this.submenu!.toJson();
    }
    return data;
  }
}

class Submenu {
  int? id;
  String? title;
  int? rank;
  String? price;
  String? delPrice;
  String? discount;
  String? actualPrice;
  String? note;
  String? image;
  String? type;
  int? menuId;
  String? status;
  int? addedBy;
  int? isCustomizable;
  String? createdAt;
  String? updatedAt;
  String? stock;
  Null? specialNote;
  String? unit;
  int? sellerId;
  Null? menuType;
  Null? brand;
  Null? qty;
  Null? summary;
  Null? description;
  Null? stockStatus;
  Null? stockOpen;
  Null? stockClose;
  Null? stockTiming;
  MenuInfo? menuInfo;

  Submenu({this.id, this.title, this.rank, this.price, this.delPrice, this.discount, this.actualPrice, this.note, this.image,this.type, this.menuId, this.status, this.addedBy, this.isCustomizable, this.createdAt, this.updatedAt, this.stock, this.specialNote, this.unit, this.sellerId, this.menuType, this.brand, this.qty, this.summary, this.description, this.stockStatus, this.stockOpen, this.stockClose, this.stockTiming, this.menuInfo});

  Submenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rank = json['rank'];
    price = json['price'];
    delPrice = json['del_price'];
    discount = json['discount'];
    actualPrice = json['actual_price'];
    note = json['note'];
    image = json['image'];
    type = json['type'];
    menuId = json['menu_id'];
    status = json['status'];
    addedBy = json['added_by'];
    isCustomizable = json['is_customizable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stock = json['stock'];
    specialNote = json['special_note'];
    unit = json['unit'];
    sellerId = json['seller_id'];
    menuType = json['menu_type'];
    brand = json['brand'];
    qty = json['qty'];
    summary = json['summary'];
    description = json['description'];
    stockStatus = json['stock_status'];
    stockOpen = json['stock_open'];
    stockClose = json['stock_close'];
    stockTiming = json['stock_timing'];
    menuInfo = json['menu_info'] != null ? new MenuInfo.fromJson(json['menu_info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rank'] = this.rank;
    data['price'] = this.price;
    data['del_price'] = this.delPrice;
    data['discount'] = this.discount;
    data['actual_price'] = this.actualPrice;
    data['note'] = this.note;
    data['image'] = this.image;

    data['type'] = this.type;
    data['menu_id'] = this.menuId;
    data['status'] = this.status;
    data['added_by'] = this.addedBy;
    data['is_customizable'] = this.isCustomizable;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stock'] = this.stock;
    data['special_note'] = this.specialNote;
    data['unit'] = this.unit;
    data['seller_id'] = this.sellerId;
    data['menu_type'] = this.menuType;
    data['brand'] = this.brand;
    data['qty'] = this.qty;
    data['summary'] = this.summary;
    data['description'] = this.description;
    data['stock_status'] = this.stockStatus;
    data['stock_open'] = this.stockOpen;
    data['stock_close'] = this.stockClose;
    data['stock_timing'] = this.stockTiming;
    if (this.menuInfo != null) {
      data['menu_info'] = this.menuInfo!.toJson();
    }
    return data;
  }
}


class MenuInfo {
  int? id;
  String? title;
  int? rank;
  int? isFeatured;
  int? sellerId;
  String? status;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  String? discount;
  String? stock;
  Null? type;
  String? image;
  Null? tags;
  Null? offer;
  Null? col;
  Null? stockStatus;
  Null? stockOpen;
  Null? stockClose;
  Null? stockTiming;

  MenuInfo({this.id, this.title, this.rank, this.isFeatured, this.sellerId, this.status, this.addedBy, this.createdAt, this.updatedAt, this.discount, this.stock, this.type, this.image, this.tags, this.offer, this.col, this.stockStatus, this.stockOpen, this.stockClose, this.stockTiming});

  MenuInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rank = json['rank'];
    isFeatured = json['is_featured'];
    sellerId = json['seller_id'];
    status = json['status'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discount = json['discount'];
    stock = json['stock'];
    type = json['type'];
    image = json['image'];
    tags = json['tags'];
    offer = json['offer'];
    col = json['col'];
    stockStatus = json['stock_status'];
    stockOpen = json['stock_open'];
    stockClose = json['stock_close'];
    stockTiming = json['stock_timing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['rank'] = this.rank;
    data['is_featured'] = this.isFeatured;
    data['seller_id'] = this.sellerId;
    data['status'] = this.status;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['type'] = this.type;
    data['image'] = this.image;
    data['tags'] = this.tags;
    data['offer'] = this.offer;
    data['col'] = this.col;
    data['stock_status'] = this.stockStatus;
    data['stock_open'] = this.stockOpen;
    data['stock_close'] = this.stockClose;
    data['stock_timing'] = this.stockTiming;
    return data;
  }
}

class Address {
  int? id;
  int? userId;
  int? addressType;
  String? address;
  String? createdAt;
  String? updatedAt;
  Null? latitude;
  Null? longitude;
  String? landmark;
  String? streetAddress;
  Null? city;
  int? cityId;

  Address({this.id, this.userId, this.addressType, this.address, this.createdAt, this.updatedAt, this.latitude, this.longitude, this.landmark, this.streetAddress, this.city, this.cityId});

  Address.fromJson(Map<String, dynamic> json) {
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

class OrderRiderDetail {
  int? id;
  int? riderId;
  int? orderId;
  int? userId;
  String? point;
  String? deliveryPoint;
  String? createdAt;
  String? updatedAt;

  OrderRiderDetail({this.id, this.riderId, this.orderId, this.userId, this.point, this.deliveryPoint, this.createdAt, this.updatedAt});

  OrderRiderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    riderId = json['rider_id'];
    orderId = json['order_id'];
    userId = json['user_id'];
    point = json['point'];
    deliveryPoint = json['delivery_point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rider_id'] = this.riderId;
    data['order_id'] = this.orderId;
    data['user_id'] = this.userId;
    data['point'] = this.point;
    data['delivery_point'] = this.deliveryPoint;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RiderDetails {
  int? id;
  String? name;
  String? address;
  String? phone;
  Null? keyword;
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
  Null? sellerId;
  Null? managerId;
  int? riderId;
  Null? customerId;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  String? verified;
  Null? offerNote;
  Null? costPerPerson;
  Null? preprationTime;
  Null? offerImg;
  Null? column;
  Null? extraColumn;
  Null? offerNoteOne;
  Null? offerNoteTwo;
  Null? offerNoteThree;
  Null? offerNoteFour;
  Null? call;
  Null? serviceCharge;
  Null? packingCharge;
  String? customStoreStatus;

  RiderDetails({this.id, this.name, this.address, this.phone, this.keyword, this.rank, this.tags, this.storeStatus, this.note, this.locationLink, this.location, this.distance, this.discount, this.description, this.timing, this.openTime, this.closeTime, this.status, this.sellerId, this.managerId, this.riderId, this.customerId, this.addedBy, this.createdAt, this.updatedAt, this.verified, this.offerNote, this.costPerPerson, this.preprationTime, this.offerImg, this.column, this.extraColumn, this.offerNoteOne, this.offerNoteTwo, this.offerNoteThree, this.offerNoteFour, this.call, this.serviceCharge, this.packingCharge, this.customStoreStatus});

  RiderDetails.fromJson(Map<String, dynamic> json) {
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
