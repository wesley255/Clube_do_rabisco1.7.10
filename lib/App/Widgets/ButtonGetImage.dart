import 'package:flutter/material.dart';

class ButtonGetImage extends StatelessWidget {
  final VoidCallback? onTap;
  final double? radius;
  const ButtonGetImage({required this.onTap, this.radius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: Icon(Icons.camera_alt_outlined, size: radius),
      ),
    );
  }
}
