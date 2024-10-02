import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/number_list_provider.dart';

class Second extends StatefulWidget {
  final String title;
  const Second({super.key, required this.title});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, numbersProvider, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: Column(
                children: [
                  Text(numbersProvider.numbers.last.toString()),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: numbersProvider.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(
                              numbersProvider.numbers[index].toString());
                        }),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: numbersProvider.addNumbersToList,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ));
  }
}
