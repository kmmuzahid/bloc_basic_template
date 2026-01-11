import 'package:core_kit/core_kit.dart';
import 'package:core_kit/text_field/input_formatters/input_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygarage/config/color/app_color.dart';
import 'package:mygarage/coreFeature/auth/cubit/otp_cubit.dart';
import 'package:mygarage/coreFeature/auth/cubit/otp_state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputWidget extends StatefulWidget {
  const OtpInputWidget({
    required this.onSuccess,
    required this.state,
    required this.username,
    super.key,
  });
  final Function onSuccess;
  final OtpState state;
  final String username;
  @override
  State<OtpInputWidget> createState() => _OtpVerifyWidgetState();
}

class _OtpVerifyWidgetState extends State<OtpInputWidget> {
  late TextEditingController controller;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Form(key: formKey, child: _otpBuilder(context)),

      _resendOtpTimerBuilder(widget.state).end,
      20.height,
      CommonButton(
        titleText: 'Verify OTP',
        isLoading: false,
        buttonWidth: 160,
        buttonHeight: 40.h,
        titleSize: 12,
        titleWeight: FontWeight.w500,
        onTap: () {
          if (formKey.currentState?.validate() == true) {
            context.read<OtpCubit>().verifyOtp(controller.text);
            widget.onSuccess();
          }
        },
      ),
    ],
  );

  Widget _resendOtpTimerBuilder(OtpState state) {
    return state.count == 0
        ? _resendMessageBuilder(state)
        : CommonText(
            alignment: MainAxisAlignment.end,
            text: 'Resend Code in ${state.count} seconds',
            fontWeight: FontWeight.bold,
            textColor: AppColor.primary,
          );
  }

  Widget _resendMessageBuilder(OtpState state) => Align(
    alignment: Alignment.centerRight,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Didnt Recive Code?',
            style: TextStyle(
              color: getTheme.textTheme.bodySmall?.color,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),

          /// Sign Up Button here
          TextSpan(
            text: ' Resend Code',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.read<OtpCubit>().sendOtp(widget.username);
              },
            style: TextStyle(color: AppColor.primary, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );

  Widget _otpBuilder(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autoDisposeControllers: false,
      cursorColor: getTheme.textSelectionTheme.cursorColor,
      textStyle: getTheme.textTheme.bodyMedium?.copyWith(fontSize: 25, color: AppColor.primary),
      appContext: context,
      autoFocus: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        fieldHeight: 40,
        fieldWidth: 40,
        activeFillColor: Colors.transparent,
        selectedFillColor: Colors.transparent,
        inactiveFillColor: Colors.transparent,
        borderWidth: 0.1,
        selectedColor: getTheme.primaryColor.withAlpha(80),
        activeColor: getTheme.primaryColor.withAlpha(80),
        inactiveColor: getTheme.primaryColor.withAlpha(80),
      ),
      length: 6,
      keyboardType: InputHelper.getKeyboardType(ValidationType.validateOTP),
      inputFormatters: InputHelper.getInputFormatters(ValidationType.validateOTP),
      autovalidateMode: AutovalidateMode.disabled,
      enableActiveFill: true,
      validator: (value) => InputHelper.validate(ValidationType.validateOTP, value),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
