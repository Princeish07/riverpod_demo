class OrderModel{
  String? name;
  String? id;
  bool? isSelected;

  OrderModel({this.name,this.id,this.isSelected});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OrderModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              isSelected == other.isSelected;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ isSelected.hashCode;

}