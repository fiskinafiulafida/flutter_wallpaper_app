import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tugas_wallpaper/data/data.dart';
import 'package:tugas_wallpaper/models/categories_model.dart';
import 'package:tugas_wallpaper/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoriesModel> categories = [];

  getTrendingWallpaper() async  {
    var response = await http.get("https://api.pexels.com/v1/curated?per_page=15&page=1",
          headers: {"Authorization": apiKEY});

          // print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      // print(element);

    });
  }

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.symmetric(horizontal: 24),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search Wallpaper",
                          border: InputBorder.none),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return CategoriesTile(
                    title: categories[index].categoriesName,
                    imgUrl: categories[index]imgUrl.toString(),
                  );
                }),
            )
          ],
        ),
      ),
    );
  }
}

class CategoriesTile extends StatelessWidget {
  final String imgUrls, title;

  CategoriesTile(@required this.title,@required this.imgUrls);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 4),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imgUrls,height: 50,
              width: 100,
              fit: BoxFit.cover,)),
            Container(
              color: Colors.black26,
              height: 50,
              width: 100,
              alignment: Alignment.center,
              child: Text(title, style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),),
            ),
        ],
      ),
    );
  }
}
