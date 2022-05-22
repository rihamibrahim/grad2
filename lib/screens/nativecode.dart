import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zq/screens/success.dart';

import 'failed.dart';

class NativeCode extends StatefulWidget {
  const NativeCode({Key? key}) : super(key: key);

  @override
  State<NativeCode> createState() => _NativeCodeState();
}

class _NativeCodeState extends State<NativeCode> {
  static const studentChannel = MethodChannel('student');
  String _data='Waiting';
  Future<void> _getdata() async {
    String data;
    try {
      final int result = await studentChannel.invokeMethod('getdata');
      data = 'data at $result .';
      Navigator.push(context,  MaterialPageRoute(builder: (context) => const Success()));
    } on PlatformException catch (e)
    {
      data = "Failed to get data: '${e.message}'.";
      Navigator.push(context,  MaterialPageRoute(builder: (context) => const UnSuccess()));
    }

    setState(() {
      _data = data;
    });
  }

  @override
  void initState()  {
    _getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Waiting...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Container(
              width: 200,
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                child:  Text(
                  _data,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onPressed: _getdata,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
