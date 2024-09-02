import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cart_list/cart_list_screen.dart';
import '../order_provider.dart';
class OrderList extends ConsumerStatefulWidget {
  const OrderList({super.key});

  @override
  ConsumerState<OrderList> createState() => _OrderListState();


}

class _OrderListState extends ConsumerState<OrderList> {
  @override
  Widget build(BuildContext context) {
    final allProductList = ref.watch(productListProvider);
    final cartProductList = ref.watch(orderProviderProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
          centerTitle: true,
          actions: [
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartListScreen()));

              },
              child: Badge(label: cartProductList.isNotEmpty ? Text(cartProductList.length.toString()) : const SizedBox.shrink(),child: const Icon(Icons.shopping_cart),),)
        ],),
        body: ListView.builder(itemCount: allProductList.length,itemBuilder: (context,index){
         var productItem = allProductList[index];


         return Container(
            color: Colors.yellow,
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.all( 10),
            child: Row(
              children: [

                Text(
                  productItem.name.toString()

                ),
                const Spacer(),

                if(cartProductList.contains(productItem)) ...[
                  GestureDetector(onTap:(){
                    ref.read(orderProviderProvider.notifier).remove(allProductList[index]);

                  },child: const Text("Remove",style: TextStyle(color: Colors.red)))
                ],

                if(!cartProductList.contains(productItem))...[
                  GestureDetector(onTap:(){
                    ref.read(orderProviderProvider.notifier).addToCart(allProductList[index]);

                  },child: const Text("Add to cart",style: TextStyle(color: Colors.green),))
                ]
              ],
            ),
          );
        }),
      ),
    );
  }
}
