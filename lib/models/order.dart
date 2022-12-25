class Ordermodel {
  final String? user;
  final String? carType;
  final String? fuelType;
  final String? litter;
  final String? address;
  final int? date;
  final int? time;
  final int? price;
  final String? payed;
  final bool? status;

  Ordermodel(
      {this.user,
      this.carType,
      this.fuelType,
      this.litter,
      this.address,
      this.date,
      this.time,
      this.price,
      this.payed,
      this.status});
  static Ordermodel fromJson(json) => Ordermodel(
        user: json['user'],
        carType: json['carType'],
        fuelType: json['fuelType'],
        litter: json['litter'],
        address: json['address'],
        date: json['date'],
        time: json['time'],
        price: json['pricel'],
        payed: json['payed'],
        status: json['status'],
      );
}
