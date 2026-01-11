/*
 * @Author: Km Muzahid
 * @Date: 2026-01-11 11:48:18
 * @Email: km.muzahid@gmail.com
 */
import 'dart:async';

import 'package:core_kit/snackbar/snackbar.dart';
import 'package:mygarage/config/bloc/safe_cubit.dart';
import 'package:mygarage/coreFeature/auth/cubit/otp_state.dart';

class OtpCubit extends SafeCubit<OtpState> {
  OtpCubit() : super(const OtpState());
  Timer? _timer;

  Future<void> resetState() async {
    emit(const OtpState());
  }

  Future<void> sendOtp(String username) async {
    if (_timer?.isActive == true) {
      showSnackBar('Resent Code in ${state.count} seconds', type: SnackBarType.warning);
      return;
    }
    emit(OtpState(isLoading: true, username: username));
    emit(state.copyWith(verificationId: '123456', isLoading: true));
    _startTimer();
  }

  Future<void> verifyOtp(String otp) async {
    if (state.isLoading || state.verificationId.isEmpty) return;
    emit(state.copyWith(isVerified: true));
  }

  void _startTimer() {
    emit(state.copyWith(count: state.maxCount));
    _timer = null;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(state.copyWith(count: state.count - 1));
      if (state.count == 0) {
        _timer?.cancel();
        _timer = null;
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
