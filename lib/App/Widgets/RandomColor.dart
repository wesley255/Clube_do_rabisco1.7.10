import 'dart:math';
import 'package:flutter/material.dart';

class RandomColor {
  int? maxSaturasao;
  int? minSaturasoa;
  RandomColor({this.maxSaturasao, this.minSaturasoa});

  Color call() {
    int randomInt({required int max, required int min}) {
      if (max > 5) {
        int maxcathe = Random().nextInt(max);
        if (maxcathe > min) {
          return maxcathe;
        } else {
          return min;
        }
      } else {
        return 0;
      }
    }

    if (minSaturasoa != null && maxSaturasao != null) {
      return Color.fromRGBO(
        randomInt(max: maxSaturasao!, min: minSaturasoa!),
        randomInt(max: maxSaturasao!, min: minSaturasoa!),
        randomInt(max: maxSaturasao!, min: minSaturasoa!),
        0.8,
      );
    } else if (maxSaturasao != null && minSaturasoa == null) {
      return Color.fromRGBO(
        Random().nextInt(maxSaturasao!),
        Random().nextInt(maxSaturasao!),
        Random().nextInt(maxSaturasao!),
        0.8,
      );
    } else if (maxSaturasao == null && minSaturasoa != null) {
      return Color.fromRGBO(
        Random().nextInt(maxSaturasao!),
        Random().nextInt(maxSaturasao!),
        Random().nextInt(maxSaturasao!),
        0.8,
      );
    }
    return Color.fromRGBO(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
      0.8,
    );
  }
}
