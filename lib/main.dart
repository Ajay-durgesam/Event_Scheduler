import 'package:event_scheduler/new_event.dart';
import 'package:flutter/material.dart';
import 'dart:ffi';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<Widget> _list = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Event Scheduler"),
        backgroundColor: Colors.indigo[700],
      ),
      body:SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap:true,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 370,
                        child: Card(
                          child: InkWell(
                            splashColor: Colors.indigo.withAlpha(30),
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                              child: Align(

                                alignment: Alignment.center,
                                child: _list[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          ],
        ),
      ) ,



      backgroundColor: Colors.deepPurple[300],
      floatingActionButton: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () async {
            String newText = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewEventScreen()));
            setState(() {
              _list.add(
                  Text(
                  newText,
                style: const TextStyle(fontSize: 18,),
              ));
            });
          },
          backgroundColor: Colors.indigo,
          child: const Icon(Icons.add),
        );
      }),
    ));
  }
}
