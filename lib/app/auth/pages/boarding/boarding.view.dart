import 'package:belljob/repositories.dart';

class Boarding extends StatelessWidget {
  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<BoardingViewModel>(
      view: () => const _View(),
      viewModel: BoardingViewModel(),
    );
  }
}

class _View extends StatelessView<BoardingViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    // var localizationDelegate = LocalizedApp.of(context).delegate;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SlidingUpPanel(
        maxHeight: 555,
        minHeight: 0,
        parallaxEnabled: true,
        backdropEnabled: true,
        backdropOpacity: 0.5,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        controller: viewModel.panelController,
        panel: viewModel.loginType == AccountType.worker.toString()
            ? const LoginWorker()
            : const LoginEmployer(),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 56,
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const AppNameText(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ButtonCircle(
                          isChecked: viewModel.lang == 'en' ? true : false,
                          text: 'EN',
                          onPressed: () => viewModel.lang = 'en',
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: ButtonCircle(
                          isChecked: viewModel.lang == 'id' ? true : false,
                          text: 'ID',
                          onPressed: () => viewModel.lang = 'id',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 56),
                child: Image.asset(
                  'assets/images/worker.jpg',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: IColors.neutral95,
                        elevation: 0,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () =>
                          viewModel.loginType = AccountType.employer.toString(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'auth.boarding.action1.title'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: IColors.neutral10,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'auth.boarding.action1.desc'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: IColors.neutral20),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: IColors.neutral95,
                        elevation: 0,
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () =>
                          viewModel.loginType = AccountType.worker.toString(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'auth.boarding.action2.title'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: IColors.neutral10,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'auth.boarding.action2.desc'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: IColors.neutral20),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'auth.boarding.agreement.1'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: IColors.neutral20),
                    ),
                    TextSpan(
                      text: 'auth.boarding.agreement.terms'.tr,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: IColors.secondary50,
                          fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                    TextSpan(
                      text: 'auth.boarding.agreement.2'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: IColors.neutral10),
                    ),
                    TextSpan(
                      text: 'auth.boarding.agreement.privacy'.tr,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: IColors.secondary50,
                          fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = () => {},
                    ),
                    TextSpan(
                      text: 'auth.boarding.agreement.3'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: IColors.neutral10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
