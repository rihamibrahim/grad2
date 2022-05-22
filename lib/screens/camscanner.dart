
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:zq/reusable/reuseable_component.dart';
import 'package:zq/screens/nativecode.dart';
import 'package:zq/screens/success.dart';

import 'failed.dart';

class CamScanner extends StatefulWidget {
  const CamScanner({Key? key}) : super(key: key);
  @override
  State<CamScanner> createState() => _CamScannerState();
}

class _CamScannerState extends State<CamScanner> {
  String? uid;
  Future getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      setState(() {
        userName = value.data()!['name'];
        userEmail = value.data()!['email'];
      });
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      await getData();
    });
    super.initState();
  }
  var qrstr = " ";
  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode(
          "#ff6666",
          "cancel",
          true,
          ScanMode.QR);
      if(!mounted){ Navigator.push(context,  MaterialPageRoute(builder: (context) => const NativeCode()));}
    } catch (e) {
      qrstr = 'failed to get plat form version.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 65,
          leading: const Icon(
            Icons.home,
            color: Color(0xff1C2D40),
          ),
          title: const Center(
              child: Text(
                'Attendity',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1C2D40),
                    fontSize: 25),
              )
            //Image.asset('assets/images/1.png', fit: BoxFit.cover),
          )),
      body: userName==null||userEmail==null?const Center(child: CircularProgressIndicator()):Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xff1C2D40),
                    child: Text(
                      '',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$userName",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$userEmail",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                'Hi !, \nWelcome to your class',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              //   Hero(tag: 'Attending', child: Image.asset('assets/images/2.png'),
              //  ),
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 55,
                  width: 240,
                  child: RaisedButton(
                    //  onPressed: (){},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        Text(
                          'Scan QR Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: const Color(0xff3D77BB),
                    onPressed: scanQr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}