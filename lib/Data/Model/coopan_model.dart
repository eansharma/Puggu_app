class coopan_model {
  String? message;
  List<Data>? data;
  bool? success;

  coopan_model({this.message, this.data, this.success});

  coopan_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
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
