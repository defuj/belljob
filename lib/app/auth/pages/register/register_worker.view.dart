import 'package:belljob/packages.dart';

class RegisterWorker extends StatelessWidget {
  const RegisterWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<RegisterViewModel>(
      view: () => const _RegisterView(),
      viewModel: RegisterViewModel(),
    );
  }
}

class _RegisterView extends StatelessView<RegisterViewModel> {
  const _RegisterView({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: 'label.register.worker.title'.tr,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'label.register.title'.tr,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: IColors.neutral20, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'label.register.desc'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: IColors.neutral20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 4),
                child: Text(
                  'form.label.profile_picture'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 21.0),
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(80),
                    color: IColors.neutral60,
                    child: ClipOval(
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 160,
                        height: 160,
                        decoration:
                            const BoxDecoration(color: IColors.neutral95),
                        child: Center(
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 160,
                                height: 160,
                                child: TextButton(
                                  onPressed: () => viewModel.takePictureFace(
                                      pathName: 'profilePicturePath'),
                                  child: Text(
                                    'action.tap_to_add_picture'.tr,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: IColors.neutral10),
                                  ),
                                ),
                              ),
                              viewModel.profilePicturePath == null
                                  ? Container()
                                  : ResultImageFace(
                                      imagePath:
                                          XFile(viewModel.profilePicturePath!)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (viewModel.profilePicturePath != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextButton(
                      onPressed: () => viewModel.resetPicture(
                          pathName: 'profilePicturePath'),
                      child: Text(
                        'action.change_profile_picture'.tr,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: IColors.secondary40,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.full_name'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputText(
                hintText: 'form.hint.full_name'.tr,
                onChanged: (value) => viewModel.name = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.address'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputText(
                minLines: 3,
                maxLines: 6,
                maxLength: 100,
                keyboardType: TextInputType.multiline,
                hintText: 'form.hint.address'.tr,
                onChanged: (value) => viewModel.address = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.gender'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: IColors.neutral20,
                        disabledColor: IColors.neutral20,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'label.gender.male'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: IColors.neutral20),
                        ),
                        activeColor: IColors.neutral10,
                        value: 0,
                        groupValue: viewModel.genderNum,
                        onChanged: ((value) =>
                            viewModel.updateGender(value as int)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        unselectedWidgetColor: IColors.neutral20,
                        disabledColor: IColors.neutral20,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      child: RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'label.gender.female'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: IColors.neutral20),
                        ),
                        activeColor: IColors.neutral10,
                        selectedTileColor: IColors.neutral10,
                        value: 1,
                        groupValue: viewModel.genderNum,
                        onChanged: ((value) =>
                            viewModel.updateGender(value as int)),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.job_type'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              DropdownButtons(
                dropdownValue: viewModel.job,
                list: viewModel.jobList,
                onChanged: (String value) {
                  viewModel.updateJob(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.phone'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPhoneNumber(
                hintText: 'form.hint.phone'.tr,
                onChanged: (value) => viewModel.phone = '+62$value',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.password'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPassword(
                hintText: 'form.hint.password'.tr,
                onChanged: (value) => viewModel.password = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 4),
                child: Text(
                  'form.label.password_confirmation'.tr,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: IColors.neutral10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                ),
              ),
              InputPassword(
                hintText: 'form.hint.password_confirmation'.tr,
                onChanged: (value) => viewModel.confirmPassword = value,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 16),
                child: ButtonPrimary(
                  text: 'action.register'.tr,
                  onPressed: () => viewModel.validate(
                    accountType: AccountType.worker.toString(),
                  ),
                ),
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'label.have_account'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: IColors.neutral10),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).pop(),
                        text: 'action.login'.tr,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: IColors.secondary50,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
