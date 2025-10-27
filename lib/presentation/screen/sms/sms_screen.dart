import 'package:flutter/material.dart';

import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_image.dart';
import '../../../widget/custom_text_style.dart';

class SmsScreen extends StatefulWidget {
  const SmsScreen({super.key});

  @override
  State<SmsScreen> createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 50),
        child: Padding(
          padding: Utils.only(left: 20.0, right: 20.0, top: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Utils.horizontalSpace(8),
                  CustomImage(
                    path: KImages.profile,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: 'Will Smith',
                        fontWeight: FontWeight.w500,
                      ),
                      Utils.verticalSpace(4),
                      CustomText(
                        text: 'Customer',
                        fontSize: 12,
                        color: sTxtColor,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: Utils.all(value: 6),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CustomImage(
                  path: KImages.call,
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: Utils.symmetric(h: 24.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: const [
                  ChatBubble(
                    isSender: false,
                    message:
                        "Hello, Jr Sam! Is your AC system winter-ready?\nOur Winter AC Master Cleaning and Servicing package ensures.",
                    time: "09:00 AM",
                  ),
                  ChatBubble(
                    isSender: true,
                    message:
                        "Good morning. Yes, now I’m working on freelance projects",
                    time: "09:10 AM",
                  ),
                  ChatBubble(
                    isSender: false,
                    message: "Great! Can you send us your portfolio?",
                    time: "09:30 AM",
                  ),
                  ChatBubble(
                    isSender: true,
                    message: "Great! Can you send us your portfolio?",
                    time: "09:30 AM",
                  ),
                  ChatBubble(
                    isSender: true,
                    message: "Great! Can you send us your portfolio?",
                    time: "09:30 AM",
                  ),
                  ChatBubble(
                    isSender: false,
                    message: "Great! Can you send us your portfolio?",
                    time: "09:30 AM",
                  ),
                ],
              ),
            ),
            const ChatInputField(),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;
  final List<String>? attachments;

  const ChatBubble({
    super.key,
    required this.isSender,
    required this.message,
    required this.time,
    this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    final alignment =
        isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bgColor = isSender ? primaryColor : const Color(0xffF8FAFC);
    final textColo = isSender ? whiteColor : textColor;
    final radius = BorderRadius.only(
      topLeft: const Radius.circular(8),
      topRight: const Radius.circular(8),
      bottomLeft: Radius.circular(isSender ? 8 : 0),
      bottomRight: Radius.circular(isSender ? 0 : 8),
    );

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(color: bgColor, borderRadius: radius),
          child: CustomText(text: message, color: textColo),
        ),
        if (attachments != null && attachments!.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: alignment,
              children: [
                const CustomText(text: "Attachment", fontSize: 12),
                const SizedBox(height: 4),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: attachments!.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            attachments![index],
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        CustomText(
          text: 'Message seen at $time',
          fontSize: 10,
          color: textColor,
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: Utils.symmetric(h: 14.0, v: 14.0),
                  fillColor: const Color(0xffF8FAFC),
                  filled: true,
                  border: InputBorder.none,
                  // No border
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Type a message ...',
                  hintStyle: const TextStyle(color: Color(0xff64748B)),
                  prefixIcon: IconButton(
                    icon: const CustomImage(
                      path: KImages.imoje,
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {},
                  ),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CustomImage(
                          path: KImages.attach,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Utils.horizontalSpace(8),
                      GestureDetector(
                        onTap: () {},
                        child: CustomImage(
                          path: KImages.camera,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Utils.horizontalSpace(10),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: Utils.all(value: 10),
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: const CustomImage(
                  path: KImages.send,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
