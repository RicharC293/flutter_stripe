import 'package:json_annotation/json_annotation.dart';

part 'payment_sheet.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentSheetApplePayParams {
  final bool applePay;
  final String? merchantCountryCode;

  PaymentSheetApplePayParams({
    this.applePay = false,
    this.merchantCountryCode,
  }) : assert(
          !applePay || merchantCountryCode != null,
          'merchantCountryCode is required when using apple pay',
        );

              factory PaymentSheetApplePayParams.fromJson(Map<String, dynamic> json) =>
      _$PaymentSheetApplePayParamsFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentSheetApplePayParamsToJson(this);
}
@JsonSerializable(explicitToJson: true)
class SetupPaymentSheetParams extends PaymentSheetApplePayParams {
  final String customerId;
  final String customerEphemeralKeySecret;
  final String paymentIntentClientSecret;
  final bool? customFlow;
  final String? merchantDisplayName;

 final  PaymentSheetBrightness? style;

  SetupPaymentSheetParams( {
    required this.customerId,
    required this.customerEphemeralKeySecret,
    required this.paymentIntentClientSecret,
    this.customFlow,
    this.merchantDisplayName,
    bool applePay = false,
    String? merchantCountryCode,
    this.style,
  });

        factory SetupPaymentSheetParams.fromJson(Map<String, dynamic> json) =>
      _$SetupPaymentSheetParamsFromJson(json);
  Map<String, dynamic> toJson() => _$SetupPaymentSheetParamsToJson(this);
}

enum PaymentSheetBrightness { alwaysLight, alwaysDark, automatic } // This should be sync with the theme

enum PaymentSheetError { Failed, Canceled }

@JsonSerializable(explicitToJson: true)
class PaymentOption {
  final String label;
  final String image;

  PaymentOption(this.label, this.image);

  factory PaymentOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentOptionToJson(this);
}