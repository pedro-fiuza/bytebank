// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransactionForm(),
      ),
    );
  }
}

class TransactionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Account Number',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Value',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Send'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('teste'),
      ),
    );
  }
}

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TransactionItem('teste1', 'fakedesc'),
          TransactionItem('teste2', 'fakedesc'),
          TransactionItem('teste3', 'fakedesc')
        ],
      ),
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('add'),
        child: Icon(Icons.add),
      ),
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
