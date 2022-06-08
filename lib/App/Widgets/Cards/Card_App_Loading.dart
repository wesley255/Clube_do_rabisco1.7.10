import 'package:flutter/material.dart';

class CardAppLoading extends StatelessWidget {
  const CardAppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 100 * 25,
            ),
            Image.asset('images/logo.png'),
            Container(
              margin: const EdgeInsets.only(top: 100),
              width: 60,
              height: 60,
              child: const CircularProgressIndicator(
                strokeWidth: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
