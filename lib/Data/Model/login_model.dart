class Login_Banner_Model {
  String? message;
  Data1? data;

  Login_Banner_Model({this.message, this.data});

  Login_Banner_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data1 {
  List<Login1>? login;

  Data1({this.login});

  Data1.fromJson(Map<String, dynamic> json) {
    if (json['login'] != null) {
      login = <Login1>[];
      json['login'].forEach((v) {
        login!.add(new Login1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.login != null) {
      data['login'] = this.login!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Login1 {
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

  Login1(
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
        this.bannerType,});

  Login1.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
