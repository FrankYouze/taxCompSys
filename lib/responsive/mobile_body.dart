import 'package:flutter/material.dart';
import 'package:responsivedashboard/components/my_button.dart';
import 'package:responsivedashboard/components/my_textfield.dart';
import 'package:responsivedashboard/constants.dart';
import 'package:responsivedashboard/util/my_box.dart';
import 'package:responsivedashboard/util/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
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
                  child: Container(color: Colors.white,),
                )
              ),
            ),

            // list of previous days
            Expanded(
              child:
              Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(color: Colors.white,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(children: [
                                  Text("REGISTER NEW CARD",style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.bold),),
                                   MyTextField(controller: TextEditingController(), myText: "enter full name", obscu:false),
                                    Text("REGISTER NEW CARD"),
                                   MyTextField(controller: TextEditingController(), myText: "enter phone number", obscu:false),
                                    Text("REGISTER NEW CARD"),
                                   MyTextField(controller: TextEditingController(), myText: "enter full name", obscu:false),
                                    Text("REGISTER NEW CARD"),
                                   MyTextField(controller: TextEditingController(), myText: "enter full name", obscu:false),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: MyButton(onTap: (){}, text: "REGISTER"),
                                  )
                       
                                ],),
                     ),
                    
                    ),),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Container(color: Colors.white,),
                    ),),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
