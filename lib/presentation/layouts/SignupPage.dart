import 'package:flutter/material.dart';

import '../../utils/consts.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: V_LARGE_PAD_VER,
                    left: V_LARGE_PAD_HOR,
                    bottom: SMALL_PAD_VER),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: V_LARGE_FONT_SIZE),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: V_LARGE_PAD_HOR),
                child: Text("First step towards Thinnai Hosting"),
              ),
              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR,top: V_LARGE_PAD_VER),
                child: Text("First Name: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: REGULAR_FONT_SIZE),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: SMALL_PAD_VER,left: LARGE_PAD_HOR,right: LARGE_PAD_HOR),
                child: TextFormField(

                  decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2)
                ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                child: Text("Last Name: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: REGULAR_FONT_SIZE),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: SMALL_PAD_VER,left: LARGE_PAD_HOR,right: LARGE_PAD_HOR),
                child: TextFormField(

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)
                      ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                child: Text("Email id: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: REGULAR_FONT_SIZE),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: SMALL_PAD_VER,left: LARGE_PAD_HOR,right: LARGE_PAD_HOR),
                child: TextFormField(

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)
                      ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                child: Text("Contact Number: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: REGULAR_FONT_SIZE),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: SMALL_PAD_VER,left: LARGE_PAD_HOR,right: LARGE_PAD_HOR),
                child: TextFormField(

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)
                      ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                child: Text("Password: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: REGULAR_FONT_SIZE),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: SMALL_PAD_VER,left: LARGE_PAD_HOR,right: LARGE_PAD_HOR),
                child: TextFormField(

                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)
                      ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: LARGE_PAD_HOR),
                child: Text("Confirm Password: ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: REGULAR_FONT_SIZE),),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: SMALL_PAD_VER,left: LARGE_PAD_HOR,right: LARGE_PAD_HOR),
                child: TextFormField(

                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.remove_red_eye_rounded),
                    enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2)
                      ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppConstants().width*0.23),
                child: SizedBox(
                  width: AppConstants().width*0.51,
                  child: ElevatedButton(onPressed: (){},
                      child: Text("Sign Up")),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: AppConstants().width*0.23),
                child: Row(
                  children: [
                    Text("I’m Already Registered, "),
                    RichText(
                      text: TextSpan(
                          text: "Login",
                          style: TextStyle(color: Color(0xff8F7EF3))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
