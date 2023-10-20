import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.g.dart';

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _Header(),
            SizedBox(height: 15),
            _List(),
          ],
        ),
      ),
    );
  }
}

class _Header extends HookConsumerWidget {
  const _Header();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textControlRow = useTextEditingController();
    if (textControlRow.text.isEmpty) {
      textControlRow.text = '0';
    }
    final textControlColumn = useTextEditingController();
    if (textControlColumn.text.isEmpty) {
      textControlColumn.text = '0';
    }

    return Row(
      children: [
        SizedBox(
            width: 110,
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Please type in Row',
                label: Text('Row index:'),
                border: OutlineInputBorder(),
              ),
              controller: textControlRow,
            )),
        SizedBox(
            width: 110,
            child: TextField(
              decoration: const InputDecoration(
                label: Text('Column index:'),
                hintText: 'Please type in Column',
                border: OutlineInputBorder(),
              ),
              controller: textControlColumn,
            )),
        IconButton(
            onPressed: () {
              print('--------------- reduce button pressed ----------------');

              ref.read(dataListProvider.notifier).update(
                  int.parse(textControlRow.text),
                  int.parse(textControlColumn.text),
                  Action.reduce);
            },
            icon: const Icon(Icons.minimize)),
        IconButton(
            onPressed: () {
              print('--------------- add button pressed ----------------');
              ref.read(dataListProvider.notifier).update(
                  int.parse(textControlRow.text),
                  int.parse(textControlColumn.text),
                  Action.add);
            },
            icon: const Icon(Icons.add))
      ],
    );
  }
}

class _List extends ConsumerWidget {
  const _List();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<int>> dataList = ref.watch(dataListProvider);

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _ListRow(
            data: dataList[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        itemCount: dataList.length,
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  const _ListRow({required this.data});

  final List<int> data;

  @override
  Widget build(BuildContext context) {
    print('Rebuild row');
    return Row(
      children: [
        _ListCell(data: data[0]),
        _ListCell(data: data[1]),
        _ListCell(data: data[2]),
      ],
    );
  }
}

class _ListCell extends HookConsumerWidget {
  const _ListCell({required this.data});
  final int data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Rebuild cell');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(data.toString()),
    );
  }
}

@riverpod
class DataList extends _$DataList {
  @override
  List<List<int>> build() {
    return [
      for (var i = 0; i < 5; i++)
        [for (var j = 0; j < 3; j++) Random().nextInt(90) + 10]
    ];
  }

  void update(int row, int column, Action action) {
    state[row][column] =
        state[row][column] + (action == Action.reduce ? -1 : 1);
    state = state.toList();
  }
}

enum Action {
  add,
  reduce,
}
