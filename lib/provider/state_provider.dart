
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider.autoDispose<int>((ref) => 50);


class StateProviderTest extends ConsumerWidget{
  const StateProviderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.listen<int>(valueStateProvider, (previous, next) {
      if(previous==65){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Value is 65')
        )
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('state provider'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(valueStateProvider).toString()),
            ElevatedButton(onPressed: (){
              ref.read(valueStateProvider.notifier).state++;

            }, child: Text('press for increment')),

            ElevatedButton(onPressed: (){
              ref.invalidate(valueStateProvider);

            }, child: Text('press for reset')),
            
          ],
        ),
      ),

    );
  }
}
