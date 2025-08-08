import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tool_kit_hub/core/constant/app_string.dart';
import 'package:tool_kit_hub/core/theme/app_color.dart';
import 'package:tool_kit_hub/core/utils/extensions/context_extension.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          aboutCap,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: AppColor.kPrimary),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  welcomeToToolverse,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColor.kPrimary),
                ),
                const Text(firstPara),
                RichText(
                  text: TextSpan(
                      text: ourMission,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColor.kPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                      children: <TextSpan>[
                        TextSpan(
                            text: missionPara,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ]),
                ),
                const Gap(10),
                Text(
                  whatWeOffer,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColor.kPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Text(offers),
                const Text(lastPara),
                const Gap(20),
                const Text(
                  thankYou,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
