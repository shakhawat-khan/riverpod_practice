import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = Provider( (ref)=> 50);


class ProviderTest extends ConsumerWidget{
  const ProviderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),

      body: Center(
        child: Text('the value is ' + ref.watch(valueProvider).toString()),
      ),

    );
  }
}






