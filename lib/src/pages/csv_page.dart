import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;



class CsvPage extends StatefulWidget {
  @override
  _CsvPageState createState() => _CsvPageState();
}

class _CsvPageState extends State<CsvPage> {
  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/res/Book1.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () async {
            await loadAsset();
            print(data);
          }),
      appBar: AppBar(
        title: Text("De csv a lista"),
      ),
      body: 
         Table(
          
          border: TableBorder.all(width: 5.0),
          children: data.map((item) {
            return TableRow(
                children: item.map((row) {
              return Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    row.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              );
            }).toList());
          }).toList(),
        ),
      
    );
  }
}