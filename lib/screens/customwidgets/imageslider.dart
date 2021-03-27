import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'brand_colors.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  int _index=0;
  int _dataLength=1;

  @override
  void initState() {
    // TODO: implement initState
    // getSliderImageFromDb();
    super.initState();
  }

  Future getSliderImageFromDb() async{
    var _firestore = FirebaseFirestore.instance;
    QuerySnapshot snapshot = await _firestore.collection('banner').get();
    setState(() {
      _dataLength= snapshot.docs.length;
    });
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(_dataLength!=0)
          FutureBuilder(future: getSliderImageFromDb(),
              builder: (_,snapShot){
            return snapShot.data==null?Container():

               CarouselSlider.builder(
                  itemCount: snapShot.data.length,
                  itemBuilder: (BuildContext context ,int index, int abc){
                    DocumentSnapshot sliderImage = snapShot.data[index];
                    Map getImage = sliderImage.data();
                    return Image.network(getImage['image'],);

                  },
                  options: CarouselOptions(
                    height: 150,
                    initialPage: 0,
                    autoPlay: true,
                    // ignore: non_constant_identifier_names
                    onPageChanged: (int i,CarouselPageChangedReason){
                      setState(() {
                        _index=i;
                      });
                    }
                  )

            );


              }),
          if(_dataLength!=0)
          DotsIndicator(
            dotsCount: _dataLength,
            position: _index.toDouble(),
            decorator: DotsDecorator(
                size: const Size.square(5.0),
                activeSize: const Size(18.0, 5.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                activeColor: BrandColors.colorGreen),
          ),
        ],
      ),
    );
  }
}
