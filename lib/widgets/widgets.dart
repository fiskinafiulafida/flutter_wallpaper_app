import 'package:flutter/material.dart';
import 'package:tugas_wallpaper/models/wallpaper_model.dart';

Widget brandName() {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16),
      children: const <TextSpan>[
        TextSpan(
            text: 'Wallpaper',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        TextSpan(
            text: 'Hub',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue))
      ],
    ),
  );
}

Widget wallpapersList({required List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
          child: Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                wallpaper.src.portrait,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
