import 'package:ecom/common_widgets/button.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/screens/home_screen/component/featured_button.dart';
import 'package:ecom/screens/home_screen/component/featured_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> brandsSlider = [imgSlider1, imgSlider2, imgSlider3, imgSlider4];
  List<dynamic> secondSlider = [imgSs1, imgSs2, imgSs3, imgSs4];
  List<dynamic> saleSlider = [imgFd1, imgFd2, imgFd3];
  List<dynamic> featuredImgsOne = [imgS1, imgS2, imgS3];
  List<dynamic> featuredImgsTwo = [imgS4, imgS5, imgS6];
  List<dynamic> featuredTitlesOne = [
    'Women Dress',
    'Girls Dress',
    'Girls Watches'
  ];

  List<dynamic> featuredTitlesTwo = [
    'Boys Glasses',
    'Mobile Phones',
    'TShirts'
  ];

  List<dynamic> rowOneTitles = ['Today\'s Deal', 'Flash Sale'];

  List<dynamic> rowOneIcons = [icTodaysDeal, icFlashDeal];

  List<dynamic> rowTwoTitles = ['Top Categories', 'Brands', 'Top Seller'];

  List<dynamic> rowTwoIcons = [icTopCategories, icBrands, icTopSeller];

  List<dynamic> featuredProductImgs = [
    imgP1,
    imgP2,
    imgP3,
    imgP4,
    imgP5,
    imgP6
  ];

  List<dynamic> featuredProductNames = [
    'Laptop 4 GB/512 GB SSD',
    'Make Up Ladies Kit',
    'Laptop 4 GB/256 GB SSD',
    'Ladies Shoes',
    'Ladies Bag',
    'Men\'s Sports Shoes'
  ];

  List<dynamic> featuredProductPrice = [
    '\$400',
    '\$450',
    '\$300',
    '\$340',
    '\$350',
    '\$250'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        color: lightGrey,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  decoration: const InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: 'Search Items'),
                ),
              ),
              10.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // For Carousel on Home page
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: brandsSlider.length,
                          itemBuilder: (context, index) {
                            return Image.asset(brandsSlider[index],
                                    fit: BoxFit.fill)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            2,
                            (index) => homeButton(
                              height: context.screenHeight * 0.12,
                              width: context.screenWidth / 2.8,
                              icon: rowOneIcons[index],
                              title: rowOneTitles[index],
                            ),
                          ),
                        ),
                      ),
                      10.heightBox,
                      // Second Carousel
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: secondSlider.length,
                          itemBuilder: (context, index) {
                            return Image.asset(secondSlider[index],
                                    fit: BoxFit.fill)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            3,
                            (index) => homeButton(
                              height: context.screenHeight * 0.12,
                              width: context.screenWidth / 3.5,
                              icon: rowTwoIcons[index],
                              title: rowTwoTitles[index],
                            ),
                          ),
                        ),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "Featured Categories"
                            .text
                            .size(18)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                      ),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      featuredButton(
                                        image: featuredImgsOne[index],
                                        title: featuredTitlesOne[index],
                                      ),
                                      10.heightBox,
                                      featuredButton(
                                          image: featuredImgsTwo[index],
                                          title: featuredTitlesTwo[index])
                                    ],
                                  )).toList(),
                        ),
                      ),
                      10.heightBox,
                      Container(
                          decoration: const BoxDecoration(color: redColor),
                          width: double.infinity,
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Featured Products"
                                  .text
                                  .size(18)
                                  .fontFamily(semibold)
                                  .color(Colors.white)
                                  .make(),
                              10.heightBox,
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                    6,
                                    (index) => featuredProduct(
                                        image: featuredProductImgs[index],
                                        height: 150,
                                        width: 150,
                                        title: featuredProductNames[index],
                                        price: featuredProductPrice[index],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )),
                      10.heightBox,
                      //Third Slider
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          height: 150,
                          enlargeCenterPage: true,
                          itemCount: saleSlider.length,
                          itemBuilder: (context, index) {
                            return Image.asset(saleSlider[index],
                                    fit: BoxFit.cover)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 8))
                                .make();
                          }),
                      10.heightBox,
                      Container(
                          // decoration: const BoxDecoration(color: Colors.white),
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "All Products"
                                  .text
                                  .size(18)
                                  .fontFamily(bold)
                                  .make(),
                              10.heightBox,
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: featuredProductNames.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      mainAxisExtent: context.screenHeight * 0.25),
                                  itemBuilder: (context, index) {
                                    return featuredProduct(
                                        image: featuredProductImgs[index],
                                        height: 200,
                                        width: 200,
                                        title: featuredProductNames[index],
                                        price: featuredProductPrice[index]
                                    );
                                  })
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
