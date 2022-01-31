import 'package:flutter/material.dart';
import 'package:ruse/components/constants.dart';

class DraftBox extends StatefulWidget {

  @override
  _DraftBoxState createState() => _DraftBoxState();
}

class _DraftBoxState extends State<DraftBox>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kSecondaryColor,
            centerTitle: true,
            title: Text(
              'Select an Object',
              style: TextStyle(fontSize: 16.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('Hot'),
                      ),
                      Tab(
                        child: Text('Recent'),
                      ),
                      Tab(
                        child: Text('Sticker'),
                      ),
                      Tab(
                        child: Text('ID Photo'),
                      ),
                      Tab(
                        child: Text('Landscape'),
                      ),
                      Tab(
                        child: Text('Creative'),
                      ),
                      Tab(
                        child: Text('Life'),
                      ),
                      Tab(
                        child: Text('Food'),
                      ),
                      Tab(
                        child: Text('Festival'),
                      ),
                      Tab(
                        child: Text('Animal'),
                      )
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.add_alert),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              GridView.count(
                physics: ScrollPhysics(),
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        semanticContainer: true,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/one.jpg",
                                fit: BoxFit.fill,
                              ),
                              Text(
                                "Knockout",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              Row(
                                children: [
                                  Text("knockOut"),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                  Icon(Icons.star),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/two.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/three.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/five.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/three.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/five.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/one.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/two.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/two.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.grey,
                    ),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Image.asset("assets/images/one.jpg",
                              height: 100, width: 150),
                          Text(
                            "Knockout",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          Row(
                            children: [
                              Text("knockOut"),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              ),
              Container(
                child: Center(
                  child: Text('Recent'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('sticker'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('id photo'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('landscape'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('creative'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('life'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('food'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('festival'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('animal'),
                ),
              ),
            ],
          )),
    );
  }
}
