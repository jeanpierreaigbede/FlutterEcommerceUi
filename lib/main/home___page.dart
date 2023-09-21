import 'package:ecommerce_ui/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  TabController? _tabController;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWith = MediaQuery.of(context).size.width;
    List<Product> products =[
      Product(title: "Dress Shirts", normalPrice: 30.25,newPrice: 22.5,image: "assets/2.jpg",favorite: true),
      Product(title: "Pants and Jeans", normalPrice: 35.25,newPrice: 28.5,image: "assets/1.jpg"),
      Product(title: 'Jackets and Coats', normalPrice: 36.25, newPrice: 30,image: "assets/3.jpg"),
      Product(title: "Dress Shirts", normalPrice: 30.25,newPrice: 22.5),
      Product(title: "Pants and Jeans", normalPrice: 35.25,newPrice: 28.5,image: "assets/2.jpg",favorite: true),
      Product(title: 'Jackets and Coats', normalPrice: 36.25, newPrice: 30,image: "assets/1.jpg"),
      Product(title: "Dress Shirts", normalPrice: 30.25,newPrice: 22.5,image: "assets/3.jpg", favorite: true),
      Product(title: "Pants and Jeans", normalPrice: 35.25,newPrice: 28.5,image: "assets/2.jpg"),
      Product(title: 'Jackets and Coats', normalPrice: 36.25, newPrice: 30,image: "assets/2.jpg"),
    ];
    return Scaffold(
      body:SafeArea(
        child:Padding(
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
               width: screenWith*0.9,
               padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
               decoration: BoxDecoration(
                 color: Colors.grey.withOpacity(0.1),
                 borderRadius: BorderRadius.circular(30),
               ),
               child: const TextField(
                 decoration: InputDecoration(
                   hintText: "Search Product",
                   border: InputBorder.none,
                   prefixIcon: Icon(Icons.search,color: AppColors.mainColor,size: 25,)
                 ),
               ),
             ),

             const SizedBox(height: 10,),
             
             // TabBar 
             TabBar(
               controller: _tabController,
                 tabs: ['Trending',"Clothing"].map((category){
                   final selected =['Trending',"Clothing"].indexOf(category)==_selectedTabIndex;
                   return Tab(
                     child: Container(
                       alignment: Alignment.center,
                       height: 40,
                       width: screenWith*0.4,
                       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                       decoration: BoxDecoration(
                         color: selected?AppColors.mainColor:Colors.grey.withOpacity(0.1),
                         borderRadius: BorderRadius.circular(20)
                       ),
                       child: Text(
                         category,
                         style: GoogleFonts.inter(
                           color: selected? Colors.white:AppColors.mainColor,
                           fontWeight: FontWeight.w500,
                           fontSize: 17
                         ),
                       ),
                     ),
                   );
                 }).toList(),
               onTap: (index){
                   setState(() {
                     _selectedTabIndex = index;
                   });
               },
               indicatorSize: TabBarIndicatorSize.tab,
               indicator: const BoxDecoration(
                 color: Colors.transparent
               ),
             ),

             // Exploring Product
             const SizedBox(height: 10,),
             Expanded(
               child: TabBarView(
                 controller: _tabController,
                   children:List.generate(2, (index){
                     return GridView.custom(
                       gridDelegate: SliverWovenGridDelegate.count(
                         crossAxisCount: 2,
                         mainAxisSpacing: 8,
                         crossAxisSpacing: 8,

                         pattern: [
                           const WovenGridTile(5/8),
                           const WovenGridTile(
                            5/7,
                             crossAxisRatio: 0.9,
                             alignment: AlignmentDirectional.centerEnd,
                           ),
                         ],

                       ),

                       childrenDelegate: SliverChildBuilderDelegate(
                         childCount: products.length,
                             (context, index) => Container(
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.grey.withOpacity(0.3),
                                       blurRadius: 3,
                                       spreadRadius: 3,
                                       offset: const Offset(0,2)
                                   ),
                                 ],
                                 borderRadius: BorderRadius.circular(20)
                               ),
                               child: Column(
                                 children: [
                                   Expanded(child: Stack(
                                     children: [
                                       Container(
                                         decoration: BoxDecoration(
                                             boxShadow: [
                                               BoxShadow(
                                                   color: Colors.grey.withOpacity(0.3),
                                                   blurRadius: 3,
                                                   spreadRadius: 3,
                                                   offset: const Offset(0,2)
                                               ),
                                             ],
                                             borderRadius: BorderRadius.circular(20),
                                             image: DecorationImage(
                                                 image: AssetImage(products[index].image!),
                                                 fit: BoxFit.cover
                                             )
                                         ),
                                       ),
                                       Align(
                                         alignment: Alignment.topRight,
                                         child: Container(
                                           alignment: Alignment.center,
                                           height: 40,
                                           width: 40,
                                           margin: const EdgeInsets.all(8),
                                           decoration: BoxDecoration(
                                               color: AppColors.mainColor,
                                               borderRadius: BorderRadius.circular(20)
                                           ),
                                           child: Icon(products[index].favorite?Icons.favorite:Icons.favorite_border_outlined,color: Colors.white,),
                                         ),
                                       )
                                     ],
                                   )),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Column(
                                       children: [
                                         Text(
                                           products[index].title!,
                                           style: const TextStyle(
                                             color: AppColors.mainColor,
                                             fontSize: 18,
                                             fontWeight: FontWeight.bold,
                                             overflow: TextOverflow.ellipsis
                                         ),),
                                         Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                                           children: [
                                             Text(
                                               "\$${products[index].newPrice!}",
                                               style: const TextStyle(
                                                 color: AppColors.mainColor,
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.bold
                                               ),
                                             ),
                                             Text(
                                                 "\$${products[index].normalPrice!}",
                                               style:  const TextStyle(
                                                   color: Colors.grey,
                                                   fontSize: 18,
                                                   fontWeight: FontWeight.bold,
                                                 decoration: TextDecoration.lineThrough
                                               ),
                                             ),

                                           ],
                                         ),
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             ),
                       ),
                     );
                   })
               ),
             )
           ],
            )
          ),
        ) ,
    );
  }
}
