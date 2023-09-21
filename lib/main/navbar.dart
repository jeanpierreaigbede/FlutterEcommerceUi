import 'package:ecommerce_ui/main/cart_page.dart';
import 'package:ecommerce_ui/main/explore_page.dart';
import 'package:ecommerce_ui/main/home___page.dart';
import 'package:ecommerce_ui/main/profil_page.dart';
import 'package:ecommerce_ui/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = [
    const HomePage(),
    const ExplorePage(),
    const CartPage(),
    const ProfilPage()
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPage],
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: 70,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  _currentPage = 0;
                });
              },
              child: Column(
                children: [
                  Icon(_currentPage==0?Icons.circle :Icons.home,color: _currentPage==0?AppColors.secondColor:Colors.white,size:20,),
                  Text('Home',
                  style: GoogleFonts.inter(
                    color: _currentPage==0?AppColors.secondColor:Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700
                  ),)

                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  _currentPage = 1;
                });
              },
              child: Column(
                children: [
                  Icon(_currentPage==1?Icons.circle :Icons.explore,color: _currentPage==1?AppColors.secondColor:Colors.white,size:20,),
                  Text('Explore',
                    style: GoogleFonts.inter(
                        color: _currentPage==1?AppColors.secondColor:Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  _currentPage = 2;
                });
              },
              child: Column(
                children: [
                  Icon(_currentPage==2?Icons.circle :Icons.shopping_cart,color: _currentPage==2?AppColors.secondColor:Colors.white,size:20,),
                  Text('Cart',
                    style: GoogleFonts.inter(
                        color: _currentPage==2?AppColors.secondColor:Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),)

                ],
              ),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  _currentPage = 3;
                });
              },
              child: Column(
                children: [
                  Icon(_currentPage==3?Icons.circle :Icons.account_circle,color: _currentPage==3?AppColors.secondColor:Colors.white,size:20,),
                  Text('Profile',
                    style: GoogleFonts.inter(
                        color: _currentPage==3?AppColors.secondColor:Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                    ),)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
