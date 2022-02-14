import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: TransactionsList(),
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('add'),
          child: Icon(Icons.add),
        ),
      ),
    ));

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionItem('teste1', 'fakedesc'),
        TransactionItem('teste2', 'fakedesc'),
        TransactionItem('teste3', 'fakedesc')
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String title;
  final String smallDescription;

  const TransactionItem(this.title, this.smallDescription);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.local_hospital),
        title: Text(title),
        subtitle: Text(smallDescription),
      ),
    );
  }
}
