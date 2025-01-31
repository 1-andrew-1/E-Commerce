import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicesSetting extends GetxService {
    late SharedPreferences sharedPreferences;
    // remember to change this after the service is created and updated in the shared preferences
    bool islogging = false ; 
    Future <ServicesSetting> init() async {
      sharedPreferences = await SharedPreferences.getInstance();
      islogging =  sharedPreferences.getBool('isLogging') ?? false ;
      userName = sharedPreferences.getString('userName') ?? 'default' ;
      userEmail = sharedPreferences.getString('userEmail') ?? 'default' ;
      return this ;
    } 
    void logging ( ) {
      islogging = !islogging ;
      sharedPreferences.setBool( 'isLogging' , islogging ) ;
    }
    String? userName;
    String? userEmail;

Future<void> getUserInfo() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Get user info from Firebase Auth
      userName = user.displayName;
      userEmail = user.email;

      // Get SharedPreferences instance
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Save values only if they're not null
      if (userName != null) {
        await prefs.setString('userName', userName!);
      } else {
        await prefs.remove('userName'); // Remove key if value is null
      }

      if (userEmail != null) {
        await prefs.setString('userEmail', userEmail!);
      } else {
        await prefs.remove('userEmail'); // Remove key if value is null
      }
    }
  } catch (e) {
    print('Error saving user information: $e');
    // Consider adding error handling/retry logic here
  }
}
}