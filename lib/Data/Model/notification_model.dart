class NotificationModel {
  List<Data>? data;
  String? message;
  bool? success;

  NotificationModel({this.data, this.message, this.success});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? data;
  String? createdAt;

  Data({this.id, this.data, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['created_at'] = this.createdAt;
    return data;
  }
}
