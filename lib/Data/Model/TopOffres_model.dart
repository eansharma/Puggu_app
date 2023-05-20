class Offer_model {
  String? message;
  String? offerBaseUrl;
  List<Data>? data;

  Offer_model({this.message, this.offerBaseUrl, this.data});

  Offer_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    offerBaseUrl = json['offer_base_url'];
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
    data['offer_base_url'] = this.offerBaseUrl;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? coupancode;
  double? amount;
  int? status;
  String? date;
  String? imgcoupan;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.coupancode,
      this.amount,
      this.status,
      this.date,
      this.imgcoupan,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coupancode = json['coupancode'];
    amount = json['amount'];
    status = json['status'];
    date = json['date'];
    imgcoupan = json['imgcoupan'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coupancode'] = this.coupancode;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['date'] = this.date;
    data['imgcoupan'] = this.imgcoupan;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
