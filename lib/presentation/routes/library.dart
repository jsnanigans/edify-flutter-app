import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Library"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 40),
            itemCount: 10,
            itemBuilder: (_, __) {
              return BookFeature();
            },
            separatorBuilder: (_, __) => Container(height: 30),
          ),
        ));
  }
}

class BookFeature extends StatelessWidget {
  final double containerHeight = 220;
  final double imageSize = 120;
  final double bgHeight = 220;
  final double titleHeight = 60;
  final double descriptionHeight = 140;
  final double spacingLeft = 35;
  final double imageOverlayPercent = 0.4;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      child: Stack(
        children: [
          // Color Background
          Positioned(
            right: 0,
            left: spacingLeft,
            top: imageSize * imageOverlayPercent,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.lightBlueAccent.withOpacity(0.05),
              ),
            ),
          ),

          // Image
          Positioned(
              left: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.black,
                ),
                width: imageSize,
                height: imageSize,
              )),

          // Title area
          Positioned(
              right: 0,
              left: imageSize,
              top: imageSize * imageOverlayPercent,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Book Title",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                ),
              )),

          // Description content
          Positioned(
              right: 0,
              left: spacingLeft,
              top: imageSize,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Book Title", style: TextStyle(fontSize: 16))
                    ],
                  ),
                ),
                height: descriptionHeight,
              )),
        ],
      ),
    );
  }
}
