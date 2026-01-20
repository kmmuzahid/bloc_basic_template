import 'package:mygarage/config/bloc/safe_cubit.dart';
import 'package:mygarage/coreFeature/navigation/cubit/navigation_state.dart';

class NavigationCubit extends SafeCubit<NavigationState> {
  NavigationCubit() : super(NavigationState());

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
