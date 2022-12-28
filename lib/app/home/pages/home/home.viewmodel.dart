import 'package:belljob/repositories.dart';

class Job {
  final String? title;
  final String? icon;
  Job({required this.title, required this.icon});
}

class HomeFragmentViewModel extends ViewModel {
  // make model Job for array string
  final List<Job> jobs = [
    Job(
      title: 'home.data.job.gardener'.tr,
      icon: 'assets/icons/svg/gardener.svg',
    ),
    Job(
      title: 'home.data.job.builder'.tr,
      icon: 'assets/icons/svg/builder.svg',
    ),
    Job(
      title: 'home.data.job.driver'.tr,
      icon: 'assets/icons/svg/driver.svg',
    ),
    Job(
      title: 'home.data.job.nurse'.tr,
      icon: 'assets/icons/svg/nurse.svg',
    ),
    Job(
      title: 'home.data.job.programmer'.tr,
      icon: 'assets/icons/svg/programmer.svg',
    ),
    Job(
      title: 'home.data.job.travel_agent'.tr,
      icon: 'assets/icons/svg/travel_agent.svg',
    ),
    Job(
      title: 'home.data.job.masseus'.tr,
      icon: 'assets/icons/svg/masseus.svg',
    ),
    Job(
      title: 'home.data.job.household'.tr,
      icon: 'assets/icons/svg/housekeeping.svg',
    ),
    Job(
      title: 'home.data.job.other'.tr,
      icon: 'assets/icons/svg/other.svg',
    ),
  ];

  @override
  void init() {}

  @override
  void onDependenciesChange() {}

  @override
  void onBuild() {}

  @override
  void onMount() {}

  @override
  void onUnmount() {}

  @override
  void onResume() {}

  @override
  void onPause() {}

  @override
  void onInactive() {}

  @override
  void onDetach() {}
}
