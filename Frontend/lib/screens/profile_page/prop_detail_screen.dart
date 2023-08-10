
import 'package:SAAYADecor/screens/profile_page/prop_map.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final DataModel data;
  const DetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 37, 158, 172),
        // title: Text('Detail Page'),
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              widget.data.title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: widget.data.imageName,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                              widget.data.imageName,
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
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                "     Estimitated price\$${widget.data.price}\n Hurry up contact us 9861685080",
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
           IconButton(onPressed: (){ Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PropertyMap(),
                        ),
                      );}, 
                      icon: Image.asset("assets/image/location.webp",width: 40,
                      height: 40,)
                      ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PropertyMap(),
                  ));
            },
            child: const Text(
              "Click Here For Location",
              style: TextStyle(
                  color: Color.fromARGB(255, 18, 56, 120),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataModel {
  final String title;
  final String imageName;
  final double price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  DataModel("Pepsicola House", "assets/image/1.jpg", 30000),
  DataModel("City Mall Cafe", "assets/image/10.jpg", 43423),
  DataModel("Baneshwor House", "assets/image/x.jpeg", 45654),
  DataModel("Baneshwor Resturant", "assets/image/8.jpg", 99098.7),
];
