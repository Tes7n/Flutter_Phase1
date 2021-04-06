import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1nep/screens/customwidgets/brand_colors.dart';
import 'package:flutter_1nep/services/storeservice.dart';
class TopPickedStore extends StatefulWidget {
  @override
  _TopPickedStoreState createState() => _TopPickedStoreState();
}

class _TopPickedStoreState extends State<TopPickedStore> {
  StoreServices _storeServices = StoreServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _storeServices.getTopPickedStore(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot){
            if (!snapShot.hasData) return CircularProgressIndicator();
            return Column(children: [
              Row(children: [
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text('Top Picks!', style: TextStyle(fontWeight: FontWeight.w800,color: BrandColors.colorGreen),),
                )
              ],),

              Flexible(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:
                    snapShot.data.docs.map((DocumentSnapshot document){
                      return Padding(
                        padding:  EdgeInsets.only(left:8.0,right: 8.0),
                        child: Container(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: Card(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                      child: Image.network(document['ImageUrl'],fit: BoxFit.fill,)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),

                ),
              )
            ],);
          }),
    );
  }
}
