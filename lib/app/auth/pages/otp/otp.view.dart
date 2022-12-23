import 'package:belljob/packages.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class Otp extends StatelessWidget {
  final String? phoneNumber;
  final String? nextPage;
  const Otp({super.key, required this.phoneNumber, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return MVVM<OtpViewModel>(
      view: () => const _OtpView(),
      viewModel: OtpViewModel(phoneNumber: phoneNumber, nextPage: nextPage),
    );
  }
}

class _OtpView extends StatelessView<OtpViewModel> {
  const _OtpView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: appBar(context: context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'label.input_verification_code'.tr,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: IColors.neutral10, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'label.input_verification_code_sent'.trParams({
                  'phone': viewModel.phoneNumber!,
                }),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: IColors.neutral20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 35),
              child: Expanded(
                child: OtpTextField(
                  numberOfFields: 6,
                  textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.15,
                      ),
                  obscureText: true,
                  borderColor: IColors.neutral20,
                  cursorColor: IColors.neutral20,
                  focusedBorderColor: IColors.neutral20,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    // viewModel.code = code;
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    viewModel.code = verificationCode;
                    viewModel.checkCode();
                  },
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'label.not_received_code'.tr,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: IColors.neutral20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.15,
                        ),
                  ),
                  if (!viewModel.resend)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'label.wait'.tr,
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: IColors.neutral20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.15,
                                  ),
                        ),
                        Text(
                          ' 00:${viewModel.timer} ',
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: IColors.secondary50,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.15,
                                  ),
                        ),
                      ],
                    ),
                  if (viewModel.resend)
                    InkWell(
                      onTap: viewModel.startTimer,
                      child: Text(
                        'action.resend_code'.tr,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: IColors.secondary50,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.15,
                            ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 24, bottom: 24),
              child: ButtonPrimary(
                text: 'action.confirm'.tr,
                onPressed: viewModel.checkCode,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'label.change_phone_number'.tr,
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: IColors.neutral20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.15,
                        ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text(
                      'action.change'.tr,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: IColors.secondary50,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
