import 'package:flutter/material.dart';
import 'package:onemoney_hack/models/api/fetch_communties_response.dart';
import 'package:onemoney_hack/screens/loan_amount_dialog.dart';
import 'package:onemoney_hack/screens/profile_page.dart';
import 'package:onemoney_hack/utils/navigation_utils.dart';
import 'package:onemoney_hack/widgets/community_card.dart';

import '../ui_commons/equal_ui.dart';

class RequestForLoanDialog extends StatelessWidget {
  const RequestForLoanDialog(
      {super.key, required this.data, required this.fetchAgain});
  final VoidCallback fetchAgain;
  final CommuntiesModel data;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ECard(
        width: 994,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        borderColor: Colors.transparent,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffEBFFC2),
                  child: Icon(
                    Icons.people,
                    color: EColors.EQUAL_GREEN,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  data.communityName ?? '',
                  style: EtextStyle.style.size20.w600.copyWith(
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                ...[
                  Text(
                    'NEXT DEPOSIT ON  01/12/2024',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF757575),
                      fontSize: 14,
                      fontFamily: 'Red Hat Text',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CloseDialogButton()
                ]
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    data.communityDescription ?? '',
                    style: TextStyle(
                      color: Color(0xFF58595B),
                      fontSize: 16,
                      fontFamily: 'Red Hat Text',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Text(
                  'Admin:',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFEBFFC2),
                  child: Text(
                    (data.adminName ?? '')[0].toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF008838),
                      fontSize: 14,
                      fontFamily: 'Red Hat Text',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  data.adminName ?? '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AmountInfoWidget(
                    title: "Monthly Deposit",
                    amount: formatRupees(data.monthlyDeposit ?? 0),
                  ),
                  AmountInfoWidget(
                    title: "Total Fund",
                    amount: formatRupees(data.totalFund ?? 0),
                  ),
                  AmountInfoWidget(
                    title: "Monthly Interest rate",
                    amount: "${((data.interestRate ?? 0) * 100)}%",
                  ),
                ]),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                AmountInfoWidget(
                  title: "Max withdrawal",
                  amount: formatRupees((data.totalFund ?? 0) / 2),
                ),
                AmountInfoWidget(
                  title: "Repayment Period",
                  amount: "${data.repaymentPeriodInMonths ?? 1} months",
                ),
                SizedBox(
                  width: 200,
                )
              ],
            ),
            const SizedBox(height: 24),
            EFilledButton.text(
              onTap: () {
                popView(context);
                showEqDialog(
                  context,
                  LoanAmountDialog(
                    data: data,
                  ),
                  onThen: (value) {
                    fetchAgain();
                  },
                );
              },
              title: 'Request for Loan',
            )
          ],
        ),
      ),
    );
  }
}
