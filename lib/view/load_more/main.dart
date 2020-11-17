import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lib_book/view/load_more/future/getData.dart';
import 'package:flutter_lib_book/view/load_more/model/list.dart';
import 'package:http/http.dart' as http;
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';

class LoadMorePage extends StatefulWidget {
  @override
  _LoadMorePageState createState() => _LoadMorePageState();
}

class _LoadMorePageState extends State<LoadMorePage> {
  List items;
  List data;
  String lastItemId = 'YNliXm_hMn8';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return _buildPaginatedListView();
  }

  Widget _buildPaginatedListView() {
    return Column(
      children: <Widget>[
        Expanded(
            child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoading &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              this.getJSONData();
              // start loading data
              setState(() {
                isLoading = true;
              });
            }
          },
          child: _buildListView(),
        )),
        Container(
          height: isLoading ? 50.0 : 0,
          color: Colors.white70,
          child: Center(
            child: new CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, index) {
        return _buildImageColumn(data[index]);
        // ListTile(title: Text("data"), subtitle: Text("likes: 1"),);
      },
    );
  }

  Widget _imagePlaceHolder() {
    return Container(
      height: 200,
      child: SizedBox(
        height: 600,
      ),
    );
  }

  Widget _buildImageColumn(item) => Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(item['user']['profile_image']['large']),
              ),
              title: Text(
                item['user']['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('@' + item['user']['username']),
              trailing: Icon(Icons.favorite_border),
            ),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    // call get json data function
    this.getJSONData();
  }

  Future<String> getJSONData() async {
    try {
      var url = "https://unsplash.com/napi/photos/" + lastItemId + "/related";

      // Await the http get response, then decode the json-formatted responce.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        setState(() {
          List newItems = jsonResponse['results'];
          if (data == null) {
            data = newItems;
          } else {
            data.addAll(newItems);
          }
          lastItemId = data.last['id'];
          isLoading = false;
        });
        print(data.toString());
        print(lastItemId);
        return "sucessful";
      } else {
        print("Request failed with status: ${response.statusCode}.");
      }
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
