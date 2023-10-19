import 'dart:core';
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
            _BackButton(),
            _Header(),
            SizedBox(height: 15),
            _List(),
          ],
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          print('--------------- back button pressed ----------------');
          Navigator.of(context).pop();
        },
        child: const Text('Back'));
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
    final listCount =
        ref.watch(dataListProvider.select((value) => value.length));

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _ListRow(
            row: index,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 5,
        ),
        itemCount: listCount,
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  const _ListRow({required this.row});
  final int row;
  @override
  Widget build(BuildContext context) {
    print('********* Rebuild row *********');
    return Row(
      children: [
        _ListCell(row: row, column: 0),
        _ListCell(row: row, column: 1),
        _ListCell(row: row, column: 2),
      ],
    );
  }
}

class _ListCell extends HookConsumerWidget {
  const _ListCell({required this.row, required this.column});
  final int row;
  final int column;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Rebuild cell');

    final data = ref.watch(getCellDataProvider(row, column));
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
int listCount(ListCountRef ref) {
  print('init listCount');
  ref.onDispose(() {
    print('listCount disposed');
  });
  return ref.watch(dataListProvider).length;
}

@riverpod
class GetCellData extends _$GetCellData {
  @override
  int build(int row, int column) {
    print('init getCellData');

    ref.onDispose(() {
      print('getCellData disposed');
    });
    final data =
        ref.watch(dataListProvider.select((value) => value[row][column]));
    return data;
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
