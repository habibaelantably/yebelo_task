class ProductDataModel
{
  late String name;
  late int id;

  late double cost;
  late String details;
  late int availability;
  late String category;

  ProductDataModel({
    required this.name,
    required this.id,
    required this.cost,
    required this.details,
    required this.availability,
    required this.category,
  });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    name=json['p_name'];
    id=json['p_id'];
    cost=json['p_cost'].toDouble();
    details=json['p_details'];
    availability=json['p_availability'];
    category=json['p_category'];
  }

  Map<String,dynamic> toMap()
  {
    return
      {
        "p_name":name,
        "p_id":id,
        "p_cost":cost,
        "p_availability":availability,
        "p_details":details,
        "p_category":category
      };
  }
}