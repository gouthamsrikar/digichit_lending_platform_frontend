import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:onemoney_hack/openai_model.dart';

class OpenaiRepo {
  OpenaiRepo() {
    OpenAI.apiKey = '';
    OpenAI.showLogs = false;
  }

  Future<dynamic> generateInsights(String data) async {
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          '''Analyze the given bank statement data json and give the following insights in a json format
{
  "Average Monthly Salary Amount": "43,777.13",
  "Average EoD Balance": "9,199.45",
  "Credit to Debit Ratio": "0.95",
  "Average Monthly EMI": "13,514.81",
  "Total Credit Txns": "175",
  "Total Debit Txns": "515",
  "Total EMI Amount": "108,118.50",
  "Total Salary Amount": "350,217.00"
}
''',
        ),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "$data",
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );

    final requestMessages = [
      systemMessage,
      userMessage,
    ];

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      seed: 6,
      messages: requestMessages,
      temperature: 0.2,
    );

    return chatCompletion.choices.first.message.content?.first.text;

    //  NextQuestionModel.fromJson(
    //   await jsonDecode(chatCompletion.choices.first.message.content?.first.text
    //           ?.toLowerCase() ??
    //       '{}'),
    // );
  }
}
