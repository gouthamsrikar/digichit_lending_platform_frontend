import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/di/connect_token_provider.dart';
import 'package:onemoney_hack/models/api/fetch_communties_response.dart';
import 'package:onemoney_hack/models/api/fetch_loans_response.dart';
import 'package:onemoney_hack/screens/profile_page.dart';
import 'package:onemoney_hack/ui_commons/src/widgets.dart';
import 'package:onemoney_hack/widgets/community_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../ui_commons/equal_ui.dart';

class YourLoans extends StatefulWidget {
  const YourLoans({super.key});

  @override
  State<YourLoans> createState() => _YourLoansState();
}

class _YourLoansState extends State<YourLoans> {
  List<CommuntiesModel> communites = [];

  bool isLoading = true;

  List<LoansModels> loans = [];

  final ChitFundService chitFundService = ChitFundService();

  // List<int?> loanAppliedCommunityIds = [];
  List<CommunityLedger?> joinRequested = [];
  List<CommunityLedger?> joined = [];

  Future<void> fetchCommunties() async {
    await fetchLoans();
    final response = await chitFundService.getCommunites("1");

    communites = response.communties ?? [];

    communites = communites
        .where(
          (element) => loanMap.containsKey(element.iD),
        )
        .toList();

    setState(() {
      isLoading = false;
    });
  }

  final Map<int, LoansModels> loanMap = {};

  Future<void> fetchLoans() async {
    final response =
        await chitFundService.getLoans(ConnectTokenProvider.userId.toString());
    loans = response.loans ?? [];

    loans.forEach(
      (element) {
        if (element.ledgerState == 'APPROVED') {
          loanMap[element.communityId!] = element;
        }
      },
    );
    // loanCommuntyIds = loans.map((e) => e.communityId).toList();
  }

  @override
  void initState() {
    fetchCommunties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: ListView.separated(
        shrinkWrap: false,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) => [
          Text(
            'Your Active Loans (${communites.length})',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Red Hat Text',
              fontWeight: FontWeight.w500,
            ),
          ),
          ...List.generate(
            communites.length,
            (index) => LoanCard(
              communityData: communites[index],
              loanData: loanMap[communites![index].iD!]!,
            ),
          )
        ][index],
        itemCount: communites.length + 1,
      ),
    );
  }
}

class LoanCard extends StatelessWidget {
  const LoanCard({
    super.key,
    required this.loanData,
    required this.communityData,
  });

  final LoansModels loanData;
  final CommuntiesModel communityData;

  @override
  Widget build(BuildContext context) {
    return ECard(
      width: double.infinity,
      borderColor: Colors.grey.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
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
                communityData.communityName ?? '',
                style: EtextStyle.style.size20.w600.copyWith(
                  color: Colors.black,
                ),
              ),
              Spacer(),
              ...[
                Text(
                  'NEXT REPAYMENT ON  01/12/2024',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w500,
                    height: 0.11,
                  ),
                )
              ]
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              AmountInfoWidget(
                title: "Monthly Repayment",
                amount: formatRupees(((loanData.loanAmount! +
                        (((communityData.interestRate! * loanData.loanAmount!) /
                                12) *
                            communityData.repaymentPeriodInMonths!)) /
                    communityData.repaymentPeriodInMonths!)),
              ),
              AmountInfoWidget(
                title: "Total Loan Amount",
                amount: formatRupees((loanData.loanAmount! +
                    (((communityData.interestRate! * loanData.loanAmount!) /
                            12) *
                        communityData.repaymentPeriodInMonths!))),
              ),
              AmountInfoWidget(
                title: "Loan Duration",
                amount: "${communityData.repaymentPeriodInMonths} months",
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Repayment Progress',
            style: TextStyle(
              color: Color(0xFF757575),
              fontSize: 14,
              fontFamily: 'Red Hat Text',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            decoration: ShapeDecoration(
              color: Color(0xFFF5F5F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            height: 6,
            child: Row(
              children: [
                Container(
                  width: 145,
                  height: 6,
                  decoration: ShapeDecoration(
                    color: Color(0xFF008838),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
