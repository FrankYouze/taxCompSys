import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsivedashboard/components/my_button.dart';
import 'package:responsivedashboard/components/my_textfield.dart';
import '../constants.dart';
import '../util/my_box.dart';
import '../util/my_tile.dart';

class DesktopScaffold extends StatelessWidget {
   DesktopScaffold({Key? key}) : super(key: key);

final DatabaseReference regCardRef = FirebaseDatabase.instance.ref().child("RegisterdCards");

        void registerCardToDB(String fullName,String cardId,String phoneNumb,String password)async {
  await regCardRef.child(cardId)
                         .set({
                            "fullName": fullName,
                           "phone": phoneNumb,
                           "pass": password,
                          });                 
          
}
void depositToCard(String cardId2,String amount)async {
  await regCardRef.child(cardId2)
                         .update({
                            "amount": amount,
                          });

}
  @override
Widget build(BuildContext context) {
final fullNameCon = TextEditingController();
final PhoneCon = TextEditingController();
final cardNumberCon = TextEditingController();
final PassCon = TextEditingController();
final amountCon = TextEditingController();
final cardId2Con = TextEditingController();
final amountCon2 = TextEditingController();


    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      appBar: myAppBar,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // open drawer
           Expanded(
            flex: 1,
            child:myDrawer ,),

            // first half of page
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  // first 4 boxes in grid
                  AspectRatio(
                    aspectRatio: 6,
                    child: SizedBox(
                      width: double.infinity,
                      child:Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                           decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                          //color: Colors.white,
                        height: 100,
                        ),
                      ),
                    ),
                  ),

                  // list of previous days
                  Expanded(
                   flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    //  child: Container(
                    //  color: Colors.white,
                     // height: double.infinity,  
                      child: Row(children: [

                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                             
                              height: double.infinity,
                              child: Column(children: [
                                Text("REGISTER NEW CARD",style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.bold),),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(controller: fullNameCon, myText: "enter full name", obscu: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(controller: PhoneCon, myText: "enter phone number", obscu: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(controller: cardNumberCon, myText: "enter card ID", obscu: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(controller: PassCon, myText: "enter password", obscu: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                             // child: MyTextField(controller: TextEditingController(), myText: "heheheh", obscu: true),
                             child: MyButton(onTap: (){
                    registerCardToDB(fullNameCon.text, cardNumberCon.text, PhoneCon.text, PassCon.text);
                             }, text: "REGISTER"),
                            ),
                                 
                            
                              ],),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              //color: Colors.white,
                                decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            
                              height: double.infinity,
                              child: Column(children: [
                             Text("DEPOSIT TO CARD",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
                                Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(controller: cardId2Con, myText: "Enter card ID", obscu: true),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyTextField(controller: amountCon, myText: "Enter amount", obscu: true),
                            ),
                               Padding(
                              padding: const EdgeInsets.all(8.0),
                             // child: MyTextField(controller: TextEditingController(), myText: "heheheh", obscu: true),
                             child: MyButton(onTap: (){

                             depositToCard(cardId2Con.text, amountCon.text);
                             }, text: "DEPOSIT"),
                            ),
                              

                              ],),
                            ),
                          ),
                        ),
                      ],),
                     // ),
                    )
                  ),
                ],
              ),
            ),
            // second half of page
            // Expanded(
            //   child: Column(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           height: 400,
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(8),
            //             color: Colors.grey[400],
            //           ),
            //         ),
            //       ),
            //       // list of stuff
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8),
            //               color: Colors.grey[200],
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
