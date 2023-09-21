import 'package:ecommerce_ui/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Cart",
                style: GoogleFonts.inter(
                  color: AppColors.mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 15,),
              Expanded(
                  child: ListView.builder(
                    itemCount: 3,
                      itemBuilder: (context,index){
                      return  Container(
                        height: 110,
                        width: screenWidth*0.9,
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 2,
                              spreadRadius: 3,
                              offset: const Offset(0,2)
                            )
                          ],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage("assets/4.jpg"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Jacket 100",
                                  style: GoogleFonts.inter(
                                      color: AppColors.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: AppColors.secondColor,size: 25,),
                                    const SizedBox(width: 10,),
                                    Text(
                                      "4.5",
                                      style: GoogleFonts.inter(
                                          color: AppColors.mainColor,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                )

                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.remove, color: AppColors.secondColor,size: 25,),
                                const SizedBox(width: 10,),
                                Text(
                                  "4",
                                  style: GoogleFonts.inter(
                                      color: AppColors.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800
                                  ),
                                ),
                                const SizedBox(width: 10,),

                                const Icon(Icons.add, color: AppColors.secondColor,size: 25,),
                              ],
                            )
                          ],
                        ),
                      );
                      })
              )
            ],
          ),
        ),
      )
    );
  }
}
