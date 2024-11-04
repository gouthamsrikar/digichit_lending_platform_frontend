import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/di/connect_token_provider.dart';
import 'package:onemoney_hack/models/api/fetch_communties_response.dart';
import 'package:onemoney_hack/ui_commons/src/widgets.dart';
import 'package:onemoney_hack/utils/navigation_utils.dart';

import '../ui_commons/equal_ui.dart';
import '../ui_commons/src/widgets/e_filled_button.dart';
import '../widgets/community_card.dart';

class LoanAmountDialog extends StatelessWidget {
  LoanAmountDialog({super.key, required this.data});

  final CommuntiesModel data;

  final ValueNotifier<double> loanAmount = ValueNotifier(0);

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
                CloseDialogButton()
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Please enter your loan amount',
              style: TextStyle(
                color: Color(0xFF58595B),
                fontSize: 16,
                fontFamily: 'Red Hat Text',
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loan Amount',
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                          fontFamily: 'Red Hat Text',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ValueListenableBuilder(
                          valueListenable: loanAmount,
                          builder: (context, value, child) {
                            return ETextField(
                              leading: Icon(
                                Icons.currency_rupee,
                                color: EColors.EQUAL_GREEN,
                              ),
                              hintText: 'Enter Loan Amount',
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                loanAmount.value = double.parse(value);
                              },
                              errorText: loanAmount.value >
                                      ((data.totalFund ?? 0) / 2)
                                  ? "Loan amount has to be less than 50% of the community fund"
                                  : null,
                            );
                          }),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Monthly Instalment Amount',
                        style: TextStyle(
                          color: Color(0xFF4E4E4E),
                          fontSize: 16,
                          fontFamily: 'Red Hat Text',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 56,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: ValueListenableBuilder(
                          valueListenable: loanAmount,
                          builder: (context, value, child) => Text(
                            loanAmount.value > 0
                                ? ((loanAmount.value +
                                            (((data.interestRate! *
                                                        loanAmount.value) /
                                                    12) *
                                                data.repaymentPeriodInMonths!)) /
                                        data.repaymentPeriodInMonths!).floorToDouble()
                                    .toString()
                                : '-',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Red Hat Text',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder(
                valueListenable: loanAmount,
                builder: (_, value, child) {
                  return EFilledButton.text(
                    onTap: loanAmount.value > 0 &&
                            loanAmount.value < ((data.totalFund ?? 0) / 2)
                        ? () async {
                            await ChitFundService().requestTLoan(
                              ConnectTokenProvider.userId,
                              data.iD!,
                              loanAmount.value,
                            );
                            popView(context);
                          }
                        : null,
                    title: 'Apply for loan',
                  );
                })
          ],
        ),
      ),
    );
  }
}

class CloseDialogButton extends StatelessWidget {
  const CloseDialogButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        popView(context);
      },
      icon: Icon(
        Icons.cancel_outlined,
        color: Colors.black,
        size: 24,
      ),
    );
  }
}
