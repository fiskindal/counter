import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => Counter(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Column(
            children: [
              Consumer<Counter>(
                builder: ((context, value, child) =>
                    Text(value.count.toString())),
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<Counter>(context, listen: false).decrement();
                  },
                  child: const Text('decrement')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.read<Counter>().increment(),
        ),
      ),
    );
  }
}

class Counter extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
