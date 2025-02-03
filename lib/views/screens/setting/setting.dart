import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/account/thebutton.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Settings'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 1,
          right: 1,
        ),
        child: Column(
          children: [
            Thebutton(ontap: () { }, icon: Icons.verified_user, text: 'Scurity'),
            Divider() ,
            Thebutton(ontap: () { }, icon: Icons.cancel, text: 'Deactivate Account'),
            Divider() ,
            Thebutton(ontap: () { }, icon: Icons.delete, text: 'Delete Account'),
            Divider() ,
          ],
        ),
      ),
    );
  }
}