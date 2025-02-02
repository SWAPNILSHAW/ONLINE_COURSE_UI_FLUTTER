import 'dart:async';
import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  int _selectedPromo = 0;
  late Timer timer;
  final PageController controller = PageController();

  List<Image> widgetList = [
    Image.asset(
      'assets/images/offer/offer1.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/offer/offer2.png',
      fit: BoxFit.cover,
    ),
    Image.asset(
      'assets/images/offer/offer3.png',
      fit: BoxFit.cover,
    ),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      setState(() {
        /*if (_selectedPromo < widgetList.length - 1) {
          _selectedPromo++;
        } else {
          _selectedPromo = 0;
        } */

        _selectedPromo = (_selectedPromo + 1) % widgetList.length;
      });

      if (controller.hasClients) {
        controller.animateToPage(
          _selectedPromo,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        );
      }

      // Debugging output
      print("Current page: $_selectedPromo");
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Clean up the timer to avoid memory leaks
    controller.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: widgetList.length,
            itemBuilder: (context, index) {
              return widgetList[index];
            },
            onPageChanged: (int selectedPage) {
              setState(() {
                _selectedPromo = selectedPage;
              });
            },
          ),
          // Dot indicators
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 0; index < widgetList.length; index++)
                  if (_selectedPromo == index) ...[createCircle(true)] else
                    createCircle(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to create dot indicator
  Widget createCircle(bool isCurrent) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isCurrent ? 12 : 8,
      width: isCurrent ? 12 : 8,
      decoration: BoxDecoration(
        color: isCurrent ? Colors.orange : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
