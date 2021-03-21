import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sample/display.dart';
import 'package:sample/order.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final head = ["Item","Price","Quantity"];
  final list = ['Ice Cream', '100', '1'];
  final list1 = [Orders(item: "Ice Cream", price: "20",quantity: "1"),
  Orders(item: "Noodles",price: "10",quantity: "1",), Orders(item: "Cake", price: "200",quantity: "1"),
  ];
  final doc = pw.Document();
  String path="";

  buildpdf(){
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(32),
        build: (pw.Context context)=><pw.Widget>[
          pw.Header(
            child: pw.Text("Table"),
            level: 0,  
          ),
          pw.Table.fromTextArray(
            headers: List<String>.generate(
              head.length, 
              (index) => head[index]),
            data: List<List<String>>.generate(
              list1.length, 
              (row) => List<String>.generate(
                head.length, 
                (index) => list1[row].getIndex(index),
                )),
            ),
        ],
      ),
    );
  }

  Future savepdf()async{
    Directory dir = await getApplicationDocumentsDirectory();
    path = dir.path;
    File file = File("$path/example.pdf");
    file.writeAsBytesSync(doc.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF demo"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.picture_as_pdf),
        onPressed: ()async{
          buildpdf();
          await savepdf();
          Directory dir = await getApplicationDocumentsDirectory();
          path = dir.path;
          File file = File("$path/example.pdf");
          file.writeAsBytesSync(doc.save());
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DispPdf(file: file,)));
        },
      ),
    );
  }
}