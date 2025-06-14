import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tools_for_you/core/constant/app_string.dart';
import 'package:tools_for_you/core/theme/app_color.dart';
import 'package:tools_for_you/core/widgets/textfield/k_textfield.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          contactCap,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColor.kPrimary),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Text(
                getInTouch,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(10),
              const KTextfield(labelText: yourName),
              const KTextfield(labelText: yourEmail),
              const KTextfield(labelText: subject),
              const KTextfield(
                labelText: message,
                maxLines: 5,
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent (mock)!')),
                  );
                  nameController.clear();
                  emailController.clear();
                  subjectController.clear();
                  messageController.clear();
                },
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(AppColor.kPrimary)),
                child: Text(
                  sendMessage,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
