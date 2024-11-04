import 'package:flutter/material.dart';
import 'package:onemoney_hack/di/connect_token_provider.dart';
import 'package:onemoney_hack/screens/dashboard.dart';
import 'package:onemoney_hack/src/gen/assets.gen.dart';
import 'package:onemoney_hack/ui_commons/equal_ui.dart';
import 'package:onemoney_hack/utils/navigation_utils.dart';
import 'package:onemoney_hack/view_model.dart';
import 'package:toastification/toastification.dart';

import '../handlers/base_handler.dart';

class LoginDialog extends StatefulWidget {
  LoginDialog({super.key});

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  final ValueNotifier<String> phone = ValueNotifier("");

  final aaData = '''
{
  "account_details": {
    "account_number": "1234567890",
    "bank_name": "XYZ Bank",
    "account_type": "Savings",
    "currency": "INR"
  },
  "transactions": [
    {
      "date": "2023-06-01",
      "description": "Salary Credit - ABC Corp",
      "type": "Credit",
      "amount": 50000,
      "balance": 50000
    },
    {
      "date": "2023-06-05",
      "description": "ATM Withdrawal",
      "type": "Debit",
      "amount": 5000,
      "balance": 45000
    },
    {
      "date": "2023-06-15",
      "description": "Grocery Store",
      "type": "Debit",
      "amount": 3500,
      "balance": 41500
    },
    {
      "date": "2023-07-01",
      "description": "Salary Credit - ABC Corp",
      "type": "Credit",
      "amount": 50000,
      "balance": 91500
    },
    {
      "date": "2023-07-10",
      "description": "Electricity Bill",
      "type": "Debit",
      "amount": 2000,
      "balance": 89500
    },
    {
      "date": "2023-07-20",
      "description": "Online Shopping - Flipkart",
      "type": "Debit",
      "amount": 3000,
      "balance": 86500
    },
    {
      "date": "2023-08-01",
      "description": "Salary Credit - ABC Corp",
      "type": "Credit",
      "amount": 50000,
      "balance": 136500
    },
    {
      "date": "2023-08-12",
      "description": "Dining - Restaurant XYZ",
      "type": "Debit",
      "amount": 1500,
      "balance": 135000
    },
    {
      "date": "2023-08-25",
      "description": "Fuel Station",
      "type": "Debit",
      "amount": 2500,
      "balance": 132500
    },
    {
      "date": "2023-09-01",
      "description": "Salary Credit - ABC Corp",
      "type": "Credit",
      "amount": 50000,
      "balance": 182500
    },
    {
      "date": "2023-09-08",
      "description": "Mobile Recharge",
      "type": "Debit",
      "amount": 399,
      "balance": 182101
    },
    {
      "date": "2023-09-18",
      "description": "Credit Card Payment",
      "type": "Debit",
      "amount": 10000,
      "balance": 172101
    },
    {
      "date": "2023-10-01",
      "description": "Salary Credit - ABC Corp",
      "type": "Credit",
      "amount": 50000,
      "balance": 222101
    },
    {
      "date": "2023-10-15",
      "description": "Grocery Store",
      "type": "Debit",
      "amount": 4000,
      "balance": 218101
    },
    {
      "date": "2023-10-30",
      "description": "Insurance Premium",
      "type": "Debit",
      "amount": 5000,
      "balance": 213101
    },
    {
      "date": "2023-11-01",
      "description": "Salary Credit - ABC Corp",
      "type": "Credit",
      "amount": 50000,
      "balance": 263101
    },
    {
      "date": "2023-11-10",
      "description": "Rent Payment",
      "type": "Debit",
      "amount": 20000,
      "balance": 243101
    },
    {
      "date": "2023-11-20",
      "description": "Fuel Station",
      "type": "Debit",
      "amount": 2500,
      "balance": 240601
    }
  ]
}
''';

  final viewModel = ViewModel();

  bool isEventInitiated = true;

  @override
  void initState() {
    BaseHandler.getHandler().addWindowListener('message', (data, onHandled) {
      if (data['eventType'] == 'EQUAL_SDK_CALLBACK') {
        if (data['status'] == 'ON_SUBMIT') {
          Future.delayed(const Duration(seconds: 1), () {
            viewModel.transactionId = data['transaction_id'];
            pushView(context, Dashboard());
            viewModel.setState(ApiStates.success);
          });
        } else {
          String? errorMessage = data['message'] ??
              'You have exited the verification journey. Please try again';
          viewModel.setState(ApiStates.error);
          if (isEventInitiated) {
            toastification.show(
              context: context,
              type: ToastificationType.error,
              style: ToastificationStyle.fillColored,
              icon: const Icon(Icons.error_outline),
              title: Text(errorMessage ?? ''),
            );
            isEventInitiated = false;
          }
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ECard(
      width: 400,
      padding: EdgeInsets.all(24),
      radius: 24,
      borderColor: Colors.transparent,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 24,
                      fontFamily: 'Red Hat Text',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Secure digital chit funds',
                    style: TextStyle(
                      color: Color(0xFF4E4E4E),
                      fontSize: 16,
                      fontFamily: 'Red Hat Text',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Assets.svg.digiLoans.svg(),
              const SizedBox(width: 4),
              const Text(
                'DigiChits',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 19.41,
                  fontFamily: 'Red Hat Text',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(height: 48),
          const Text(
            'Login/Signup',
            style: TextStyle(
              color: Color(0xFF4E4E4E),
              fontSize: 16,
              fontFamily: 'Red Hat Text',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ETextField.mobileInput(
            borderColor: Color(0xffE8F2FA),
            onChanged: (value) {
              phone.value = value;
            },
          ),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.flash_on_sharp,
                  color: Colors.yellow[600],
                ),
                const SizedBox(width: 8),
                const Text(
                  'Verify and join your first chit in 5 mins',
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontFamily: 'Red Hat Text',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ValueListenableBuilder(
              valueListenable: phone,
              builder: (context, value, child) {
                return EFilledButton(
                  onTap: phone.value.length == 10
                      ? () async {
                          ConnectTokenProvider.phoneno = phone.value;
                          viewModel.sdkInit(
                            mobile: phone.value,
                          );
                          // final data =
                          //     await OpenaiRepo().generateInsights(aaData);
                          // ELogger.get().info(data);
                          // pushReplacementView(context, Dashboard());
                        }
                      : null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login using',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Red Hat Display',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Assets.svg.equalLogo.svg(),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
