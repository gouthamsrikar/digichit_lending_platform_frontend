import 'package:flutter/material.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';

class RequestForLoan extends StatelessWidget {
  const RequestForLoan({super.key});

  @override
  Widget build(BuildContext context) {
    return ECard(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(children: [
        CircleAvatar(
          backgroundColor: Color(0xffEBFFC2),
          child: Icon(
            Icons.people,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          'Swiggy Driver Cyberabad Fund',
          style: EtextStyle.style.size20.w600.copyWith(
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Please enter your loan amount',
          style: EtextStyle.style.size16.w500.copyWith(
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 24),
      ]),
    );
  }
}
