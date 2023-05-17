class BannerModel {
  String? message;
  List<Data>? data;

  BannerModel({this.message, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
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
  String? image;
  int? rank;
  String? link;
  String? location;
  String? city;
  String? duration;
  String? status;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  int? cityId;
  String? bannerType;
  Null? column;
  Null? extraColumn;

  Data(
      {this.id,
      this.title,
      this.image,
      this.rank,
      this.link,
      this.location,
      this.city,
      this.duration,
      this.status,
      this.addedBy,
      this.createdAt,
      this.updatedAt,
      this.cityId,
      this.bannerType,
      this.column,
      this.extraColumn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    rank = json['rank'];
    link = json['link'];
    location = json['location'];
    city = json['city'];
    duration = json['duration'];
    status = json['status'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cityId = json['City_Id'];
    bannerType = json['banner_type'];
    column = json['column'];
    extraColumn = json['extra_column'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['rank'] = this.rank;
    data['link'] = this.link;
    data['location'] = this.location;
    data['city'] = this.city;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['City_Id'] = this.cityId;
    data['banner_type'] = this.bannerType;
    data['column'] = this.column;
    data['extra_column'] = this.extraColumn;
    return data;
  }
}