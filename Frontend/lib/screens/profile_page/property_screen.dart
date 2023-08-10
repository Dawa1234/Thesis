import 'dart:math';

import 'package:flutter/material.dart';


import 'prop_detail_screen.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
    late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {

    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:AppBar(title: Text('Our Design'),backgroundColor: Color.fromARGB(255, 37, 158, 172),),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 40),
        body: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Center(
                child: Text("Find Property Here",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 30)),
              ),
            ),
            AspectRatio(
              aspectRatio: 0.85,
              child: PageView.builder(
                  itemCount: dataList.length,
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return carouselView(index);
                  }),
            )
          ],
        ),
      
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.038).clamp(-1, 1);
          print("value $value index $index");
        }
        return Transform.rotate(
          angle: pi * value,
          child: carouselCard(dataList[index]),
        );
      },
    );
  }

  Widget carouselCard(DataModel data) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: data.imageName,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(data: data)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(
                            data.imageName,
                          ),
                          fit: BoxFit.fill),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Colors.black26)
                      ]),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            data.title,
            style: const TextStyle(
                color: Colors.black45,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              "\$${data.price}",
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

//     return Scaffold(
//       backgroundColor: Colors.white,
    
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//               top: MediaQuery.of(context).padding.top + kToolbarHeight,
//               left: 40,
//             ),
//             child: Text(
//               "Projects By \nSAAYA Architects.",
//               style: TextStyle(
//                 letterSpacing: 1.3,
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25,
//                 height: 1.3,
//               ),
//             ),
//           ),
//           Expanded(
//             child: PageViewWidget(),
//           )
//         ],
//       ),
//     );
//   }
// }

// class PageViewWidget extends StatefulWidget {
//   @override
//   _PageViewWidgetState createState() => _PageViewWidgetState();
// }

// class _PageViewWidgetState extends State<PageViewWidget> {
//   List<VacationBean> _list = VacationBean.generate();

//   PageController? pageController;

//   double viewportFraction = 0.8;

//   double? pageOffset = 0;

//   @override
//   void initState() {
//     super.initState();
//     pageController =
//         PageController(initialPage: 0, viewportFraction: viewportFraction)
//           ..addListener(() {
//             setState(() {
//               pageOffset = pageController!.page;
//             });
//           });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: pageController,
//       itemBuilder: (context, index) {
//         double scale = max(viewportFraction,
//             (1 - (pageOffset! - index).abs()) + viewportFraction);

//         double angle = (pageOffset! - index).abs();

//         if (angle > 0.5) {
//           angle = 1 - angle;
//         }
//         return Container(
//           padding: EdgeInsets.only(
//             right: 10,
//             left: 20,
//             top: 100 - scale * 25,
//             bottom: 50,
//           ),
//           child: Transform(
//             transform: Matrix4.identity()
//               ..setEntry(
//                 3,
//                 2,
//                 0.001,
//               )
//               ..rotateY(angle),
//             alignment: Alignment.center,
//             child: Stack(
//               children: <Widget>[
//                 Image.asset(
//                   _list[index].url,
//                   width: MediaQuery.of(context).size.height*0.5,
//                   height: 2000,
//                   fit: BoxFit.none,
//                   alignment: Alignment((pageOffset! - index).abs() * 0.5, 0),
//                 ),
//                 Positioned(
//                   bottom: 60,
//                   left: 20,
//                   child: AnimatedOpacity(
//                     opacity: angle == 0 ? 1 : 0,
//                     duration: Duration(
//                       milliseconds: 200,
//                     ),
//                     child: Text(
//                       _list[index].name,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//       itemCount: _list.length,
//     );
//   }
// }

// class VacationBean {
//   String url;
//   String name;

//   VacationBean(this.url, this.name);

//   static List<VacationBean> generate() {
//     return [
//       VacationBean("assets/image/x.jpeg", "Kathmandu"),
//       VacationBean("assets/image/1.jpg", "Pokhara"),
//       VacationBean("assets/image/5.jpg", "Damak"),
//       VacationBean("assets/image/7.jpg", "Birjung"),
//       VacationBean("assets/image/9.jpg", "Dillibazar"),
//       VacationBean("assets/image/11.jpg", "Pepsicola"),
//     ];
//   }
// }