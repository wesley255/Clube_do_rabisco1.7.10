// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class _ShowFullimage extends StatelessWidget {
  String url;
  BuildContext context;
  _ShowFullimage({required this.url, required this.context});

  @override
  Widget build(BuildContext _context) {
    return Scaffold(
      body: InteractiveViewer(
        maxScale: 10,
        child: Center(
          child: Image.network(url),
        ),
      ),
    );
  }
}

class ImageClick extends StatelessWidget {
  String url;
  ImageClick({required this.url});

  _show(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _ShowFullimage(url: url, context: context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _show(context),
      child: Image(
        image: NetworkImage(url),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
