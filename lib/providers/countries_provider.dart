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

  Future<void> getTenCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": _limit
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final tenCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(tenCountries: tenCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }

  Future<void> getEuropeCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": "100",
        "region": _europeRegion
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final euCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(europeCountries: euCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }

  Future<void> getAfricaCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": "100",
        "region": _africaRegion
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final africaCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(africaCountries: africaCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }

  Future<void> getAmericasCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": "100",
        "region": _americasRegion
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final americasCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(americasCountries: americasCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }

  Future<void> getAntarcticCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": "100",
        "region": _antarcticRegion
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final antarcticCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(antarcticCountries: antarcticCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }

  Future<void> getAsiaCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": "100",
        "region": _asiaRegion
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final asiaCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(asiaCountries: asiaCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }

  Future<void> getOceaniaCountries() async {
    try {
      var url = Uri.https(_baseUrl, "countries/v5", {
        "api_key": _apiKey,
        "limit": "100",
        "region": _oceaniaRegion
      });

      final result = await http.get(url);
      if (result.statusCode != 200) return;

      final oceaniaCountries = CountriesResponse.fromJson(result.body);
      state = state.copyWith(oceaniaCountries: oceaniaCountries.data.objects);

    } catch (e) {
      print("Error al carregar: $e");
    }
  }
}

final countriesProvider = NotifierProvider<CountriesProvider, CountriesState>(() => CountriesProvider());