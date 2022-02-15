// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransactionsList(),
      ),
    );
  }
}

class TransactionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm> {
  final TextEditingController _controllerAccountNumberField =
      TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              onPressed: () => _createTransaction(context),
            ),
          ],
        ),
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
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Succesfully'),
      //   ),
      // );
      Navigator.pop(context, createdTransaction);
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

class TransactionsListState extends State<TransactionsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transactions.length,
        itemBuilder: (context, i) {
          final transaction = widget._transactions[i];
          return TransactionItem(transaction);
        },
      ),
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transaction?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransactionForm(),
            ),
          );
          future.then((transaction) {
            if (transaction != null) {
              setState(() => widget._transactions.add(transaction));
              debugPrint(widget._transactions.toString());
            }
          });
        },
      ),
    );
  }
}

class TransactionsList extends StatefulWidget {
  final List<Transaction> _transactions = [];

  @override
  State<StatefulWidget> createState() => TransactionsListState();
}

class Transaction {
  final int accountNumber;
  final double value;

  Transaction(this.accountNumber, this.value);

  @override
  String toString() {
    return '$accountNumber, $value';
  }
}

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.local_hospital),
        title: Text(transaction.value.toString()),
        subtitle: Text(transaction.accountNumber.toString()),
      ),
    );
  }
}
