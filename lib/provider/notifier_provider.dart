import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends Notifier<int> {
  @override
  int build() {
    return 5;
  }

  void increment() {
    state++;
  }
}

final counterProvider = NotifierProvider<Counter, int>(Counter.new);


class CounterWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the provider and rebuild when the value changes
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('notifier provider'),
      ),

      body: Center(
        child: Column(
          children: [
            Text('Value: $counter'),

            ElevatedButton(
            // 2. use the value
            child: Text('increment'),
            // 3. change the state inside a button callback
            onPressed: () => ref.read(counterProvider.notifier).state++,
              ),
          ],
        ),
      ),

    );
  }
}