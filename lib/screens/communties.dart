import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/di/connect_token_provider.dart';
import 'package:onemoney_hack/models/api/fetch_communties_response.dart';
import 'package:onemoney_hack/models/api/fetch_loans_response.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/widgets/community_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../ui_commons/src/tokens/e_textstyle.dart';

class Communties extends StatefulWidget {
  const Communties({super.key});

  @override
  State<Communties> createState() => _CommuntiesState();
}

class _CommuntiesState extends State<Communties> {
  List<CommuntiesModel> communites = [];
  List<CommuntiesModel> joinedCommunites = [];

  bool isLoading = true;

  List<LoansModels> loans = [];

  final ChitFundService chitFundService = ChitFundService();

  // List<int?> loanAppliedCommunityIds = [];
  List<CommunityLedger?> joinRequested = [];
  List<CommunityLedger?> joined = [];

  Future<void> fetchCommunties() async {
    await fetchLoans();
    final response = await chitFundService
        .getCommunites(ConnectTokenProvider.userId.toString());
    final tempCommunites = response.communties ?? [];

    final tempCommunityLedger = response.communtyLedger ?? [];

    joined = tempCommunityLedger
        .where(
          (e) => e.state == 'APPROVED',
        )
        .toList();

    joinRequested = tempCommunityLedger
        .where(
          (e) => e.state == 'REQUESTED',
        )
        .toList();

    joinedCommunites = tempCommunites
        .where(
          (element) => joined
              .map(
                (e) => e?.communityId,
              )
              .toList()
              .contains(element.iD),
        )
        .toList();

    communites = tempCommunites
        .where(
          (element) => !joined
              .map(
                (e) => e?.communityId,
              )
              .toList()
              .contains(element.iD),
        )
        .toList();

    await Future.delayed(Durations.extralong4);
    setState(() {
      isLoading = false;
    });
  }

  Future<void> fetchLoans() async {
    final response =
        await chitFundService.getLoans(ConnectTokenProvider.userId.toString());
    loans = response.loans ?? [];
    // loanCommuntyIds = loans.map((e) => e.communityId).toList();
  }

  @override
  void initState() {
    fetchCommunties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () async {
              await fetchCommunties();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 24),
                Icon(
                  Icons.replay_outlined,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  'Click Here to Refresh',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Skeletonizer(
            enabled: isLoading,
            child: ListView.separated(
              shrinkWrap: false,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) => [
                Text(
                  'Your Communities (${joinedCommunites.length})',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // CommunityCard(
                //   isJoined: true,
                // ),
                ...List.generate(
                  joinedCommunites.length,
                  (index) => CommunityCard(
                    fetchAgain: () {
                      fetchCommunties();
                    },
                    isJoined: true,
                    isRequested: loans
                        .where((e) => e.ledgerState == 'APPROVED')
                        .map((e) => e.communityId)
                        .contains(joinedCommunites[index].iD),
                    isApprovalPending: loans
                        .where((e) => e.ledgerState == 'APPLIED')
                        .map((e) => e.communityId)
                        .contains(joinedCommunites[index].iD),
                    data: joinedCommunites[index],
                  ),
                ),
                Text(
                  'Explore Communities',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ...List.generate(
                  communites.length,
                  (index) => CommunityCard(
                    fetchAgain: () {
                      fetchCommunties();
                    },
                    isJoined: false,
                    isRequested: joinRequested
                        .map(
                          (e) => e?.communityId,
                        )
                        .toList()
                        .contains(communites[index].iD),
                    isApprovalPending: false,
                    data: communites[index],
                  ),
                )
              ][index],
              itemCount: 2 + communites.length + joinedCommunites.length,
            ),
          ),
        ),
      ],
    );
  }
}
