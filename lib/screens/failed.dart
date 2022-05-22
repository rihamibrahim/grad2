import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zq/reusable/reuseable_component.dart';
import 'camscanner.dart';

class UnSuccess extends StatefulWidget {
  const UnSuccess({Key? key}) : super(key: key);

  @override
  State<UnSuccess> createState() => _UnSuccessState();
}

class _UnSuccessState extends State<UnSuccess> {

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
                'Attending',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1C2D40),
                    fontSize: 25),
              )
            //Image.asset('assets/images/1.png', fit: BoxFit.cover),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  <Widget>[
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xff1C2D40),
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
                height: 90.0,
              ),
              Center(
                child: Container(
                    width: 300,
                    height: 230,
                    //  padding: new EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 20),
                              child: const Text(
                                'Error !',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3D77BB)),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Some thing went wrong ,\n       Please try again',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3D77BB)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(height: 30,),
                          SizedBox(
                            width: 100,
                            height: 41,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xff3D77BB),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const CamScanner()));
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );

  }
}