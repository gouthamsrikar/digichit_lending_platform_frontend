import 'package:flutter/material.dart';
import 'package:onemoney_hack/models/api/fetch_communties_response.dart';
import 'package:onemoney_hack/screens/profile_page.dart';
import 'package:onemoney_hack/screens/request_for_loan_dialog.dart';
import 'package:onemoney_hack/screens/request_to_join_dialog.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/utils/navigation_utils.dart';

class CommunityCard extends StatelessWidget {
  const CommunityCard({
    super.key,
    required this.isJoined,
    required this.isRequested,
    required this.data,
    required this.isApprovalPending,
    required this.fetchAgain,
  });

  final VoidCallback fetchAgain;

  final bool isJoined;
  final bool isRequested;
  final CommuntiesModel data;
  final bool isApprovalPending;

  @override
  Widget build(BuildContext context) {
    return ECard(
      width: double.infinity,
      borderColor: Colors.grey.withOpacity(0.2),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
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
              ...isJoined
                  ? [
                      Text(
                        'NEXT DEPOSIT ON  01/12/2024',
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
                  : [
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: ShapeDecoration(
                          color: Color(0xFFEBFFC2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Text(
                          '${data.userCount}/${data.maxCount} members',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFF008838),
                            fontSize: 14,
                            fontFamily: 'Red Hat Text',
                            fontWeight: FontWeight.w500,
                          ),
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
            ],
          ),
          const SizedBox(height: 24),
          Center(
            child: InkWell(
              onTap: () {
                if (!isRequested) {
                  if (!isApprovalPending) {
                    showEqDialog(
                      context,
                      !isJoined
                          ? RequestToJoinDialog(
                              data: data,
                              fetchAgain: fetchAgain,
                            )
                          : RequestForLoanDialog(
                              data: data,
                              fetchAgain: fetchAgain,
                            ),
                    );
                  }
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isJoined
                        ? isApprovalPending
                            ? 'LOAN APPROVAL PENDING'
                            : isRequested
                                ? 'VIEW DETAILS'
                                : 'REQUEST FOR LOAN'
                        : isRequested
                            ? 'APPROVAL PENDING'
                            : 'CLICK TO JOIN',
                    style: EtextStyle.style.size14.w500.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (!isRequested && !isApprovalPending)
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.grey,
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

class AmountInfoWidget extends StatelessWidget {
  const AmountInfoWidget({
    super.key,
    required this.title,
    required this.amount,
  });

  final String title;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: EtextStyle.style.size14.w500.copyWith(
              color: Color(0xff757575),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ECard(
                  borderColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  color: Colors.grey.withOpacity(0.2),
                  child: Text(
                    amount,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Red Hat Mono',
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
