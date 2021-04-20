part of 'landpage_cubit.dart';

enum PageList { stopwatch, timer }

@immutable
abstract class LandpageState {
  const LandpageState(this.currentPage);
  final PageList currentPage;
}

class LandpageInitial extends LandpageState {
  const LandpageInitial(PageList initialPage) : super(initialPage);
}

class LandpageNewState extends LandpageState {
  const LandpageNewState(PageList page) : super(page);
}
