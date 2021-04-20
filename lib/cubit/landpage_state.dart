part of 'landpage_cubit.dart';

enum Page { stopwatch, timer }

@immutable
abstract class LandpageState {
  const LandpageState(this.currentPage);
  final Page currentPage;
}

class LandpageInitial extends LandpageState {
  const LandpageInitial(Page initialPage) : super(initialPage);
}

class LandpageNewState extends LandpageState {
  const LandpageNewState(Page page) : super(page);
}
