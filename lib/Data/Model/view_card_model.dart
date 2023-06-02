class ViewCardModel {
  Cart? cart;
  BillSummary? billSummary;
  bool? status;
  String? message;

  ViewCardModel({this.cart, this.billSummary, this.status, this.message});

  ViewCardModel.fromJson(Map<String, dynamic> json) {
    cart = json['cart'] != null ? new Cart.fromJson(json['cart']) : null;
    billSummary = json['bill_summary'] != null ? new BillSummary.fromJson(json['bill_summary']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.toJson();
    }
    if (this.billSummary != null) {
      data['bill_summary'] = this.billSummary!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Cart {
  int? id;
  int? subtotal;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<CartItem>? cartItem;

  Cart({this.id, this.subtotal, this.userId, this.createdAt, this.updatedAt, this.cartItem});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subtotal = json['subtotal'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cart_item'] != null) {
      cartItem = <CartItem>[];
      json['cart_item'].forEach((v) { cartItem!.add(new CartItem.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subtotal'] = this.subtotal;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cartItem != null) {
      data['cart_item'] = this.cartItem!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItem {
  int? id;
  int? submenuId;
  int? price;
  int? qty;
  int? cartId;
  String? createdAt;
  String? updatedAt;
  String? specialRequirement;
  Submenu? submenu;
  List<CartItemAttribute>? cartItemAttribute;

  CartItem({this.id, this.submenuId, this.price, this.qty, this.cartId, this.createdAt, this.updatedAt, this.specialRequirement, this.submenu, this.cartItemAttribute});

  CartItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    submenuId = json['submenu_id'];
    price = json['price'];
    qty = json['qty'];
    cartId = json['cart_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    specialRequirement = json['special_requirement'];
    submenu = json['submenu'] != null ? new Submenu.fromJson(json['submenu']) : null;
    if (json['cart_item_attribute'] != null) {
      cartItemAttribute = <CartItemAttribute>[];
      json['cart_item_attribute'].forEach((v) { cartItemAttribute!.add(new CartItemAttribute.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['submenu_id'] = this.submenuId;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['cart_id'] = this.cartId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['special_requirement'] = this.specialRequirement;
    if (this.submenu != null) {
      data['submenu'] = this.submenu!.toJson();
    }
    if (this.cartItemAttribute != null) {
      data['cart_item_attribute'] = this.cartItemAttribute!.map((v) => v.toJson()).toList();
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
  // List<Null>? tags;
  String? type;
  int? menuId;
  String? status;
  int? addedBy;
  int? isCustomizable;
  String? createdAt;
  String? updatedAt;
  String? stock;
  String? specialNote;
  String? unit;
  int? sellerId;
  String? menuType;
  String? brand;
  String? qty;
  String? summary;
  String? description;
  String? stockStatus;
  String? stockOpen;
  String? stockClose;
  String? stockTiming;

  Submenu({this.id, this.title, this.rank, this.price, this.delPrice, this.discount, this.actualPrice, this.note, this.image, this.type, this.menuId, this.status, this.addedBy, this.isCustomizable, this.createdAt, this.updatedAt, this.stock, this.specialNote, this.unit, this.sellerId, this.menuType, this.brand, this.qty, this.summary, this.description, this.stockStatus, this.stockOpen, this.stockClose, this.stockTiming});

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
    // if (json['tags'] != null) {
    // 	tags = <Null>[];
    // 	json['tags'].forEach((v) { tags!.add(new Null.fromJson(v)); });
    // }
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
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
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
    return data;
  }
}

// class Tags {


// 	Tags({});

// 	Tags.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

class CartItemAttribute {
  int? id;
  String? name;
  int? cartItemId;
  String? createdAt;
  String? updatedAt;

  CartItemAttribute({this.id, this.name, this.cartItemId, this.createdAt, this.updatedAt});

  CartItemAttribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cartItemId = json['cart_item_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cart_item_id'] = this.cartItemId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BillSummary {
  int? id;
  String? title;
  String? min;
  String? max;
  String? charge;
  String? km;
  String? city;
  String? message;
  String? note;
  String? extra;
  String? status;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  CityData? cityData;

  BillSummary({this.id, this.title, this.min, this.max, this.charge, this.km, this.city, this.message, this.note, this.extra, this.status, this.addedBy, this.createdAt, this.updatedAt, this.cityData});

  BillSummary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    min = json['min'];
    max = json['max'];
    charge = json['charge'];
    km = json['km'];
    city = json['city'];
    message = json['message'];
    note = json['note'];
    extra = json['extra'];
    status = json['status'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityData = json['city_data'] != null ? new CityData.fromJson(json['city_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['min'] = this.min;
    data['max'] = this.max;
    data['charge'] = this.charge;
    data['km'] = this.km;
    data['city'] = this.city;
    data['message'] = this.message;
    data['note'] = this.note;
    data['extra'] = this.extra;
    data['status'] = this.status;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cityData != null) {
      data['city_data'] = this.cityData!.toJson();
    }
    return data;
  }
}

class CityData {
  int? id;
  String? name;
  String? weatherCharge;
  String? weatherType;
  String? weatherMessage;
  String? createdAt;
  String? updatedAt;
  int? isWhetherCharge;
  String? image;
  String? rank;
  String? extraCol;
  String? status;
  String? govtTaxTitle;
  String? govtTaxCharge;
  String? govtTaxStatus;
  String? nightChargeTitle;
  String? nightCharge;
  String? nightChargeStatus;
  String? smallOrderTitle;
  String? smallOrderCharge;
  String? smallOrderAmount;
  String? smallOrderStatus;
  String? festivalChargeTitle;
  String? festivalCharge;
  String? festivalChargeStatus;

  CityData({this.id, this.name, this.weatherCharge, this.weatherType, this.weatherMessage, this.createdAt, this.updatedAt, this.isWhetherCharge, this.image, this.rank, this.extraCol, this.status, this.govtTaxTitle, this.govtTaxCharge, this.govtTaxStatus, this.nightChargeTitle, this.nightCharge, this.nightChargeStatus, this.smallOrderTitle, this.smallOrderCharge, this.smallOrderAmount, this.smallOrderStatus, this.festivalChargeTitle, this.festivalCharge, this.festivalChargeStatus});

  CityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weatherCharge = json['weather_charge'];
    weatherType = json['weather_type'];
    weatherMessage = json['weather_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isWhetherCharge = json['is_whether_charge'];
    image = json['image'];
    rank = json['rank'];
    extraCol = json['extra_col'];
    status = json['status'];
    govtTaxTitle = json['govt_tax_title'];
    govtTaxCharge = json['govt_tax_charge'];
    govtTaxStatus = json['govt_tax_status'];
    nightChargeTitle = json['night_charge_title'];
    nightCharge = json['night_charge'];
    nightChargeStatus = json['night_charge_status'];
    smallOrderTitle = json['small_order_title'];
    smallOrderCharge = json['small_order_charge'];
    smallOrderAmount = json['small_order_amount'];
    smallOrderStatus = json['small_order_status'];
    festivalChargeTitle = json['festival_charge_title'];
    festivalCharge = json['festival_charge'];
    festivalChargeStatus = json['festival_charge_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['weather_charge'] = this.weatherCharge;
    data['weather_type'] = this.weatherType;
    data['weather_message'] = this.weatherMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_whether_charge'] = this.isWhetherCharge;
    data['image'] = this.image;
    data['rank'] = this.rank;
    data['extra_col'] = this.extraCol;
    data['status'] = this.status;
    data['govt_tax_title'] = this.govtTaxTitle;
    data['govt_tax_charge'] = this.govtTaxCharge;
    data['govt_tax_status'] = this.govtTaxStatus;
    data['night_charge_title'] = this.nightChargeTitle;
    data['night_charge'] = this.nightCharge;
    data['night_charge_status'] = this.nightChargeStatus;
    data['small_order_title'] = this.smallOrderTitle;
    data['small_order_charge'] = this.smallOrderCharge;
    data['small_order_amount'] = this.smallOrderAmount;
    data['small_order_status'] = this.smallOrderStatus;
    data['festival_charge_title'] = this.festivalChargeTitle;
    data['festival_charge'] = this.festivalCharge;
    data['festival_charge_status'] = this.festivalChargeStatus;
    return data;
  }
}
