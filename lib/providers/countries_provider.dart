import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class CountriesProvider extends Notifier<CountriesState> {
  final String _baseUrl = "api.restcountries.com";
  final String _apiKey = "rc_live_62d269b234004c38918a245a782de035";
  final String _limit = "10";
  final String _europeRegion = "Europe";
  final String _africaRegion = "Africa";
  final String _americasRegion = "Americas";
  final String _antarcticRegion = "Antarctic";
  final String _asiaRegion = "Asia";
  final String _oceaniaRegion = "Oceania";

  @override
  CountriesState build() {
    getTenCountries();
    getEuropeCountries();
    getAfricaCountries();
    getAmericasCountries();
    getAntarcticCountries();
    getAsiaCountries();
    getOceaniaCountries();
    return CountriesState();
  }

  Future<void> getTenCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": _limit
    });

    final result = await http.get(url);

    final tenCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(tenCountries: tenCountries.data.objects);
  }

  Future<void> getEuropeCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": "100",
      "region": _europeRegion
    });

    final result = await http.get(url);

    final euCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(europeCountries: euCountries.data.objects);
  }

  Future<void> getAfricaCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": "100",
      "region": _africaRegion
    });

    final result = await http.get(url);

    final africaCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(africaCountries: africaCountries.data.objects);
  }

  Future<void> getAmericasCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": "100",
      "region": _americasRegion
    });

    final result = await http.get(url);

    final americasCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(americasCountries: americasCountries.data.objects);
  }

  Future<void> getAntarcticCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": "100",
      "region": _antarcticRegion
    });

    final result = await http.get(url);

    final antarcticCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(antarcticCountries: antarcticCountries.data.objects);
  }

  Future<void> getAsiaCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": "100",
      "region": _asiaRegion
    });

    final result = await http.get(url);

    final asiaCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(asiaCountries: asiaCountries.data.objects);
  }

  Future<void> getOceaniaCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": "100",
      "region": _oceaniaRegion
    });

    final result = await http.get(url);

    final oceaniaCountries = CountriesResponse.fromJson(result.body);
    state = state.copyWith(oceaniaCountries: oceaniaCountries.data.objects);
  }

}

final countriesProvider = NotifierProvider<CountriesProvider, CountriesState>(() => CountriesProvider());