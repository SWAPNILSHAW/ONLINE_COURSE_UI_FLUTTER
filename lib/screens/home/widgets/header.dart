import 'package:flutter/material.dart';
import 'package:online_course_app_ui/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome Swapnil',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Lets learn something new today!',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: kOptionColor, // this color constant define in constant.dart file
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(Icons.notifications, color: Colors.white),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      )
                      ],
                    ),
                  ),
                  // mow lets show badge on bell icon, so I will be wrapping icon widget inside
                  // Stack widget
                  ),
              // we have shown bell icon , now lets show the profile icon
              const SizedBox( width: 10,),
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                      color: kOptionColor, // this color constant define in constant.dart file
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: const Icon(Icons.person,color: Colors.white,)
              )
            ],
          )
        ],
      ),
    );
  }
}
