// ignore_for_file: public_member_api_docs, sort_constructors_first

class OtpState {
  const OtpState({
    this.otp = '',
    this.count = 10,
    this.verificationId = '',
    this.isVerified = false,
    this.isLoading = false,
    this.username = '',
  });
  final String otp;
  final String verificationId;
  final bool isVerified;
  final String username;
  final maxCount = 10;
  final bool isLoading;
  final int count;

  OtpState copyWith({
    String? otp,
    String? verificationId,
    bool? isVerified,
    String? username,
    bool? isLoading,
    int? count,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      verificationId: verificationId ?? this.verificationId,
      isVerified: isVerified ?? this.isVerified,
      username: username ?? this.username,
      isLoading: isLoading ?? this.isLoading,
      count: count ?? this.count,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OtpState &&
        other.otp == otp &&
        other.verificationId == verificationId &&
        other.isVerified == isVerified &&
        other.username == username &&
        other.isLoading == isLoading &&
        other.count == count;
  }

  @override
  int get hashCode {
    return otp.hashCode ^
        verificationId.hashCode ^
        isVerified.hashCode ^
        username.hashCode ^
        isLoading.hashCode ^
        count.hashCode;
  }
}
