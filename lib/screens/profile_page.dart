import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/di/connect_token_provider.dart';
import 'package:onemoney_hack/models/api/fetch_profile_response.dart';
import 'package:onemoney_hack/src/gen/assets.gen.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/widgets/community_card.dart';
import 'package:onemoney_hack/widgets/salary_chart_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({
    super.key,
    required this.profileData,
    required this.monthlyData,
  });

  ProfileData profileData;

  List<BankStatement> monthlyData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 16),
            _profileInformation(),
            const SizedBox(height: 16),
            Text(
              'Insights',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Red Hat Display',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const SizedBox(height: 16),
            ECard(
              borderColor: Color(0xFFF5F5F5),
              radius: 8,
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DigiChit Score',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Red Hat Text',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${profileData.digitScore}/100',
                            style: TextStyle(
                              color: Color(0xFF008838),
                              fontSize: 32,
                              fontFamily: 'Red Hat Mono',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            '(Powered by Onemoney)',
                            style: TextStyle(
                              color: Color(0xFF676767),
                              fontSize: 10,
                              fontFamily: 'Red Hat Text',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 60,
                        color: Color(0xFFF5F5F5),
                        width: 1,
                        margin: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Two monthly payments away from increasing your DigiChit Score',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Red Hat Text',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Make timely deposits and loan repayments to increase your score and gain access to communities with higher funds and lower interest rates',
                              style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 16,
                                  fontFamily: 'Red Hat Text',
                                  fontWeight: FontWeight.w400,
                                  height: 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AccountDataWidget(
                        title: 'Avg Monthly credit',
                        amount: formatRupees(profileData.monthlyIncome ?? 0),
                        info: 'Your average monthly incoming funds',
                      ),
                      AccountDataWidget(
                        title: 'Average Balance',
                        amount: formatRupees(profileData.avgBalance ?? 0),
                        info: 'Your average end-of-day account balance.',
                      ),
                      AccountDataWidget(
                        title: 'EMI to Income Ratio',
                        amount: '30.9%',
                        info: 'Percentage of income spent on EMIs',
                      ),
                      AccountDataWidget(
                        title: 'Credit to Debit Ratio',
                        amount:
                            '${(((profileData.creditToDebitRatio ?? 0)) * 100).floor()}%',
                        info: 'Balance between your income and spending',
                      ),
                      const SizedBox(width: 0),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 630,
                    child: SalaryExpenseBarChart(
                        data: monthlyData
                            .map((e) => SalaryExpenseData(
                                  e.monthName ?? '',
                                  e.totalCreditAmount ?? 0,
                                  e.totalDebitAmount ?? 0,
                                ))
                            .toList()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ECard _profileInformation() {
    return ECard(
      borderColor: Color(0xFFF5F5F5),
      radius: 8,
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFFEBFFC2),
                child: Text(
                  'A',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF008838),
                    fontSize: 14,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                profileData.name ?? '',
                style: TextStyle(
                  color: Color(0xFF1A1818),
                  fontSize: 32,
                  fontFamily: 'Red Hat Display',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const SizedBox(width: 12),
              VerifiedWithEqualBadge(),
              Spacer(),
              Text(
                'Joined on 04/11/2024',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF757575),
                  fontSize: 14,
                  fontFamily: 'Red Hat Text',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                ),
              )
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AmountInfoWidget(
                title: "PAN",
                amount: profileData.panNo ?? '',
              ),
              AmountInfoWidget(
                title: "Bank Account Number",
                amount: profileData.bankAccountNo ?? '',
              ),
              AmountInfoWidget(
                title: "Community Level",
                amount: profileData.communityLevel ?? '',
              ),
              const SizedBox(width: 0),
            ],
          ),
        ],
      ),
    );
  }
}

String formatRupees(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_IN', // Indian locale
    symbol: '₹', // Rupee symbol
    decimalDigits: 2,
  );
  return formatter.format(amount);
}

class AccountDataWidget extends StatelessWidget {
  const AccountDataWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.info,
  });

  final String title;
  final String amount;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 178,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFEBEBF5)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 12,
              fontFamily: 'Red Hat Text',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            amount,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Red Hat Mono',
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            info,
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 14,
              fontFamily: 'Red Hat Text',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class VerifiedWithEqualBadge extends StatelessWidget {
  const VerifiedWithEqualBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ECard(
      height: 30,
      radius: 4,
      color: Color(0xFFFAFDF5),
      borderColor: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'verified by',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Red Hat Display',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 4),
          Assets.svg.equalLogo.svg(color: EColors.EQUAL_GREEN, height: 12),
        ],
      ),
    );
  }
}
