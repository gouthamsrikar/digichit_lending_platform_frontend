import 'dart:math';

import 'package:flutter/material.dart';
import 'package:onemoney_hack/screens/your_loans.dart';
import 'package:onemoney_hack/src/gen/assets.gen.dart';

import '../ui_commons/equal_ui.dart';
import '../ui_commons/src/widgets/e_filled_button.dart';

class SideBar extends StatelessWidget {
  SideBar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 238,
      color: Color(0xffF1F7F2),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.svg.digiLoans.svg(),
              const SizedBox(width: 0),
              Text(
                'DigiChits',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Red Hat Text',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          EFilledButton(
            onTap: () {
              onChanged(0);
            },
            enabledButtonTextColor:
                selectedIndex == 0 ? EColors.EQUAL_GREEN : Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.people,
                    color: selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Communities',
                    style: EtextStyle.style.size20.w500.copyWith(
                      color: selectedIndex == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          EFilledButton(
            onTap: () {
              onChanged(1);
            },
            enabledButtonTextColor:
                selectedIndex == 1 ? EColors.EQUAL_GREEN : Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.currency_rupee_sharp,
                    color: selectedIndex == 1 ? Colors.white : Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Your Loans',
                    style: EtextStyle.style.size20.w500.copyWith(
                      color: selectedIndex == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Text(
            'YOUR PROFILE',
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 12,
              fontFamily: 'Red Hat Text',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const SizedBox(height: 4),
          EFilledButton(
            enabledButtonTextColor:
                selectedIndex == 2 ? Color(0xFF008838) : Colors.white,
            onTap: () {
              onChanged(2);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xFFEBFFC2),
                    child: Text(
                      'A',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF008838),
                        fontSize: 8,
                        fontFamily: 'Red Hat Text',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      'Anand Sreekumar Menon',
                      style: TextStyle(
                          color: selectedIndex == 2
                              ? Colors.white
                              : Color(0xFF008838),
                          fontSize: 16,
                          fontFamily: 'Red Hat Text',
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Transform.rotate(
                    angle: selectedIndex == 2 ? pi / 2 : 0,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      color:
                          selectedIndex == 2 ? Colors.white : Color(0xFF008838),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
