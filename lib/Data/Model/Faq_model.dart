class FAQ_Model {
  String? message;
  List<Data>? data;

  FAQ_Model({this.message, this.data});

  FAQ_Model.fromJson(Map<String, dynamic> json) {
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
  String? question;
  String? title;
  String? answer;
  int? rank;
  String? status;
  int? addedBy;
  String? createdAt;
  String? updatedAt;
  String? role;
  String? featured;
  Null? col;

  Data(
      {this.id,
      this.question,
      this.title,
      this.answer,
      this.rank,
      this.status,
      this.addedBy,
      this.createdAt,
      this.updatedAt,
      this.role,
      this.featured,
      this.col});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    title = json['title'];
    answer = json['answer'];
    rank = json['rank'];
    status = json['status'];
    addedBy = json['added_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
    featured = json['featured'];
    col = json['col'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['title'] = this.title;
    data['answer'] = this.answer;
    data['rank'] = this.rank;
    data['status'] = this.status;
    data['added_by'] = this.addedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role'] = this.role;
    data['featured'] = this.featured;
    data['col'] = this.col;
    return data;
  }
}
