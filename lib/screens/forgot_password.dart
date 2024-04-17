import 'package:flutter/material.dart';

import '../constants.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  late List<Widget> columnData = [];
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    initList(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [SizedBox(
            height: MediaQuery.of(context).size.height - 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: columnData,
              ),
            ),
          ),]
        ),
      ),
    );
  }

  void initList(context){
    columnData = [
      const SizedBox(height: 15,),
      const Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: Text(
          "Forget Password?",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Text("Enter email associated with you account and we'll send and email with instructions to reset your password",
          style: TextStyle(fontWeight: FontWeight.w300,fontSize: 17),),
      ),
      SizedBox(height: MediaQuery.of(context).size.height/12,),
      TextField(controller: email,decoration: const InputDecoration(hintText: "enter your email here",icon: Icon(Icons.email_outlined)),),
      Expanded(child: Container()),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Center(
          child: ElevatedButton(
            onPressed: () {

              if(email.text.isNotEmpty && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(email.text)){
                // Get.to(VerifictionPage());
              }else{
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter email")));
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Constants.buttonBrownColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(
                        Constants.buttonBorderRadius,
                        Constants.buttonBorderRadius)),
                    side: BorderSide(color: Constants.whiteColor, width: 2))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: Text(
                "Send Email",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Constants.whiteColor,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 15,)
    ];
  }
}
