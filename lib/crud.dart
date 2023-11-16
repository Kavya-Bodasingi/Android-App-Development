
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DataModel {
  final int id;
  final String data;
DataModel({required this.id, required this.data});

factory DataModel.fromJson(Map<String, dynamic> json) {
return DataModel(id: json['id'], data: json['data']);
}
}

class DataOperations extends StatefulWidget {
@override
_DataOperationsState createState() => _DataOperationsState();
}

class _DataOperationsState extends State<DataOperations> {
final TextEditingController dataController = TextEditingController();
final String apiUrl = "http://your-api-url.com"; // Replace with your API URL

Future<List<DataModel>> fetchData() async {
final response = await http.get(Uri.parse('$apiUrl/read'));

if (response.statusCode == 200) {
List<dynamic> data = json.decode(response.body);
return data.map((json) => DataModel.fromJson(json)).toList();
} else {
throw Exception('Failed to load data');
}
}

Future<void> createData(String data) async {
await http.post(Uri.parse('$apiUrl/create'), body: {'data': data});
}

Future<void> updateData(int id, String newData) async {
await http.put(Uri.parse('$apiUrl/update/$id'), body: {'data': newData});
}

Future<void> deleteData(int id) async {
await http.delete(Uri.parse('$apiUrl/delete/$id'));
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Data Operations'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
TextField(
controller: dataController,
decoration: InputDecoration(labelText: 'Enter Data'),
),
SizedBox(height: 20),
ElevatedButton(
onPressed: () async {
await createData(dataController.text);
dataController.clear();
setState(() {});
},
child: Text('Create Data'),
),
FutureBuilder<List<DataModel>>(
future: fetchData(),
builder: (context, snapshot) {
if (snapshot.hasError) print(snapshot.error);
return snapshot.hasData
? Column(
children: snapshot.data!
    .map((data) => ListTile(
title: Text(data.data),
subtitle: Row(
children: <Widget>[
IconButton(
icon: Icon(Icons.edit),
onPressed: () async {
await updateData(data.id, 'Updated Data');
setState(() {});
},
),
IconButton(
icon: Icon(Icons.delete),
onPressed: () async {
await deleteData(data.id);
setState(() {});
},
),
],
),
))
    .toList(),
)
    : CircularProgressIndicator();
},
),
],
),
),
);
}
}
void main() => runApp(MaterialApp(home: DataOperations()));