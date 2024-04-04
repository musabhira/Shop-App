import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  const AppBarWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 8,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 22),
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 25,
              width: MediaQuery.sizeOf(context).width / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 231, 229, 229),
              ),
              child: Icon(Icons.keyboard_arrow_left_outlined),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
