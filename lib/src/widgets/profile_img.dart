import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double size;
  final String imagePath;
  const ProfileImage({super.key,
  required this.size,
  required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: 
                imagePath==""?
                const AssetImage("assets/images/pic1.png") as ImageProvider:
                NetworkImage(imagePath)
              )
            ),
          );
  }
}