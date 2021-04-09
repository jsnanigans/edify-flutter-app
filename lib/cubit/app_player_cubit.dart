import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_player_state.dart';

class AppPlayerCubit extends Cubit<AppPlayerState> {
  AppPlayerCubit() : super(AppPlayerStopped());

  void play() {
    emit(AppPlayerPlaying());
  }

  void pause() {
    emit(AppPlayerPaused());
  }

  void toggle() {
    if (this.state is AppPlayerPlaying) {
      this.pause();
    } else {
      this.play();
    }
  }
}
