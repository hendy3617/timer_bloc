import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landpage_state.dart';

class LandpageCubit extends Cubit<LandpageState> {
  LandpageCubit() : super(const LandpageInitial(Page.stopwatch));

  void gotoStopwatchPage() {
    emit(const LandpageNewState(Page.stopwatch));
  }

  void gotoTimerPage() {
    emit(const LandpageNewState(Page.timer));
  }
}
