import 'package:flutter/material.dart';
import 'package:onemoney_hack/screens/communties.dart';
import 'package:onemoney_hack/screens/profile_page.dart';
import 'package:onemoney_hack/screens/your_loans.dart';
import 'package:onemoney_hack/widgets/side_bar.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final ValueNotifier<int> selectedIndex = ValueNotifier(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ValueListenableBuilder(
              valueListenable: selectedIndex,
              builder: (context, value, child) {
                return SideBar(
                  selectedIndex: selectedIndex.value,
                  onChanged: (value) {
                    selectedIndex.value = value;
                  },
                );
              }),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, value, child) {
                  return value == 2
                      ? ProfilePage()
                      : value == 1
                          ? YourLoans()
                          : Communties();
                }),
          ),
        ],
      ),
    );
  }
}
