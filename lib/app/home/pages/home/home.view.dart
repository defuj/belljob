import 'package:belljob/repositories.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeFragmentViewModel>(
      view: () => const _View(),
      viewModel: HomeFragmentViewModel(),
    );
  }
}

class _View extends StatelessView<HomeFragmentViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      backgroundColor: IColors.secondary95,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: AppNameText(textStyle: Theme.of(context).textTheme.headline3),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/svg/bell_filled.svg',
              width: 20,
              height: 20,
              color: IColors.neutral30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/svg/message_filled.svg',
              width: 20,
              height: 20,
              color: IColors.neutral30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // width fill width
                    width: (MediaQuery.of(context).size.width * 0.5) - 24,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: IColors.neutral70.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Row(
                      children: [
                        const Icon(Icons.wallet),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Saldo  Kamu',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: IColors.neutral10,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              'Rp 1.000.000',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: IColors.neutral10,
                                        fontWeight: FontWeight.w400,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: (MediaQuery.of(context).size.width * 0.5) - 24,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: IColors.neutral70.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Row(
                      children: [
                        const Icon(Icons.fact_check_rounded),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Layanan',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    color: IColors.neutral10,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              '1 Layanan aktif',
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        color: IColors.neutral10,
                                        fontWeight: FontWeight.w400,
                                      ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: IColors.neutral70.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                children: viewModel.jobs.map((job) {
                  return Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          job.icon!,
                          width: 46,
                          height: 46,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          job.title!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: IColors.neutral10,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
