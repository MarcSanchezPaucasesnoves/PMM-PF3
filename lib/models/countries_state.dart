import 'models.dart';

class CountriesState {
  final List<Country> tenCountries;
  final List<Country> europeCountries;
  final List<Country> africaCountries;
  final List<Country> americasCountries;
  final List<Country> antarcticCountries;
  final List<Country> asiaCountries;
  final List<Country> oceaniaCountries;

  CountriesState({
    this.tenCountries = const [],
    this.europeCountries = const [],
    this.africaCountries = const [], 
    this.americasCountries = const [], 
    this.antarcticCountries = const [], 
    this.asiaCountries = const [], 
    this.oceaniaCountries = const [],
  });
  

  CountriesState copyWith({
    List<Country>? tenCountries,
    List<Country>? europeCountries,
    List<Country>? africaCountries,
    List<Country>? americasCountries,
    List<Country>? antarcticCountries,
    List<Country>? asiaCountries,
    List<Country>? oceaniaCountries,
  }) {
    return CountriesState(
      tenCountries: tenCountries ?? this.tenCountries,
      europeCountries: europeCountries ?? this.europeCountries,
      africaCountries: africaCountries ?? this.africaCountries,
      americasCountries: americasCountries ?? this.americasCountries,
      antarcticCountries: antarcticCountries ?? this.antarcticCountries,
      asiaCountries: asiaCountries ?? this.asiaCountries,
      oceaniaCountries: oceaniaCountries ?? this.oceaniaCountries,
    );
  }
}