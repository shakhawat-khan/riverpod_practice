import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_isar_practice/model/poem_class.dart';

import '../services/api_services.dart';


final poemFutureProvider = FutureProvider.autoDispose<List<PoemClass>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getPoem();
}
);

class FutureProviderTest extends ConsumerWidget {
  const FutureProviderTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final poemRef = ref.watch(poemFutureProvider);



    return Scaffold(
      appBar: AppBar(
        title: Text('future provider'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            poemRef.when(
                data: (data){

                  return SingleChildScrollView(
                    child: Text(
                        data[0].lines.toString()
                    ),
                  );


                },
                error: (error,_){

                  return Text(error.toString()+'djlkd');

                },
                loading: (){
                  return CircularProgressIndicator();
                })
          ],
        ),
      )
    );
  }
}
