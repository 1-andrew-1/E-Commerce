import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';

class Customglobelbutton extends StatelessWidget {
  final String buttonname;
  final VoidCallback onPressed;
  const Customglobelbutton(
      {super.key, required this.buttonname, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: Sizeconig.defaultsize! * 6,
      decoration: BoxDecoration(
          color: const Color(0xFF31363F),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(color: Colors.black, spreadRadius: 2.0, blurRadius: 4.0),
          ]),
      child: TextButton(
          onPressed: () {
            onPressed();
          },
          child: Text(
            buttonname,
            style: TextStyle(
              fontSize: Sizeconig.defaultsize! * 1.9,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )),
    );
  }
}

class Authbutton extends StatelessWidget {
  const Authbutton(
      {super.key,
      required this.imageauth,
      required this.textauth,
      required this.onPressed});
  final String imageauth;
  final String textauth;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: Sizeconig.defaultsize! * 2,
            right: Sizeconig.defaultsize! * 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:  Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.0,
                  blurRadius: 8.0
                ),
            ]),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            onPressed: () {
              onPressed();
            },
            child: ListTile(
              leading:
                  Image.asset(imageauth, height: Sizeconig.defaultsize! * 3.5),
              title: Text(
                textauth,
                style: TextStyle(
                  fontSize: Sizeconig.defaultsize! * 1.6,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing:
                  Icon(Icons.arrow_forward, size: Sizeconig.defaultsize! * 3.5),
            )));
  }
}

class IconButtonWidget extends StatelessWidget {
  final IconData? name;
  final VoidCallback onPressed;
  const IconButtonWidget({super.key, this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: Icon(
        name,
        size: Sizeconig.defaultsize! * 2.7,
        color: Colors.white,
      ), // Use the passed name variable
    );
  }
}

class Textbuttonwidget extends StatelessWidget {
  const Textbuttonwidget(
      {super.key,
      required this.name,
      required this.onPressed,
      required this.isSelected});
  final String name;
  final VoidCallback onPressed;
  final bool isSelected; // لتحديد ما إذا كان هذا الزر هو المختار

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            color: isSelected
                ? Colors.white
                : Colors
                    .black, // تغيير لون النص بناءً على ما إذا كان الزر مختارًا
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
