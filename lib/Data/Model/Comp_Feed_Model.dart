class CompFeedModel {
  List<Data>? data;
  bool? status;
  String? message;

  CompFeedModel({this.data, this.status, this.message});

  CompFeedModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? name;
  String? phone;
  String? message;
  String? type;
  String? note;
  Null? column;
  Null? columnone;
  String? status;
  String? cityId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.phone,
      this.message,
      this.type,
      this.note,
      this.column,
      this.columnone,
      this.status,
      this.cityId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    message = json['message'];
    type = json['type'];
    note = json['note'];
    column = json['column'];
    columnone = json['columnone'];
    status = json['status'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['message'] = this.message;
    data['type'] = this.type;
    data['note'] = this.note;
    data['column'] = this.column;
    data['columnone'] = this.columnone;
    data['status'] = this.status;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
