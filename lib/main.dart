import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Card(
                child: ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('Teste'),
            )),
            Card(
                child: ListTile(
              leading: Icon(Icons.local_hospital),
              title: Text('teste2'),
            )),
          ],
        ),
        appBar: AppBar(
          title: Text('Transferencias'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print('add'),
          child: Icon(Icons.add),
        ),
      ),
    ));
