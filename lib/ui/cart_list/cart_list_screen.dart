import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../order_provider.dart';
class CartListScreen extends ConsumerStatefulWidget {
  const CartListScreen({super.key});

  @override
  ConsumerState<CartListScreen> createState() => _OrderListState();


}

class _OrderListState extends ConsumerState<CartListScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProductList = ref.watch(orderProviderProvider);
    // final grandTotal = ref.watch(grandTotalProvider);


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Cart List"),centerTitle: true,),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: cartProductList.map((e){
                  return Container(
                    color: Colors.yellow,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all( 10),
                    child: Expanded(
                      child: Row(
                        children: [

                          Text(
                            e!.name.toString(),

                          ),
                          const Spacer(),

                               Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Rs. ${e.price.toString()}'),
                              ),


                          GestureDetector(onTap:(){
                            ref.read(orderProviderProvider.notifier).remove(e);

                          },child: const Text("Remove",style: TextStyle(color: Colors.red)))
                          ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              Consumer(
        builder: (context,ref,child) {

      final price = ref.watch(grandTotalProvider);

      return Text("Grand Total is : $price");
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
