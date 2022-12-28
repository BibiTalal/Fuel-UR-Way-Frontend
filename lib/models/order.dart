class Ordermodel {
  int? id;
  String? user;
  String? carType;
  String? fuelType;
  int? litter;
  String? address;
  String? date;
  String? time;
  int? price;
  String? payed;
  bool? status;
  String? extraService;

  Ordermodel(
      {this.id,
      this.user,
      this.carType,
      this.fuelType,
      this.litter,
      this.address,
      this.date,
      this.time,
      this.price,
      this.payed,
      this.status,
      this.extraService});

  Ordermodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    carType = json['carType'];
    fuelType = json['fuelType'];
    litter = json['litter'];
    address = json['address'];
    date = json['date'];
    time = json['time'];
    price = json['price'];
    payed = json['payed'];
    status = json['status'];
    extraService = json['extraService'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['carType'] = this.carType;
    data['fuelType'] = this.fuelType;
    data['litter'] = this.litter;
    data['address'] = this.address;
    data['date'] = this.date;
    data['time'] = this.time;
    data['price'] = this.price;
    data['payed'] = this.payed;
    data['status'] = this.status;
    data['extraService'] = this.extraService;
    return data;
  }
}
