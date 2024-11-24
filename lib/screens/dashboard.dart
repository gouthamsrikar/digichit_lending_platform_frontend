import 'package:flutter/material.dart';
import 'package:onemoney_hack/api/services/chitfund_service.dart';
import 'package:onemoney_hack/models/api/fetch_profile_response.dart';
import 'package:onemoney_hack/screens/communties.dart';
import 'package:onemoney_hack/screens/login_page.dart';
import 'package:onemoney_hack/screens/profile_page.dart';
import 'package:onemoney_hack/screens/your_loans.dart';
import 'package:onemoney_hack/utils/navigation_utils.dart';
import 'package:onemoney_hack/widgets/side_bar.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

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

  Future<bool> fetchProfileData() async {
    int retryCount = 0;
    const int maxRetries = 5;

    while (retryCount < maxRetries) {
      try {
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

        return response.profileData?.bankStatementFetch ?? false;
      } catch (e) {
        retryCount++;
        if (retryCount == maxRetries) {
          // Log error or handle the failure as needed
          pushReplacementView(context, LoginPage());
          toastification.show(
            context: context,
            type: ToastificationType.error,
            style: ToastificationStyle.fillColored,
            icon: const Icon(Icons.error),
            description: Text(" pls try again logging in"),
            title: Text('Something went wrong while fetching your details.'),
          );

          return false; // Return false if all attempts fail
        }
        // Add a 5-second delay between retries
        await Future.delayed(Duration(seconds: 5));
      }
    }

    return false; // Fallback if somehow reaches this line
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (context, value, child) {
                  return SideBar(
                    name: profileData.name ?? '',
                    selectedIndex: selectedIndex.value,
                    isBankFetched: profileData.bankStatementFetch ?? false,
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
                            fetchProfile: () async {
                              final isfetch = await fetchProfileData();
                              if (!isfetch) {
                                toastification.show(
                                  context: context,
                                  type: ToastificationType.info,
                                  style: ToastificationStyle.fillColored,
                                  icon: const Icon(Icons.info),
                                  title: Text(
                                      'your bank details are still being processed. pls try again'),
                                );
                              }
                            },
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
