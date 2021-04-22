import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'landpage_state.dart';

class LandpageCubit extends Cubit<LandpageState> {
  LandpageCubit() : super(const LandpageInitial(PageList.stopwatch));

  void gotoStopwatchPage() {
    emit(const LandpageStopwatch());
  }

  void gotoTimerPage() {
    emit(const LandpageTimer());
  }
}
