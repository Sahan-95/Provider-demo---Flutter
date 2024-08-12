import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/number_list_provider.dart';
import 'package:provider_demo/second.dart';

class Home extends StatefulWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
        builder: (context, numbersList, child) => Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title),
              ),
              body: Column(
                children: [
                  Text(numbersList.numbers.last.toString()),
                  Expanded(
                    child: ListView.builder(
                        itemCount: numbersList.numbers.length,
                        itemBuilder: (context, index) {
                          return Text(numbersList.numbers[index].toString());
                        }),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const Second(title: "Second Screen")));
                      },
                      child: child)
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: numbersList.addNumbersToList,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ));
  }
}
