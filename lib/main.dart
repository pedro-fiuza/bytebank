import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transferencias'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('add'),
          child: Icon(Icons.add),
        ),
      ),
    ));
