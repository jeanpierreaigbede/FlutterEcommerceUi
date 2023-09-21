import 'package:ecommerce_ui/main/home___page.dart';
import 'package:ecommerce_ui/main/navbar.dart';
import 'package:ecommerce_ui/screens/landing_page.dart';
import 'package:ecommerce_ui/utils/appColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscure = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 3,
                        spreadRadius: 3,
                        offset: const Offset(0,2)
                      )
                    ]
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const LandingPage();
                      }));
                    },icon: const Icon(Icons.arrow_back_ios,color: AppColors.mainColor,size: 25,),),
                ),
              ),

              Expanded(

                child: SingleChildScrollView(
                  reverse: true,
                  child: Form(
                    key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter Your Information \nBellow To Login',
                              style:GoogleFonts.inter(
                                color: AppColors.mainColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Text(
                            ' Email',
                            style:GoogleFonts.inter(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height:60 ,
                            width: MediaQuery.of(context).size.width*0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration:BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 3,
                                      spreadRadius: 3,
                                      offset: const Offset(0,2)
                                  )
                                ],
                            ),
                            child: TextFormField(

                              decoration:InputDecoration(
                                border: InputBorder.none,
                                hintText: " example@gmail.com",
                                hintStyle: GoogleFonts.inter(
                                  fontSize: 17,
                                  color: Colors.grey.withOpacity(0.5)
                                )
                              )
                            ),
                          ),
                          Text(
                            ' Mot de passe',
                            style:GoogleFonts.inter(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height:60 ,
                            width: MediaQuery.of(context).size.width*0.9,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration:BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 3,
                                    spreadRadius: 3,
                                    offset: const Offset(0,2)
                                )
                              ],
                            ),
                            child: TextFormField(
                              obscureText: isObscure,
                                decoration:InputDecoration(
                                    border: InputBorder.none,
                                    hintText: " ***********",
                                    hintStyle: GoogleFonts.inter(
                                        fontSize: 17,
                                        color: Colors.grey.withOpacity(0.5)
                                    ),
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    },
                                    icon: Icon(isObscure?Icons.visibility_off_outlined:Icons.visibility,color: AppColors.mainColor,),
                                  )
                                )
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.centerRight,
                            child:TextButton(
                              onPressed: (){},
                              child: Text("Forgot password ?",
                              style: GoogleFonts.inter(
                                color: AppColors.mainColor,
                                fontSize: 18
                              ),),
                            ) ,
                          ),
                          const SizedBox(height: 10,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const NavBar()));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              width: MediaQuery.of(context).size.width*0.9,
                              margin: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(37),
                                  color: AppColors.mainColor
                              ),
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          )
                        ],
                      ),

                  ),
                ),
              ),

              const SizedBox(height: 50,),

            ],
          ),
        ),
      ),
    );
  }
}
