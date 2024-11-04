import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/models/api/fetch_profile_response.dart';
import 'package:onemoney_hack/screens/communties.dart';
import 'package:onemoney_hack/screens/profile_page.dart';
import 'package:onemoney_hack/screens/your_loans.dart';
import 'package:onemoney_hack/widgets/side_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../di/connect_token_provider.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(2);

  ProfileData profileData = ProfileData();

  bool isLoading = true;

  fetchProfileData() async {
    final response = await ChitFundService().createAndFetchUserProfile(
      ConnectTokenProvider.idempotencyId,
      ConnectTokenProvider.phoneno,
    );

    profileData = response.profileData ?? ProfileData();

    monthlyData = response.bankStatement ?? [];

    ConnectTokenProvider.userId = profileData.iD!;

    setState(() {
      isLoading = false;
    });
  }

  List<BankStatement> monthlyData = [];

  @override
  void initState() {
    fetchProfileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Skeletonizer(
        enabled: isLoading,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, value, child) {
                  return SideBar(
                    name: profileData.name ?? '',
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
                        ? ProfilePage(
                            monthlyData: monthlyData,
                            profileData: profileData,
                          )
                        : value == 1
                            ? YourLoans()
                            : Communties();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
