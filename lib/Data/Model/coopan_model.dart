class CouponModel {
  String? message;
  List<CouponData>? data;
  bool? success;

  CouponModel({this.message, this.data, this.success});

  CouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <CouponData>[];
      json['data'].forEach((v) {
        data!.add(CouponData.fromJson(v));
      });
    }
    success = json['success'];
  }
}

class CouponData {
  int? id;
  String? couponCode;
  double? amount;
  int? status;
  String? date;
  String? imageCoupon;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  CouponData({
    this.id,
    this.couponCode,
    this.amount,
    this.status,
    this.date,
    this.imageCoupon,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  CouponData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['coupancode'];
    amount = json['amount']?.toDouble();
    status = json['status'];
    date = json['date'];
    imageCoupon = json['imgcoupan'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
