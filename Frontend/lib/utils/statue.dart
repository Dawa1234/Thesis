// import 'package:SAAYA_Ecommerce/data_source/remote_data_source/response/productResponse.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:SAAYA_Ecommerce/models/products.dart';
// import 'package:SAAYA_Ecommerce/repository/productRepository.dart';
// import 'package:SAAYA_Ecommerce/screens/category_list.dart';
// import 'package:SAAYA_Ecommerce/utils/productcard.dart';
// import 'package:SAAYA_Ecommerce/utils/sideNav.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> images = [
//     "https://res.cloudinary.com/dlswfpevd/image/upload/v1676954293/331049080_593557255538456_2879172754634943634_n_fs52z7.jpg",
//     "https://res.cloudinary.com/dlswfpevd/image/upload/v1676954293/331060254_555924576285281_4692155907785446096_n_qmajag.jpg",
//     "https://res.cloudinary.com/dlswfpevd/image/upload/v1676954293/315503737_447868360759657_4617424884504229921_n_w1yjhf.jpg",
//   ];
//   final List productType = [
//     [
//       'Electronics',
//     ],
//     [
//       'Warddrobe',
//     ],
//     [
//       'Beds',
//     ],
//     [
//       'Table',
//     ],
//   ];
//   // make String dynamci list of product type

//   String? search;

 



//   void CategorySelected(int index) {
//     setState(() {
//       for (int i = 0; i < productType.length; i++) {
//         productType[i][1] = false;
//       }
//       productType[index][1] = true;
//     });
//   }

//   int activeimage = 0;
//   Widget buildIndicator() => AnimatedSmoothIndicator(
//         activeIndex: activeimage,
//         count: images.length,
//         effect: const JumpingDotEffect(
//             dotWidth: 10,
//             dotHeight: 10,
//             activeDotColor: Colors.red,
//             dotColor: Colors.black12),
//       );

//   bool _iconBool = false;
//   IconData _iconLight= Icons.wb_sunny;
//   IconData _iconDark=Icons.nights_stay;

//   ThemeData _lightTheme =ThemeData(
//     primarySwatch: Colors.amber,
//     brightness: Brightness.light,
//     buttonTheme: const ButtonThemeData(buttonColor: Colors.amber)
//   );
//    ThemeData _darkTheme =ThemeData(
//     primarySwatch: Colors.red,
//     brightness: Brightness.dark,
    
//   );

//   Widget build(BuildContext context) {
//     return  Scaffold(
//          //theme:_iconBool? _darkTheme:_lightTheme ,
//         drawer: const Navbar(),
//         appBar: AppBar(
          
//           iconTheme: IconThemeData.fallback(),
//           leading: Builder(
//             builder: (context) => IconButton(
//               icon: const Icon(
//                 Icons.menu_open_sharp,
//                 color: Colors.black,
//               ),
//               onPressed: () => Scaffold.of(context).openDrawer(),
//             ),
//           ),
          
//           title: SizedBox(
//             height: 30,
//             child: TextField(
//               onChanged: (Value) {
//                 setState(() {
//                   search = Value;
//                 });
//               },
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Color.fromARGB(255, 222, 216, 216),
//                 prefixIcon:
//                     const Icon(Icons.search, color: Colors.black, size: 16),
//                 hintText: 'Search Here',
//                 hintStyle: const TextStyle(
//                   fontSize: 10,
//                   color: Colors.black,
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide:
//                       BorderSide(color: Color.fromARGB(255, 37, 158, 172),),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color.fromARGB(255, 19, 176, 77)),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//             ),
//           ),
//           centerTitle: true,
//           elevation: 0,
//            backgroundColor:Color.fromARGB(247, 222, 211, 211),
//            actions: <Widget>[
//             IconButton(onPressed: (){
//               setState(() {
//                 _iconBool= !_iconBool;
//               });
//             }, 
//             icon: Icon(_iconBool ? _iconDark:_iconLight),color: Colors.black,
//         )],
//         //  actions: [IconButton(onPressed: (){
//         //   Navigator.pushNamed(context, "/profile");
//         //  }, icon: Icon(Icons.person, color: Colors.black,))],
//           // actions: const [
            
//           //   Padding(
              
//           //     padding: EdgeInsets.all(8.0),
//           //     child: Padding(
//           //       padding: EdgeInsets.all(8.0),
                
//           //       child: Icon(Icons.bedtime_sharp, color: Colors.black,  ),
                
                
//           //     ),
//           //   ),
            
//           // ],
//         ),
//         backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//         body: Column(
//           children: [
//             const SizedBox(
//               height: 15,
//             ),
    
//             SingleChildScrollView(
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   height: 180.0,
//                   enlargeCenterPage: true,
//                   viewportFraction: 0.98,
//                   autoPlay: true,
//                 ),
//                 items: images.map((i) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Container(
//                         width: MediaQuery.of(context).size.width,
                
//                         margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                         decoration: const BoxDecoration(color: Colors.amber),
//                         child: CachedNetworkImage(
//                     imageUrl: i,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => CupertinoActivityIndicator(),
//                     errorWidget: (context, url, error) => Icon(Icons.error),
//                   ),
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),
    
//             // category section
    
//             const SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(),
//               child: Text("Categories",
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF4C53A5))),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//            CategoriesWidget(),
//             // const SizedBox(
//             //   height: 15,
//             // ),
//             Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: Text("Featured Products",
//                   style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF4C53A5))),
//             ),
    
//             const SizedBox(
//               height: 10,
//             ),
    
           
//           ],
//         ),
      
//     );
//   }
// }
