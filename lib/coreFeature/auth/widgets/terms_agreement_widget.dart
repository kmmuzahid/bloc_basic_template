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
class TermsAgreementWidget extends StatelessWidget {
  final void Function(bool)? onChanged;

  const TermsAgreementWidget({this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: false,
      validator: (value) {
        if (value != true) {
          return 'You must agree to the terms';
        }
        return null;
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  isError: field.hasError,
                  value: field.value,
                  onChanged: (value) {
                    field.didChange(value);
                    if (onChanged != null) onChanged!(value ?? false);
                  },
                ),

                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 12),
                      children: [
                        TextSpan(
                          text: "By creating an account, you agree to our ",
                          style: TextStyle(color: AppColor.onPrimary),
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
                        TextSpan(
                          text: " and ",
                          style: TextStyle(color: AppColor.onPrimary),
                        ),
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
            ),
          ],
        );
      },
    );
  }
}
