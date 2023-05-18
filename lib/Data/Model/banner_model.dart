class Banner_model {
  String? message;
  Data? data;

  Banner_model({this.message, this.data});

  Banner_model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Genie>? genie;
  List<Mart>? mart;
  List<Restaurant>? restaurant;

  Data({this.genie, this.mart, this.restaurant});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['genie'] != null) {
      genie = <Genie>[];
      json['genie'].forEach((v) {
        genie!.add(new Genie.fromJson(v));
      });
    }
    if (json['mart'] != null) {
      mart = <Mart>[];
      json['mart'].forEach((v) {
        mart!.add(new Mart.fromJson(v));
      });
    }
    if (json['restaurant'] != null) {
      restaurant = <Restaurant>[];
      json['restaurant'].forEach((v) {
        restaurant!.add(new Restaurant.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.genie != null) {
      data['genie'] = this.genie!.map((v) => v.toJson()).toList();
    }
    if (this.mart != null) {
      data['mart'] = this.mart!.map((v) => v.toJson()).toList();
    }
    if (this.restaurant != null) {
      data['restaurant'] = this.restaurant!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genie {
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

  Genie(
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

  Genie.fromJson(Map<String, dynamic> json) {
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

class Mart {
  int? id;
  String? title;
  String? image;
  int? rank;
  Null? link;
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

  Mart(
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

  Mart.fromJson(Map<String, dynamic> json) {
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

class Restaurant {
  int? id;
  String? title;
  String? image;
  int? rank;
  Null? link;
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

  Restaurant(
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

  Restaurant.fromJson(Map<String, dynamic> json) {
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
