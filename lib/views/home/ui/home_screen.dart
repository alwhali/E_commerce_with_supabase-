import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/core/component/custom_search_field.dart';
import 'package:e_commerce_app/core/component/product_card.dart';
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
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(
              url:
                  "https://i.pinimg.com/1200x/a8/fd/81/a8fd8133765aef2c20f468d68c117617.jpg",
              name: 'Hand ps',
              price: 225,
              discount: 10,
              rating: 5,
              isFavorite: true,
            );
          },
        ),
        // SizedBox(height: 50),
      ],
    );
  }
}
