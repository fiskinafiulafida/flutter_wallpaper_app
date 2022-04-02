import 'package:flutter/material.dart';
import 'package:tugas_wallpaper/widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get searchController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: Container(
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
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "search wallpapers", border: InputBorder.none),
            )),
            InkWell(
                onTap: () {
                  if (searchController.text != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchView(
                                  search: searchController.text,
                                )));
                  }
                },
                child: Container(child: Icon(Icons.search)))
          ],
        ),
      ),
    );
  }

  SearchView({search}) {}
}
