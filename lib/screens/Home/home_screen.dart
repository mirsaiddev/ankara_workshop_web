import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

String password = 'PASSWORD${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseDatabase.instance.databaseURL = 'https://ankara-workshop-default-rtdb.europe-west1.firebasedatabase.app/';
    print(password);
    return Scaffold(
      body: Center(
        child: StreamBuilder<DatabaseEvent>(
            stream: FirebaseDatabase.instance.ref().child('sessions').child('session').onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.snapshot.value == null) {
                  return QrImage(
                    data: password.hashCode.toString(),
                    version: QrVersions.auto,
                    size: 320,
                    gapless: false,
                  );
                } else {
                  print('snapshot.data.snapshot.value: ${snapshot.data!.snapshot.value}');
                  return Text('HOŞGELDİN ${snapshot.data!.snapshot.value}');
                }
              }
              return QrImage(
                data: password,
                version: QrVersions.auto,
                size: 320,
                gapless: false,
              );
            }),
      ),
    );
  }
}
