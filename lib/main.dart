//import 'dart:ffi';
import 'package:flutter/material.dart';
//import 'dart:async';
//import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:http_example/post.dart';

void main() {
  runApp( MyApp());
}

Future<String> fetchData(String api_name) async {
    //return 'Andriod';
    
    String url = 'http://54.252.234.237:8080/$api_name'; 
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error accessing backend: $e');
    }
    
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stacked Layers UI'),
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 75,
                left: 75,
                child: Layer1(),
              ),
              Positioned(
                top: 125,
                left: 100,
                child: Layer2(),
              ),
              Positioned(
                top: 175,
                left: 125,
                child: Layer3(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Layer1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FutureBuilder<String>(
            future: fetchData(''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 如果Future還在加載中，顯示一個Loading文本
                return Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              } else {
                // 如果Future已經完成，顯示返回的文字
                return Positioned(
                  top: 10,
                  child: Text(
                    snapshot.data ?? '', // 防止獲取到的文字為null
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Layer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.green,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FutureBuilder<String>(
            future: fetchData('name'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 如果Future還在加載中，顯示一個Loading文本
                return Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              } else {
                // 如果Future已經完成，顯示返回的文字
                return Positioned(
                  top: 10,
                  child: Text(
                    snapshot.data ?? '', // 防止獲取到的文字為null
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Layer3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.orange,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          FutureBuilder<String>(
            future: fetchData('gender'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 如果Future還在加載中，顯示一個Loading文本
                return Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              } else {
                // 如果Future已經完成，顯示返回的文字
                return Positioned(
                  top: 10,
                  child: Text(
                    snapshot.data ?? '', // 防止獲取到的文字為null
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
/** 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  Future<String> fetchData() async {
    return 'Andriod';
    /** 
    String url = 'http://172.31.11.84:8080/'; 
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error accessing backend: $e');
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(), 
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // 正在加載資料時顯示進度指示器
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // 顯示錯誤訊息
            } else {
              return Text('Data from Spring Boot: ${snapshot.data}'); // 顯示從伺服器獲取的資料
            }
          },
        ),
      ),
    );
  }
}
*/