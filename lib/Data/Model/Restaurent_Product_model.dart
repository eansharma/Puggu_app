class Restaurent_product_model {
  bool? success;
  String? message;
  List<Data>? data;

  Restaurent_product_model({this.success, this.message, this.data});

  Restaurent_product_model.fromJson(Map<String, dynamic> json) {
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
  String? offer;
  Null? col;
  Null? stockStatus;
  String? stockOpen;
  String? stockClose;
  Null? stockTiming;
  int? submenuCount;
  List<Submenus>? submenus;

  Data(
      {this.id,
      this.title,
      this.rank,
      this.isFeatured,
      this.sellerId,
      this.status,
      this.addedBy,
      this.createdAt,
      this.updatedAt,
      this.discount,
      this.stock,
      this.type,
      this.image,
      this.tags,
      this.offer,
      this.col,
      this.stockStatus,
      this.stockOpen,
      this.stockClose,
      this.stockTiming,
      this.submenuCount,
      this.submenus});

  Data.fromJson(Map<String, dynamic> json) {
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
    submenuCount = json['submenu_count'];
    if (json['submenus'] != null) {
      submenus = <Submenus>[];
      json['submenus'].forEach((v) {
        submenus!.add(new Submenus.fromJson(v));
      });
    }
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
    data['submenu_count'] = this.submenuCount;
    if (this.submenus != null) {
      data['submenus'] = this.submenus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Submenus {
  int? id;
  String? title;
  int? rank;
  String? price;
  String? delPrice;
  String? discount;
  String? actualPrice;
  String? note;
  String? image;
  List<Null>? tags;
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
  Null? menuType;
  Null? brand;
  Null? qty;
  Null? summary;
  Null? description;
  Null? stockStatus;
  Null? stockOpen;
  Null? stockClose;
  Null? stockTiming;
   bool? isInCart;
  List<Attributes>? attributes;

  Submenus(
      {this.id,
      this.title,
      this.rank,
      this.price,
      this.delPrice,
      this.discount,
      this.actualPrice,
      this.note,
      this.image,
      this.tags,
      this.type,
      this.menuId,
      this.status,
      this.addedBy,
      this.isCustomizable,
      this.createdAt,
      this.updatedAt,
      this.stock,
      this.specialNote,
      this.unit,
      this.sellerId,
      this.menuType,
      this.brand,
      this.qty,
      this.summary,
      this.description,
      this.stockStatus,
      this.stockOpen,
      this.stockClose,
      this.stockTiming,
      this.attributes,
      this.isInCart});

  Submenus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    rank = json['rank'];
    price = json['price'];
    delPrice = json['del_price'];
    discount = json['discount'];
    actualPrice = json['actual_price'];
    note = json['note'];
    image = json['image'];
    if (json['tags'] != null) {
      tags = <Null>[];
      // json['tags'].forEach((v) { tags!.add(new Null.fromJson(v)); });
    }
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
    isInCart = json['isInCart'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(new Attributes.fromJson(v));
      });
    }
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
    if (this.tags != null) {
      // data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
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
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  // Tags({});

  Tags.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

class Attributes {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? groupId;
  String? title;
  String? slug;
  String? status;
  Pivot? pivot;

  Attributes(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.groupId,
      this.title,
      this.slug,
      this.status,
      this.pivot});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    groupId = json['group_id'];
    title = json['title'];
    slug = json['slug'];
    status = json['status'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['group_id'] = this.groupId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['status'] = this.status;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? submenuId;
  int? attributeId;
  String? price;
  String? rank;
  String? defaultSelect;
  String? multiSelect;

  Pivot(
      {this.submenuId,
      this.attributeId,
      this.price,
      this.rank,
      this.defaultSelect,
      this.multiSelect});

  Pivot.fromJson(Map<String, dynamic> json) {
    submenuId = json['submenu_id'];
    attributeId = json['attribute_id'];
    price = json['price'];
    rank = json['rank'];
    defaultSelect = json['default_select'];
    multiSelect = json['multi_select'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['submenu_id'] = this.submenuId;
    data['attribute_id'] = this.attributeId;
    data['price'] = this.price;
    data['rank'] = this.rank;
    data['default_select'] = this.defaultSelect;
    data['multi_select'] = this.multiSelect;
    return data;
  }
}
