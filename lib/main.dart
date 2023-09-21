import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff00ff89),
        appBar: AppBar(
          title: Text('AriApp'),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: SafeArea(
          child: Container(
            height: 400.0,
            width: 400.0,
            margin: EdgeInsets.symmetric(vertical: 30, horizontal: 8),
            padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
            color: Colors.white, // Background color for the container
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Color(0xffd8ffaa),
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/profile.jpg'),
                          radius: 50,
                        ),
                      ),
                    ),
                    Container(
                      child: Text('Evan',
                          style: TextStyle(fontSize: 30, fontFamily: 'Roboto')),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  color: Color(0xffd8ffaa),
                  child: Image(
                    image: AssetImage('images/toronto.jpg'),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    Text('+1 514 142 1222'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    Text('evan@gmail.com'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
