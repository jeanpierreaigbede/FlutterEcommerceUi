import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category.dart';
import '../utils/appColors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Category> categories = [
    Category(name: "T-SHIRT", image: "assets/tshirt.jpg", totalProduct: 240),
    Category(name: "HODDIE", image: "assets/hoodie.jpg", totalProduct: 200),
    Category(name: "JACKET", image: "assets/jacket.jpg", totalProduct: 125),
    Category(name: "SHOE", image: "assets/shoe.jpg", totalProduct: 140),
    Category(name: "T-SHIRT", image: "assets/3.jpg", totalProduct: 240),
    Category(name: "T-SHIRT", image: "assets/tshirt.jpg", totalProduct: 240),
    Category(name: "T-SHIRT", image: "assets/tshirt.jpg", totalProduct: 240),


  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // row for text,notifications and profile's picture
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "JPASCODE SHOP",
                    style: GoogleFonts.inter(
                        color: AppColors.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: const Icon(Icons.notifications_none,color: AppColors.mainColor,size: 25,),
                      ),
                      const SizedBox(width: 10,),
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/profile.png"),

                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 10,),
              // SearchBar
              Container(
                alignment: Alignment.center,
                height: 60,
                width: screenWidth*0.9,
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: "Search Category",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,color: AppColors.mainColor,size: 25,)
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                    itemBuilder: (context,index){
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 150,
                          width: screenWidth*0.9,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(categories[index].image!),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          height: 80,
                          width: screenWidth*0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  bottomLeft:  Radius.circular(20),
                              ),
                              
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    AppColors.mainColor,
                                    AppColors.mainColor.withOpacity(0.5),
                                    AppColors.mainColor.withOpacity(0.4),
                                    AppColors.mainColor.withOpacity(0.01)
                                  ]),
                              color: Colors.white
                          ),
                          child: Column(
                            children: [
                              Text(
                                  categories[index].name!,
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 23
                                ),
                              ),
                              Text(
                                "${categories[index].totalProduct!} Products",
                                style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                    }),
              )
            ],
          ),
        ),
      )
    );
  }
}
