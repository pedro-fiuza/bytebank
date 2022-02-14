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
  final TextEditingController _controllerAccountNumberField =
      TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Publisher(
            controller: _controllerAccountNumberField,
            title: 'Account Number',
            subtitle: '0000',
          ),
          Publisher(
            controller: _controllerValueField,
            title: 'Value',
            subtitle: '0.00',
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text('Send'),
            onPressed: () {
              _createTransaction(context);
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('teste'),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    final int? accountNumber = int.tryParse(_controllerAccountNumberField.text);
    final double? value = double.tryParse(_controllerValueField.text);
    if (accountNumber != null && value != null) {
      final createdTransaction = Transaction(accountNumber, value);
      debugPrint('$createdTransaction');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Succesfully'),
        ),
      );
    }
  }
}

class Publisher extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String? subtitle;
  final IconData? icon;

  Publisher({this.controller, this.title, this.subtitle, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: title,
          hintText: subtitle,
        ),
        keyboardType: TextInputType.number,
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

class Transaction {
  final int accountNumber;
  final double value;

  Transaction(this.accountNumber, this.value);
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
