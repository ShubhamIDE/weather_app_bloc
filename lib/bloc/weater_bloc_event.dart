part of 'weater_bloc_bloc.dart';

sealed class WeaterBlocEvent extends Equatable {
  const WeaterBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchWeather extends WeaterBlocEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}
