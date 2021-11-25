import 'package:app/model/city.dart';
import 'package:app/repository/city_repository.dart';
import 'package:bloc/bloc.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository cityRepository;
  CityBloc({required this.cityRepository}) : super(CityLoading());

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    if (event is FetchCities) {
      yield CityLoading();
      try {
        List<City> _cities = await cityRepository.getCities();
        print("cities");
        print(_cities);
        if (_cities is List<City>) {
          yield CityLoadSuccess(_cities);
        } else {
          yield CityLoadFailed('Error as result');
        }
      } catch (e) {
        print("the error is ");
        print(e.toString());
        yield CityLoadFailed(e.toString());
      }
    } else if (event is CreateCity) {
      yield CityLoading();
      try {
        City _city = await cityRepository.createCity(event.city);
        List<City> _cities = await cityRepository.getCities();
        if (_city is City) {
          yield CityLoadSuccess(_cities);
        } else {
          yield CityLoadFailed('Error as result');
        }
      } catch (e) {
        yield CityLoadFailed(e.toString());
      }
    } else if (event is UpdateCity) {
      yield CityLoading();
      try {
        City _city = await cityRepository.updateCity(event.city);
        List<City> _cities = await cityRepository.getCities();
        if (_city is City && _cities is List<City>) {
          yield CityLoadSuccess(_cities);
        } else {
          yield CityLoadFailed('Error as result');
        }
      } catch (e) {
        yield CityLoadFailed(e.toString());
      }
    }
  }
}
