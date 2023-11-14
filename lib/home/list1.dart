import 'dart:convert';
import 'package:appproyecto2/home/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class List1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView with Navigation from SQL Server and API'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchDataFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Map<String, dynamic>> items = snapshot.data!;

            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]['name']),
                  subtitle: Text(items[index]['description']),
                  onTap: () {
                    // Navigate to a detail screen or perform other actions
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          item: items[index],
                          itemIndex: null,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> fetchDataFromApi() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3001/data'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
