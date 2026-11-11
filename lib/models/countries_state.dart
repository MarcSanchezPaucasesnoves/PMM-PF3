import 'models.dart';

class CountriesState {
  final List<Country> tenCountries;
  final List<Country> euCountries;

  CountriesState({
    this.tenCountries = const [],
    this.euCountries = const [],
  });
  

  CountriesState copyWith({
    List<Country>? tenCountries,
    List<Country>? euCountries,
  }) {
    return CountriesState(
      tenCountries: tenCountries ?? this.tenCountries,
      euCountries: euCountries ?? this.euCountries,
    );
  }
}