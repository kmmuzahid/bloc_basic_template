/*
 * @Author: Km Muzahid
 * @Date: 2026-01-08 17:09:20
 * @Email: km.muzahid@gmail.com
 */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/config/route/app_router.dart';
import 'package:mygarage/config/route/app_router.gr.dart';

class TermsAgreementWidget extends StatefulWidget {
  final void Function(bool)? onChanged;
  const TermsAgreementWidget({this.onChanged, super.key});

  @override
  State<TermsAgreementWidget> createState() => _TermsAgreementWidgetState();
}

class _TermsAgreementWidgetState extends State<TermsAgreementWidget> {
  bool _agreed = false;

  void _toggleAgreement(bool? value) {
    setState(() {
      _agreed = value ?? false;
    });
    if (widget.onChanged != null) widget.onChanged!(_agreed);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      children: [
        // Checkbox
        Checkbox(value: _agreed, onChanged: _toggleAgreement),

        // Text with clickable links
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: AppColor.onPrimary, fontSize: 12),
              children: [
                TextSpan(
                  text: "By creating an account, you agree to our ",
                  style: TextStyle(color: AppColor.onPrimary, fontSize: 12),
                ),
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                    color: AppColor.accentColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      appRouter.push(const TermsOfUseRoute());
                    },
                ),
                const TextSpan(text: " and "),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    color: AppColor.accentColor,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      appRouter.push(const PrivacyPolicyRoute());
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
