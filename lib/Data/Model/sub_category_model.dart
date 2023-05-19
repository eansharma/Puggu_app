class SubCategoryModel {
  SubCategoryModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final List<Data> data;
  
  SubCategoryModel.fromJson(Map<String, dynamic> json){
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
    required this.title,
    required this.rank,
    required this.price,
    required this.delPrice,
    required this.discount,
    required this.actualPrice,
     this.note,
     this.image,
    required this.tags,
    required this.type,
    required this.menuId,
    required this.status,
    required this.addedBy,
    required this.isCustomizable,
    required this.createdAt,
    required this.updatedAt,
    required this.stock,
     this.specialNote,
    required this.unit,
    required this.sellerId,
     this.menuType,
     this.brand,
     this.qty,
     this.summary,
     this.description,
     this.stockStatus,
     this.stockOpen,
     this.stockClose,
     this.stockTiming,
  });
  late final int id;
  late final String title;
  late final int rank;
  late final String price;
  late final String delPrice;
  late final String discount;
  late final String actualPrice;
  late final String? note;
  late final Null image;
  late final List<Null?> tags;
  late final String type;
  late final int menuId;
  late final String status;
  late final int addedBy;
  late final int isCustomizable;
  late final String createdAt;
  late final String updatedAt;
  late final String stock;
  late final Null specialNote;
  late final String unit;
  late final int sellerId;
  late final Null menuType;
  late final Null brand;
  late final Null qty;
  late final Null summary;
  late final Null description;
  late final Null stockStatus;
  late final Null stockOpen;
  late final Null stockClose;
  late final Null stockTiming;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    rank = json['rank'];
    price = json['price'];
    delPrice = json['del_price'];
    discount = json['discount'];
    actualPrice = json['actual_price'];
    note = null;
    image = null;
    tags = List.castFrom<dynamic, Null?>(json['tags']);
    type = json['type'];
    menuId = json['menu_id'];
    status = json['status'];
    addedBy = json['added_by'];
    isCustomizable = json['is_customizable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stock = json['stock'];
    specialNote = null;
    unit = json['unit'];
    sellerId = json['seller_id'];
    menuType = null;
    brand = null;
    qty = null;
    summary = null;
    description = null;
    stockStatus = null;
    stockOpen = null;
    stockClose = null;
    stockTiming = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['rank'] = rank;
    _data['price'] = price;
    _data['del_price'] = delPrice;
    _data['discount'] = discount;
    _data['actual_price'] = actualPrice;
    _data['note'] = note;
    _data['image'] = image;
    _data['tags'] = tags;
    _data['type'] = type;
    _data['menu_id'] = menuId;
    _data['status'] = status;
    _data['added_by'] = addedBy;
    _data['is_customizable'] = isCustomizable;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['stock'] = stock;
    _data['special_note'] = specialNote;
    _data['unit'] = unit;
    _data['seller_id'] = sellerId;
    _data['menu_type'] = menuType;
    _data['brand'] = brand;
    _data['qty'] = qty;
    _data['summary'] = summary;
    _data['description'] = description;
    _data['stock_status'] = stockStatus;
    _data['stock_open'] = stockOpen;
    _data['stock_close'] = stockClose;
    _data['stock_timing'] = stockTiming;
    return _data;
  }
}