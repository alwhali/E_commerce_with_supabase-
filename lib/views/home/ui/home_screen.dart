import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_search_field.dart';
import 'package:e_commerce_app/views/auth/ui/widgets/custom_ebtn.dart';
import 'package:e_commerce_app/views/home/ui/widget/categories_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        CustomSearchField(),
        SizedBox(height: 20),
        // image of buy
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/buy.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),

        SizedBox(height: 20),
        //popular categories
        Text(
          "Popular Categories",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        //categories list
        SizedBox(
          height: 100,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CustomElementCategory(icon: Icons.sports, title: "Sports"),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.laptop_chromebook_sharp,
                title: "Electronics",
              ),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.collections_outlined,
                title: "Collections",
              ),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.menu_book_sharp,
                title: "Books",
              ),
              SizedBox(width: 12),
              CustomElementCategory(icon: Icons.gamepad, title: "Games"),
              SizedBox(width: 12),
              CustomElementCategory(
                icon: Icons.auto_stories_sharp,
                title: "Auto",
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Recent Product
        Text(
          "Recent Products",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        // card of product
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 330,
          // width: double.infinity,
          // decoration: BoxDecoration(
          // BorderRadius: BorderRadius.circular(10),
          // color: AppColors.kPrimaryColor,
          // border: Border.all(color: AppColors.kPrimaryColor),
          // ),
          child: Column(
            children: [
              //image of product and discount
              Stack(
                children: [
                  // Container(
                  //   height: 180,
                  //   width: double.infinity,
                  //   // decoration: BoxDecoration(
                  //   //   borderRadius: BorderRadius.circular(10),
                  //   //   color: Colors.white,
                  //   //   image: DecorationImage(
                  //   //     // image: AssetImage(
                  //   //     //   "assets/images/products/hand_ps.jpg",
                  //   //     // ),
                  //   //     image: NetworkImage(
                  //   //       // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKNK0zHnhNNnvuR3OxHUNCW1TmEe_x_ttWY2hxIdFaTzriDH9a54trGrnQ&s=10",
                  //   //       "https://i.pinimg.com/1200x/3d/60/cb/3d60cbaf1a8349ed22d1c6a74ca22971.jpg",
                  //   //     ),

                  //   //     fit: BoxFit.fitWidth,
                  //   //   ),
                  //   // ),
                  //   child: CachedNetworkImage(
                  //     imageUrl:
                  //         "https://i.pinimg.com/1200x/3d/60/cb/3d60cbaf1a8349ed22d1c6a74ca22971.jpg",
                  //     fit: BoxFit.fitWidth,
                  //     placeholder: (context, url) => SizedBox(
                  //       height: 50,
                  //       width: 50,
                  //       child: CircularProgressIndicator(
                  //         color: AppColors.kPrimaryColor,
                  //       ),
                  //     ),
                  //     errorWidget: (context, url, error) => SizedBox(
                  //       height: 50,
                  //       width: 50,
                  //       child: Icon(Icons.error, color: Colors.red),
                  //     ),
                  //   ),
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      height: 180,
                      width: double.infinity,
                      imageUrl:
                          // "https://i.pinimg.com/1200x/3d/60/cb/3d60cbaf1a8349ed22d1c6a74ca22971.jpg",
                          "https://i.pinimg.com/1200x/a8/fd/81/a8fd8133765aef2c20f468d68c117617.jpg",
                      fit: BoxFit.fitWidth,
                      placeholder: (context, url) => SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Center(
                          child: Icon(Icons.error, color: Colors.red, size: 38),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    child: Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "10% OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // detials product
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 12,
                ),
                child: Column(
                  children: [
                    //name of product and favorite button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hand ps",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.favorite, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    // price of product and buy button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //price now and before
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "223 LE",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "290 LE",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 16,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        // buy button
                        CustomEBtn(
                          text: Text(
                            "Buy Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {},
                          width: 114,
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 500),
      ],
    );
  }
}
