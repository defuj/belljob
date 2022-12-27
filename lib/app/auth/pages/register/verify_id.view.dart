import 'package:belljob/repositories.dart';

class VerifyID extends StatelessWidget {
  const VerifyID({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<RegisterViewModel>(
      view: () => const _View(),
      viewModel: RegisterViewModel(),
    );
  }
}

class _View extends StatelessView<RegisterViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
        context: context,
        title: 'auth.verification_id_card'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              viewModel.idPicturePath == null
                  ? 'label.preview_id_card'.tr
                  : 'auth.confirm_id_card'.tr,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: IColors.neutral10, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'auth.id_card.note'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: IColors.neutral20),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: IColors.neutral20,
                  ),
                ),
                margin: const EdgeInsets.symmetric(vertical: 35),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: viewModel.idPicturePath == null
                      ? Image.network(
                          'https://assets.pikiran-rakyat.com/crop/0x0:0x0/750x500/photo/2019/02/v5SD9sysRa7LSRxKbGgjko9wVZHEstT7YpLYZjPB.jpeg',
                          fit: BoxFit.fill,
                        )
                      : ResultImageID(
                          imagePath: XFile(viewModel.idPicturePath!)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'auth.id_card.desc'.tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: IColors.neutral20),
              ),
            ),
            if (viewModel.idPicturePath != null)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonSecondary(
                      text: 'auth.re_take_picture'.tr,
                      onPressed: () =>
                          viewModel.takePictureId(pathName: 'idPicturePath'),
                    ),
                    const SizedBox(width: 8),
                    ButtonPrimary(text: 'auth.confirm'.tr, onPressed: () {})
                  ],
                ),
              ),
            if (viewModel.idPicturePath == null)
              ButtonPrimary(
                text: 'auth.take_picture'.tr,
                onPressed: () =>
                    viewModel.takePictureId(pathName: 'idPicturePath'),
              ),
          ],
        ),
      ),
    );
  }
}
