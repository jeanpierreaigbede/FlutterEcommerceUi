import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_ui/screens/login_page.dart';
import 'package:ecommerce_ui/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/langin_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _pageController = PageController();
  double _currentValue = 0.0;
  List<LandingModel> lists = [
    LandingModel(title: "Your Apparence \nShow Your Quality", description: "Change The Quality of Your Apparence with JPAS SHOP Now", image: "assets/3.jpg"),
    LandingModel(title: "Discover the Latest Trends", description: "Elevate your style with the latest collection from JPAS SHOP. Stay ahead of the fashion curve.", image: "assets/4.jpg"),
    LandingModel(title: "Timeless Elegance, Modern Design", description: "Experience the perfect blend of classic and contemporary fashion at JPAS SHOP", image: "assets/2.jpg"),

  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentValue = _pageController.page!;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Expanded(
                child: Stack(
                  children: [
                    Stack(
                      children: [
                       SizedBox(
                              height: double.maxFinite,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: PageView.builder(
                                      controller: _pageController,
                                      itemCount: 3,
                                        itemBuilder: (context,index){
                                        return Column(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context).size.height*0.6,
                                              decoration:BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(lists[index].image!),
                                                      fit: BoxFit.cover
                                                  ),
                                                  color: Colors.white
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(
                                                      lists[index].title!,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                        color: AppColors.mainColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 25
                                                      ),
                                                    ),
                                                    Text(
                                                      lists[index].description!,
                                                      textAlign: TextAlign.center,
                                                      style: GoogleFonts.inter(
                                                          color:Colors.grey,
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 15
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                          
                                        );
                                        }),
                                  ),
                                  DotsIndicator(
                                    dotsCount: 3,
                                    position:_currentValue.toInt(),
                                    decorator: DotsDecorator(
                                        activeShape:RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        ) ,
                                        activeColor:AppColors.secondColor,
                                        activeSize: const Size(30.0,5),
                                        size: const Size(8,8),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20)
                                        )
                                    ),
                                  )
                                ],
                              ),
                            )


                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "JPAS CODE SHOP",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                   /* Stack(
                      children:[

                        Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/1.jpg"),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          color: Colors.red,
                        )
                      ]
                    )*/
                  ],
                )
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 75,
                width: MediaQuery.of(context).size.width*0.9,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(37),
                  color: AppColors.mainColor
                ),
                child: const Text(
                    "Sign in with Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
            )
          ],
        ),

    );
  }
}
