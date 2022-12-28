class Homemodel {
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
  int? count;
  Homemodel(
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
      this.extraService,
      this.count});

  set isOpen(bool isOpen) {}
}
