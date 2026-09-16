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
        Container(
          height: 330,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: AppColors.kPrimaryColor,
            border: Border.all(color: AppColors.kPrimaryColor),
          ),
          child: Column(
            children: [
              //image of product
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/products/chose1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // detials product
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    //name of product and favorite button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.favorite, color: Colors.red),
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
