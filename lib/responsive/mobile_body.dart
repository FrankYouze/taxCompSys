import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:responsivedashboard/components/my_button.dart';
import 'package:responsivedashboard/components/my_textfield.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/my_box.dart';
import 'package:responsivedashboard/util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final DatabaseReference regCardRef =
      FirebaseDatabase.instance.ref().child("RegisterdCards");
        final DatabaseReference sellerReceptRef = FirebaseDatabase.instance
      .ref()
      .child("RegisteredSellers")
      .child("Seller01")
      .child('Recepts');
  final DatabaseReference sellerRef = FirebaseDatabase.instance
      .ref()
      .child("RegisteredSellers")
      .child("Seller01")
      .child('RFID_UIDs');
  String ReadRFIDAmount = '';
  double Cost = 0.0;
  Map<dynamic, dynamic> ReadRFIDs = {};
  Map<dynamic, dynamic> RegisteredRFIDs = {};
 




  @override
  Widget build(BuildContext context) {
final p1 = TextEditingController();
final p2 = TextEditingController();
final p3 = TextEditingController();
final p4 = TextEditingController();
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // first 4 boxes in grid
            AspectRatio(
              aspectRatio: 4,
              child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      color: Colors.white,
                      child: Center(child:  Text(
                            "SELLER 01",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),),
                    ),
                  )),
            ),

            // list of previous days
            Expanded(
                child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "PAYMENT FORM",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          MyTextField(
                              controller: p1,
                              myText: "enter price 1",
                              obscu: false),
                          //   Text("REGISTER NEW CARD"),
                          MyTextField(
                              controller: p2,
                              myText: "enter price2",
                              obscu: false),
                          //  Text("REGISTER NEW CARD"),
                          MyTextField(
                              controller: p3,
                              myText: "enter price4",
                              obscu: false),
                          // Text("REGISTER NEW CARD"),
                          MyTextField(
                              controller: p4,
                              myText: "enter price5",
                              obscu: false),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MyButton(
                                onTap: () async {
                                 setState(() {
                                   Cost = double.parse(p1.text.isEmpty? "0.0" : p1.text) + double.parse(p2.text.isEmpty? "0.0" : p2.text) + double.parse(p3.text.isEmpty? "0.0": p3.text ) + double.parse(p4.text.isEmpty? "0.0":p4.text);
                                 });
                                  
                                  await regCardRef
                                      .once()
                                      .then((DatabaseEvent event) {
                                    DataSnapshot snapshot = event.snapshot;
                                    setState(() {
                                      RegisteredRFIDs = snapshot.value
                                          as Map<dynamic, dynamic>;
                                      // RegisteredRFIDs.forEach(
                                      //   (key, value) {
                                      //     //print(key);
                                      //   },
                                      // );
                                      // print(ReadRFIDs.keys);
                                    });
                                  });

                                  await sellerRef
                                      .once()
                                      .then((DatabaseEvent event) {
                                    DataSnapshot snapshot = event.snapshot;
                                    setState(() {
                                      ReadRFIDs = snapshot.value
                                          as Map<dynamic, dynamic>;
                                      ReadRFIDs.forEach(
                                        (key, value) {
                                          if (RegisteredRFIDs.containsKey(
                                              value)) {
                                            ReadRFIDAmount= RegisteredRFIDs[value]
                                                    ['amount']
                                                .toString();
                                                double amount = double.parse(ReadRFIDAmount);
                                                double balance = amount - Cost;
                                                regCardRef.child(value).child("amount").set(balance);
                                                //sellerReceptRef.set("umepokea");
                                                  sellerReceptRef.set("umepokea kiasi cha ${Cost} kutoka kwa ${RegisteredRFIDs[value]["fullName"]} kama makato jumla ya ${p1.text},${p2.text},${p3.text},${p4.text},muamala ${DateTime.now().microsecondsSinceEpoch}");
                                                  regCardRef.child(value).child("receipt").set("Kiasi cha ${Cost} kimekatwa kwenda kwa Seller01, muamala ${DateTime.now().microsecondsSinceEpoch}");
                                                print(regCardRef.child(value).key);
                                          }
                                        },
                                      );
                                      // print(ReadRFIDs.keys);
                                    });
                                  });
                                },
                                text: "PAY"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      color: Colors.white,
                      child: Text("Please scan your payment card first before conducting the payment"),
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
