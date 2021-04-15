import 'package:edify/cubit/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LibraryCubit(),
      child: LibraryContent(),
    );
  }
}


class LibraryContent extends StatelessWidget {
  final image = Image(image: AssetImage('assets/crooked_kingdom.jpg'));
  final image2 = Image(image: AssetImage('assets/hhgttg.jpg'));

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LibraryCubit>(context).loadBooks();
    return Scaffold(
        appBar: AppBar(
          title: Text("Library"),
        ),
        body: BlocBuilder<LibraryCubit, LibraryState>(
          builder: (context, state) {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 30),
              itemCount: state.books.length,
              itemBuilder: (_, int index) {
                Audiobook book = state.books[index];
                return Text("${book.name}");
              },
              separatorBuilder: (_, __) => Container(height: 30),
            );
          },
        ));
  }
}
// return index % 2 == 0
//     ? BookFeature(
//         image: image,
//         title: 'Crooked Kingdom',
//         author: 'Leigh Bardugo',
//         description:
//             """Kaz Brekker and his crew of deadly outcasts have just pulled off a heist so daring even they didn't think they'd survive. But instead of divvying up a fat reward, they're right back to fighting for their lives.""",
//       )
//     : BookFeature(
//         image: image2,
//         title: "The Hitchhiker's Guide to the Galaxy",
//         author: 'Douglas Adams',
//         description:
//             """Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet by his friend Ford Prefect, a researcher for the revised edition of The Hitchhiker's Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor.""",
//       );

class BookFeature extends StatefulWidget {
  final double containerHeight = 280;
  final double imageWidth = 140;
  final double imageHeight = 140 * 1.45;
  final double bgHeight = 220;
  final double titleHeight = 60;
  final double descriptionHeight = 140;
  final double spacingLeft = 35;
  final double imageOverlayPercent = 0.4;

  final Image image;
  final String title;
  final String author;
  final String description;

  BookFeature({required this.image,
    required this.title,
    required this.description,
    required this.author});

  @override
  _BookFeatureState createState() => _BookFeatureState();
}

class _BookFeatureState extends State<BookFeature> {
  PaletteGenerator? _paletteGenerator;
  List<Color> _gradient = [Colors.black26, Colors.black12];

  void _updatePaletteGenerator() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
      widget.image.image,
    );

    setState(() {
      _gradient = [
        _paletteGenerator?.lightVibrantColor?.color.withOpacity(0.35) ??
            _gradient[0],
        _paletteGenerator?.mutedColor?.color.withOpacity(0.1) ?? _gradient[1],
      ];
    });
  }

  @override
  initState() {
    super.initState();
    _updatePaletteGenerator();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: widget.containerHeight,
        child: Stack(
          children: [
            // Color Background
            Positioned(
              right: 0,
              left: widget.spacingLeft,
              top: widget.imageWidth * widget.imageOverlayPercent,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // color: _paletteGenerator?.dominantColor?.color.withOpacity(0.4),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.7],
                      colors: _gradient,
                    )),
              ),
            ),

            // Image
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(6.0, 6.0))
                      ],
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.black,
                      image: new DecorationImage(
                          image: widget.image.image, fit: BoxFit.cover)),
                  width: widget.imageWidth,
                  height: widget.imageHeight,
                )),

            // Title area
            Positioned(
                right: 0,
                left: widget.imageWidth,
                top: widget.imageWidth * widget.imageOverlayPercent,
                bottom: 15,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Container(height: 5),
                        Row(
                          children: [
                            Text("by ",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                            Text(widget.author,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(" - 2h 24m 3s",
                                style: TextStyle(
                                  fontSize: 12,
                                )),
                          ],
                        ),
                        Container(height: 8),
                        Flexible(
                          child: Container(
                            height: 560,
                            child: Text(
                              widget.description,
                              style: TextStyle(fontSize: 16,
                                  height: 1.4,
                                  color: Colors.black.withOpacity(0.8)),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
