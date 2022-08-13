

import 'package:dream11_prank_app/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../firebase/firebase.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  TextEditingController name =TextEditingController();
  TextEditingController number =TextEditingController();
  TextEditingController id =TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: isLoading==true ? const Center(child: CircularProgressIndicator()): Padding(
        padding: const EdgeInsets.symmetric(vertical:16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField('Mobile Number',number,TextInputType.number,10),
            ElevatedButton(onPressed: (){
            if(number.text.isEmpty || number.text.length < 10){
               Fluttertoast.showToast(msg: 'Please enter valid number');
             }
             else{
               try{
                 setState(() {
                   isLoading =true;
                 });
                 createUser(number.text);
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                 setState(() {
                   isLoading =false;
                 });
               }catch(e){
                 Fluttertoast.showToast(msg: 'Failed');
                 setState(() {
                   isLoading =false;
                 });
               }
             }

            }, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Text('NEXT'),
            ))
          ],
        ),
      ),
    );
  }
}

Widget customTextField(String hint, TextEditingController controller,TextInputType type,int maxline){
  return Padding(
    padding: const
    EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: TextField(
      maxLength: maxline,
      controller: controller,
      keyboardType:type,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(hint),
      ),
    ),
  );

}
Widget customTextFieldNew(String hint, TextEditingController controller,TextInputType type){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: TextField(
      controller: controller,
      keyboardType:type,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(hint),
      ),
    ),
  );

}

