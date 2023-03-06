class Carousel{
  int activeIndex = 0;
  final List<dynamic> images = [
          {
    "imagem": "assets/BackgroundLight.png",
     "titulo": "Pokedex",
  },
      {
    "imagem": "assets/BackgroundDark.png",
     "titulo": "Abilities",
 },
       {
    "imagem": "assets/BackgroundLight.png",
     "titulo": "Items",
 },
       {
    "imagem": "assets/BackgroundDark.png",
     "titulo": "Locations",
 },
  {
    "imagem": "assets/BackgroundLight.png",
     "titulo": "type",
 },
  ];
}
// carousel widget

// CarouselSlider.builder(
//                   options: CarouselOptions(
//                     height: size.height * .2,
//                     autoPlay: true,
//                     //enlargeCenterPage: true,
//                     onPageChanged: (index, reason) =>
//                         setState(() => carousel.activeIndex = index),
//                   ),
//                   itemCount: carousel.images.length,
//                   itemBuilder: (context, index, realIndex) {
//                     final urlimage = carousel.images[index]["imagem"];
//                     final texto = carousel.images[index]["titulo"];
//                     return Padding(
//                       padding: EdgeInsets.only(top: size.width * 0.09),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                           side: BorderSide(
//                             color: Colors.greenAccent,
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             //buildImage(urlimage, index,),
//                             Text(
//                               texto,
//                               style: TextStyle(
//                                 fontSize: size.height * 0.03,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 )

  // Widget buildImage(String urlimage, int index) => Container(
  //       margin: const EdgeInsets.symmetric(horizontal: 24),
  //       width: double.infinity,
  //       child: Image(
  //         image: AssetImage(urlimage),
  //         fit: BoxFit.cover,
  //       ),
  //     );
  // Widget buildIndicator() => AnimatedSmoothIndicator(
  //     activeIndex: carousel.activeIndex,
  //     count: carousel.images.length,
  //     effect: const WormEffect(
  //         dotWidth: 15,
  //         dotHeight: 15,
  //         activeDotColor: Colors.limeAccent,
  //         dotColor: Colors.black12));