import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/model/order_model.dart';
part 'order_provider.g.dart';

List<OrderModel> list = [
  OrderModel(name: "banana",id:"21",isSelected: false,price: 50),
  OrderModel(name: "apple",id:"22",isSelected: false,price: 120),
  OrderModel(name: "orange",id:"23",isSelected: true,price: 44),
  OrderModel(name: "mango",id:"24",isSelected: false,price:97),
  OrderModel(name: "Fruits1",id:"25",isSelected: false,price: 80),
  OrderModel(name: "Fruits2",id:"26",isSelected: true,price: 55),
  OrderModel(name: "Fruits3",id:"27",isSelected: false,price: 70),
  OrderModel(name: "Fruits4",id:"28",isSelected: false,price: 20)
];

final productListProvider = Provider((ref) => list);

final cartListProvider = Provider((ref) => list.where((element) => element.isSelected==true));


@riverpod
class OrderProvider extends _$OrderProvider{
  @override
  List<OrderModel> build() {
   return [
     // OrderModel(name: "apple",id:"22",isSelected: false),
     // OrderModel(name: "orange",id:"23",isSelected: true),

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

@riverpod
int grandTotal(ref){
  var orderProvider = ref.watch(orderProviderProvider);
  int total = 0;
  for(OrderModel orderModel in orderProvider){
    total += orderModel.price!;

  }
  return total;
}




// final orderNotifierProvider = NotifierProvider<OrderProvider,List<OrderModel>>((){
//   return OrderProvider();
// });