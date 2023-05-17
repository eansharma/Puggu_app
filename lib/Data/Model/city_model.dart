class CityModeles {
  String? message;
  List<Data>? data;

  CityModeles({this.message, this.data});

  CityModeles.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? weatherCharge;
  String? weatherType;
  String? weatherMessage;
  String? createdAt;
  String? updatedAt;
  int? isWhetherCharge;
  String? image;
  String? rank;
  String? extraCol;
  Null status;
  String? govtTaxTitle;
  String? govtTaxCharge;
  String? govtTaxStatus;
  String? nightChargeTitle;
  String? nightCharge;
  String? nightChargeStatus;
  String? smallOrderTitle;
  String? smallOrderCharge;
  String? smallOrderAmount;
  String? smallOrderStatus;
  String? festivalChargeTitle;
  String? festivalCharge;
  String? festivalChargeStatus;

  Data(
      {this.id,
      this.name,
      this.weatherCharge,
      this.weatherType,
      this.weatherMessage,
      this.createdAt,
      this.updatedAt,
      this.isWhetherCharge,
      this.image,
      this.rank,
      this.extraCol,
      this.status,
      this.govtTaxTitle,
      this.govtTaxCharge,
      this.govtTaxStatus,
      this.nightChargeTitle,
      this.nightCharge,
      this.nightChargeStatus,
      this.smallOrderTitle,
      this.smallOrderCharge,
      this.smallOrderAmount,
      this.smallOrderStatus,
      this.festivalChargeTitle,
      this.festivalCharge,
      this.festivalChargeStatus});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weatherCharge = json['weather_charge'];
    weatherType = json['weather_type'];
    weatherMessage = json['weather_message'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isWhetherCharge = json['is_whether_charge'];
    image = json['image'];
    rank = json['rank'];
    extraCol = json['extra_col'];
    status = json['status'];
    govtTaxTitle = json['govt_tax_title'];
    govtTaxCharge = json['govt_tax_charge'];
    govtTaxStatus = json['govt_tax_status'];
    nightChargeTitle = json['night_charge_title'];
    nightCharge = json['night_charge'];
    nightChargeStatus = json['night_charge_status'];
    smallOrderTitle = json['small_order_title'];
    smallOrderCharge = json['small_order_charge'];
    smallOrderAmount = json['small_order_amount'];
    smallOrderStatus = json['small_order_status'];
    festivalChargeTitle = json['festival_charge_title'];
    festivalCharge = json['festival_charge'];
    festivalChargeStatus = json['festival_charge_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['weather_charge'] = this.weatherCharge;
    data['weather_type'] = this.weatherType;
    data['weather_message'] = this.weatherMessage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_whether_charge'] = this.isWhetherCharge;
    data['image'] = this.image;
    data['rank'] = this.rank;
    data['extra_col'] = this.extraCol;
    data['status'] = this.status;
    data['govt_tax_title'] = this.govtTaxTitle;
    data['govt_tax_charge'] = this.govtTaxCharge;
    data['govt_tax_status'] = this.govtTaxStatus;
    data['night_charge_title'] = this.nightChargeTitle;
    data['night_charge'] = this.nightCharge;
    data['night_charge_status'] = this.nightChargeStatus;
    data['small_order_title'] = this.smallOrderTitle;
    data['small_order_charge'] = this.smallOrderCharge;
    data['small_order_amount'] = this.smallOrderAmount;
    data['small_order_status'] = this.smallOrderStatus;
    data['festival_charge_title'] = this.festivalChargeTitle;
    data['festival_charge'] = this.festivalCharge;
    data['festival_charge_status'] = this.festivalChargeStatus;
    return data;
  }
}
