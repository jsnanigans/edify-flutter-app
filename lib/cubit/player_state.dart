part of 'player_cubit.dart';

@immutable
abstract class PlayerState {}

class PlayerStopped extends PlayerState {}
class PlayerPlaying extends PlayerState {}
class PlayerPaused extends PlayerState {}
