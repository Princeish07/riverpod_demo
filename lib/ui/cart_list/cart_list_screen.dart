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
    final cartProductList = ref.watch(orderNotifierProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Cart List"),centerTitle: true,),
        body: SingleChildScrollView(
          child: Column(
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

                      GestureDetector(onTap:(){
                        ref.read(orderNotifierProvider.notifier).remove(e);

                      },child: const Text("Remove",style: TextStyle(color: Colors.red)))
                      ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
