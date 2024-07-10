part of 'weater_bloc_bloc.dart';

sealed class WeaterBlocState extends Equatable {
  const WeaterBlocState();

  @override
  List<Object> get props => [];
}

final class WeaterBlocInitial extends WeaterBlocState {}

final class WeaterBlocLoading extends WeaterBlocState {}

final class WeaterBlocFailure extends WeaterBlocState {}

final class WeaterBlocSuccess extends WeaterBlocState {
  final Weather weather;

  const WeaterBlocSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

