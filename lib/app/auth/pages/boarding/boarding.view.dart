import 'package:belljob/packages.dart';

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
          padding:
              const EdgeInsets.only(top: 56, left: 24, right: 24, bottom: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bell ',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        'Job',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: IColors.neutral20,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
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
              const SizedBox(height: 24),
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
                            'Cari Pekerja',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: IColors.neutral10,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Pesan jasa untuk membantu pekerjaanmu',
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
                            'Jadi Pekerja',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    color: IColors.neutral10,
                                    fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Bantu orang lain menyelesaikan masalahnya',
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
            ],
          ),
        ),
      ),
    );
  }
}
