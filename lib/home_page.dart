import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/bloc/counter_bloc.dart';

// part 'widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterBloc, CounterStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Тестовое задание: Счетчик'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${blocProvider.index}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    tooltip: 'Добавить 2',
                    backgroundColor: Colors.blueAccent,
                    onPressed: () {
                      blocProvider.add(AddTwo());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '+',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '2',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    tooltip: 'Отнять 1',
                    backgroundColor: Colors.red,
                    onPressed: () {
                      blocProvider.add(ReduceOne());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '-',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          '1',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.lightGreen,
            onPressed: () {
              blocProvider.add(ClearAll());
            },
            label: Row(
              children: const [
                Text(
                  'Очистить счетчик',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.delete,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
