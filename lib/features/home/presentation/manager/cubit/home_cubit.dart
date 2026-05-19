import 'package:flutter_bloc/flutter_bloc.dart';

/// Tracks the active drawer section for highlighting.
enum HomeSection { hero, vision, video, contact }

class HomeCubit extends Cubit<HomeSection> {
  HomeCubit() : super(HomeSection.hero);

  void navigate(HomeSection section) => emit(section);
}
