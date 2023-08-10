import 'package:flutter/material.dart';

import 'cart/cart_screen.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );}, icon: Image.asset("assets/image/ganesh.png",width: 40,
                      height: 40,)
                      ),
                Row(
                  
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                
                    Text(
                      "Statue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                      }, icon: Image.asset("assets/image/lamp.png",width: 40,
                      height: 40,)
                      ),
                    Text(
                      "Lights",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                      }, icon: Image.asset("assets/image/vase.png",width: 40,
                      height: 40,)
                      ),
                    Text(
                      "Pots&Vases",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF4C53A5)),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                      }, icon: Image.asset("assets/image/canvas.png",width: 40,
                      height: 40,)
                      ),
                    Text(
                      "Canvas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF4C53A5),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                      }, icon: Image.asset("assets/image/plants.png",width: 40,
                      height: 40,)
                      ),
                    Text(
                      "Plants",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF4C53A5)),
                    ),
                    SizedBox(width: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                      }, icon: Image.asset("assets/image/frame.png",width: 40,
                      height: 40,)
                      ),
                        Text(
                          "Frames",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF4C53A5)),
                        )
                      ],
                    ),
                   
                    SizedBox(width: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                      }, icon: Image.asset("assets/image/others.webp",width: 40,
                      height: 40,)
                      ),
                        Text(
                          "Others",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF4C53A5)),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          
        
      );
    
  }
}
