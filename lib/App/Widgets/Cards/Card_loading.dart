import 'package:flutter/material.dart';

class CardLoading {
  final BuildContext context;
  final Widget? child;

  CardLoading({this.child, required this.context});
  claseCard() {
    Navigator.pop(context);
  }

  Future<void> showMyDialog(String titulo, bool? close) {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          title: child ??
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: (close == null || close == false)
                          ? Colors.greenAccent
                          : Colors.redAccent),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff113043),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        titulo,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }
}
