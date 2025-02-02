import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';
import 'package:online_course_app_ui/util/route_names.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/intro/intro.png'),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Grow your Skills',
                style: TextStyle(fontSize: 25, color: Colors.grey.shade900),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'choose your favourite course & start learning',
                style: TextStyle(fontSize: 27, color: Colors.grey.shade900),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // intro Screen is ready , Lets create course home screen and open it from getting started button callback handler
                  Navigator.pushNamed(context, RouteNames.myHomeScreen,);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Text(
                      'Getting Started',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
