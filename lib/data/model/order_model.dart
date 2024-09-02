class OrderModel{
  String? name;
  String? id;
  bool? isSelected;
  int? price;


  OrderModel({this.name,this.id,this.isSelected,this.price});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OrderModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              isSelected == other.isSelected && price == other.price;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isSelected.hashCode ^ price.hashCode;

}