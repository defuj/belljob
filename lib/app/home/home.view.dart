import 'package:belljob/app/home/home.viewmodel.dart';
import 'package:belljob/repositories.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeViewModel>(
      view: () => const _View(),
      viewModel: HomeViewModel(),
    );
  }
}

class _View extends StatelessView<HomeViewModel> {
  const _View({key}) : super(key: key, reactive: true);

  @override
  Widget render(context, viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: viewModel.pageController,
        children: const [
          HomeFragment(),
          NewsFragment(),
          OrdersFragment(),
          ProfileFragment(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          enableFeedback: false,
          backgroundColor: Colors.white,
          selectedLabelStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w600,
                color: IColors.secondary50,
                letterSpacing: 0.4,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w500,
                color: IColors.neutral30,
                letterSpacing: 0.4,
              ),
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/svg/home_fluent.svg',
                width: 32,
                height: 32,
              ),
              icon: SvgPicture.asset(
                'assets/icons/svg/home_outline.svg',
                width: 32,
                height: 32,
              ),
              label: 'home.data.home'.tr,
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/svg/news_fluent.svg',
                width: 32,
                height: 32,
              ),
              icon: SvgPicture.asset(
                'assets/icons/svg/news_outline.svg',
                width: 32,
                height: 32,
              ),
              label: 'home.data.news'.tr,
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/svg/orders_fluent.svg',
                width: 32,
                height: 32,
              ),
              icon: SvgPicture.asset(
                'assets/icons/svg/orders_outline.svg',
                width: 32,
                height: 32,
              ),
              label: 'home.data.orders'.tr,
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/svg/profile_fluent.svg',
                width: 32,
                height: 32,
              ),
              icon: SvgPicture.asset(
                'assets/icons/svg/profile_outline.svg',
                width: 32,
                height: 32,
              ),
              label: 'home.data.profile'.tr,
            ),
          ],
          currentIndex: viewModel.page == 'home.data.home'.tr
              ? 0
              : viewModel.page == 'home.data.news'.tr
                  ? 1
                  : viewModel.page == 'home.data.orders'.tr
                      ? 2
                      : 3,
          unselectedItemColor: IColors.neutral30,
          selectedItemColor: IColors.secondary50,
          onTap: (index) {
            if (index == 0) {
              viewModel.page = 'home.data.home'.tr;
              viewModel.pageController.jumpToPage(0);
            }
            if (index == 1) {
              viewModel.page = 'home.data.news'.tr;
              viewModel.pageController.jumpToPage(1);
            }
            if (index == 2) {
              viewModel.page = 'home.data.orders'.tr;
              viewModel.pageController.jumpToPage(2);
            }
            if (index == 3) {
              viewModel.page = 'home.data.profile'.tr;
              viewModel.pageController.jumpToPage(3);
            }
          },
        ),
      ),
    );
  }
}
