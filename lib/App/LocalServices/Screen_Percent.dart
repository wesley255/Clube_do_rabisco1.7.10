import 'package:flutter/material.dart';

larguraDaTela(BuildContext context, double porcent) {
  return MediaQuery.of(context).size.width / 100 * porcent;
}

alturaDaTela(BuildContext context, double porcent) {
  return MediaQuery.of(context).size.height / 100 * porcent;
}
