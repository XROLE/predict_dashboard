class OrderModel {
  late String symbol;
  late String type;
  late String side;
  late double quantity;
  late int creationTime;
  late double price;

  OrderModel(
      {required this.symbol,
      required this.type,
      required this.side,
      required this.quantity,
      required this.creationTime,
      required this.price});

  OrderModel.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    type = json['type'];
    side = json['side'];
    quantity = json['quantity'];
    creationTime = json['creation_time'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['type'] = this.type;
    data['side'] = this.side;
    data['quantity'] = this.quantity;
    data['creation_time'] = this.creationTime;
    data['price'] = this.price;
    return data;
  }
}
