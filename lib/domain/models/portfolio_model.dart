class PortfolioModel {
  late double balance;
  late double profit;
  late int profitPercentage;
  late int assets;

  PortfolioModel(
      {required this.balance, required this.profit, required this.profitPercentage, required this.assets});

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    profit = json['profit'];
    profitPercentage = json['profit_percentage'];
    assets = json['assets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['profit'] = this.profit;
    data['profit_percentage'] = this.profitPercentage;
    data['assets'] = this.assets;
    return data;
  }
}