import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/order_model.dart';

List<OrderModel> list = [
  OrderModel(name: "banana",id:"21",isSelected: false),
  OrderModel(name: "apple",id:"22",isSelected: false),
  OrderModel(name: "orange",id:"23",isSelected: true),
  OrderModel(name: "mango",id:"24",isSelected: false),
  OrderModel(name: "Fruits1",id:"25",isSelected: false),
  OrderModel(name: "Fruits2",id:"26",isSelected: true),
  OrderModel(name: "Fruits3",id:"27",isSelected: false),
  OrderModel(name: "Fruits4",id:"28",isSelected: false)
];

final productListProvider = Provider((ref) => list);

final cartListProvider = Provider((ref) => list.where((element) => element.isSelected==true));



class OrderProvider extends Notifier<List<OrderModel>>{
  @override
  List<OrderModel> build() {
   return [
     OrderModel(name: "apple",id:"22",isSelected: false),
     OrderModel(name: "orange",id:"23",isSelected: true),

   ];
  }


  void addToCart(OrderModel orderModel){
    if(!state.contains(orderModel)) {
      state = [...state, orderModel];
    }

  }

  remove(OrderModel orderModel){
    state.remove(orderModel);
    state = [...state];

  }

}

final orderNotifierProvider = NotifierProvider<OrderProvider,List<OrderModel>>((){
  return OrderProvider();
});