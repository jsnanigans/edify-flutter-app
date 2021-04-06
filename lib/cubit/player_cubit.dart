import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  PlayerCubit() : super(PlayerStopped());

  void play() {
    emit(PlayerPlaying());
  }

  void pause() {
    emit(PlayerPaused());
  }

  void toggle() {
    if (this.state is PlayerPlaying) {
      this.pause();
    } else {
      this.play();
    }
  }
}
