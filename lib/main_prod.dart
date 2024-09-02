import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'global.dart';
void main() {
  Global.BaseUrl = "Hello from prod";
  print(Global.BaseUrl);

  runApp(ProviderScope(child:MaterialApp(home:  Container(child: Text(Global.BaseUrl),)),));
}