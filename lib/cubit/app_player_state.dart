part of 'app_player_cubit.dart';

@immutable
abstract class AppPlayerState {}

class AppPlayerStopped extends AppPlayerState {}
class AppPlayerPlaying extends AppPlayerState {}
class AppPlayerPaused extends AppPlayerState {}
