import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_bloc/data/my_data.dart';

part 'weater_bloc_event.dart';
part 'weater_bloc_state.dart';

class WeaterBlocBloc extends Bloc<WeaterBlocEvent, WeaterBlocState> {
  WeaterBlocBloc() : super(WeaterBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeaterBlocLoading());
      try {
        print("making api call " +
            event.position.latitude.toString() +
            " " +
            event.position.longitude.toString());
        WeatherFactory wf = WeatherFactory(API_KEY, language: Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        print(weather);
        emit(WeaterBlocSuccess(weather));
      } catch (e) {
        print(e.toString());
        emit(WeaterBlocFailure());
      }
    });
  }
}
