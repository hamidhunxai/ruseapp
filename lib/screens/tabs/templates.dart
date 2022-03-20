import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ruse/screens/components/constants.dart';

class Templates extends StatefulWidget {
  @override
  _TemplatesState createState() => _TemplatesState();
}

class _TemplatesState extends State<Templates> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;
  bool isLoading = false;
  bool isRetrieved = false;
  QuerySnapshot<Map<String, dynamic>>? cachedResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: !isRetrieved
            ? FutureBuilder(
                future: getImages(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    isRetrieved = true;
                    cachedResult = snapshot.data;
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GridView.count(
                            crossAxisCount: 1,
                            crossAxisSpacing: 20.0,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                  child: Text(
                                    cachedResult!.docs[index].data()["name"],
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      cachedResult!.docs[index].data()["url"],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                  return CircularProgressIndicator();
                },
              )
            : displayList(),
      ),
    ));
  }

  GridView displayList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(10.0), scrollDirection: Axis.vertical,
      // Generate 100 widgets that display their index in the List.
      itemCount: cachedResult!.docs.length,
      itemBuilder: (BuildContext context, int index) {
        return GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 20.0,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  cachedResult!.docs[index].data()["name"],
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    cachedResult!.docs[index].data()["url"],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getImages() {
    return fb.collection("images").get();
  }
}

class Object extends StatelessWidget {
  Object({required this.name, required this.imageUrl, required this.onPressed});

  final String name;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                color: kTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
