import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:gpt_clone/services/chat_web_service.dart';
import 'package:gpt_clone/theme/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;

  String fullResponse = '''
Perfect — let’s build you a lean recomposition plan (lose skinny fat, gain definition) around your current lifestyle and food habits.

High-Level Insight
Skinny fat means you have relatively low muscle mass and higher body fat % — often due to:
Inconsistent training (especially resistance work)
High carb + low protein intake
Sedentary lifestyle and poor sleep
The goal isn’t just “fat loss.” It’s body recomposition → lose fat while gaining muscle.
This happens by combining:
Resistance training
High-protein moderate-carb diet
Recovery and metabolism optimization
Diet Framework for You
You’re eating:
4 eggs/day (excellent — ~24g protein)
Indian meals (breakfast + lunch)
Let’s optimize this instead of overhauling it.
1️ Protein Target
Aim for 1.6–2g protein per kg body weight.
If you’re 65 kg → 100–120g protein/day.
You already get ~24g from eggs, so you’ll need another 70–90g from:
Paneer / tofu / chicken / fish (100g = ~20g protein)
Dal, rajma, chana (1 cup = 15–20g)
Greek curd or whey protein shake (20–25g)
🧩 Why: Protein improves muscle gain + leptin sensitivity, reducing fat storage.''';

  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if (isLoading) {
        fullResponse = "";
      }
      setState(() {
        fullResponse += data['data'];
        isLoading = false;
      });
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Perplexity', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        const SizedBox(height: 6),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: fullResponse,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10)
              ),
              code: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}