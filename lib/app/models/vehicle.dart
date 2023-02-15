class VehicleModel {
  int? consumption;
  int? yearService;
  String? modelName;
  int? price;
  String? image;

  VehicleModel(
      {this.consumption,
      this.yearService,
      this.modelName,
      this.price,
      this.image});

  VehicleModel.fromJson(Map<String, dynamic> json) {
    consumption = json['consumption'];
    yearService = json['year_service'];
    modelName = json['model_name'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['consumption'] = consumption;
    data['year_service'] = yearService;
    data['model_name'] = modelName;
    data['price'] = price;
    data['image'] = image;
    return data;
  }
}
