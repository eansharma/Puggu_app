class CatagoryModel {
  String? message;
  List<Data>? data;

  CatagoryModel({this.message, this.data});

  CatagoryModel.fromJson(Map<String, dynamic> json) {
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
  Null? stockOpen;
  Null? stockClose;
  Null? stockTiming;

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
      this.stockTiming});

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