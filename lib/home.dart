import 'package:burger/itempage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCirc));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    int _index = 0;
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 2.3,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(130),
                      bottomRight: Radius.circular(130))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new FadeTransition(
                          opacity: animation,
                          child: new SlideTransition(
                            position: Tween<Offset>(
                                    begin: Offset(
                                      -10.0,
                                      0.0,
                                    ),
                                    end: Offset.zero)
                                .animate(CurvedAnimation(
                                    parent: controller,
                                    curve: Curves.fastLinearToSlowEaseIn)),
                            child: Text("Bassel Icon"),
                          ),
                        ),
                        new FadeTransition(
                          opacity: animation,
                          child: new SlideTransition(
                            position: Tween<Offset>(
                                    begin: Offset(
                                      10.0,
                                      -0.0,
                                    ),
                                    end: Offset.zero)
                                .animate(CurvedAnimation(
                                    parent: controller,
                                    curve: Curves.fastLinearToSlowEaseIn)),
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    width: 250,
                    child: Column(
                      children: [
                        Image.asset(
                          "images/upper-bun.png",
                          height: 250,
                          width: 250,
                          fit: BoxFit.fill,
                        ),
                        // Image.asset("images/BBB.png",height: 40,width: 250,fit: BoxFit.fill,),
                        // Image.asset("images/BO3.png",height: 40,width: 250,fit: BoxFit.fill,),
                        // Image.asset("images/BO3.png",height: 40,width: 250,fit: BoxFit.fill,),
                        // Image.asset("images/BO3.png",height: 40,width: 250,fit: BoxFit.fill,),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 20,bottom:20),
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  ),
              child: new Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: new Image.network(
                      "https://th.bing.com/th/id/OIP.Lqwy4v3anrxzwRA2LUD-6wHaDp?w=317&h=172&c=7&o=5&pid=1.7",
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  );
                },
                itemCount: 10,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: List.generate(4, (index) {
                  return Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => ItemPage()));
                      },
                      child: Stack(
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.grey[100],
                            child: Container(
                              height: 130,
                              width: 100,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("images/zinger.jpg",height: 100,width: 150,fit: BoxFit.fill,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("85 \$",style: TextStyle(fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8,top: 8),
                            child: Text("250 Grams",style: TextStyle(fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ),
                  );
                }))
          ],
        ),
      ),
    ));
  }
}
