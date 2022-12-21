import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';

class NewEventScreen extends StatefulWidget {
  const NewEventScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NewEventScreen();
}

class _NewEventScreen extends State<NewEventScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Event"),
        backgroundColor: Colors.indigo[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 380,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _textEditingController,
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 32),
                  prefixIcon: const Align(
                    widthFactor: 2.5,
                    child: Icon(
                      Icons.today_rounded,
                      color: Colors.white,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.indigo,
                  labelStyle: const TextStyle(color: Colors.white70),
                  labelText: (" Event"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(55)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Builder(builder: (context) {
              return Center(
                child: ElevatedButton(
                    onPressed: () {
                      String newEventText = _textEditingController.text;
                      Navigator.pop(context, newEventText);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      ),
                      minimumSize: Size(380, 55),
                      primary: Colors.white.withOpacity(0.5),
                      onPrimary: Colors.white,
                    ),
                    child: const Text("ADD")),
              );
            }),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurple[300],
    );
  }
}
