import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class CountriesProvider extends Notifier<CountriesState> {
  final String _baseUrl = "api.restcountries.com";
  final String _apiKey = "rc_live_62d269b234004c38918a245a782de035";
  final String _limit = "10";

  @override
  CountriesState build() {
    getTenCountries();
    return CountriesState();
  }

  Future<void> getTenCountries() async{
    var url = Uri.https(_baseUrl, "countries/v5", {
      "api_key": _apiKey,
      "limit": _limit
    });

    final result = await http.get(url);

    final tenCountries = TenCountriesResponse.fromJson(result.body);
    state = state.copyWith(tenCountries: tenCountries.data.objects);
  }

}

final countriesProvider = NotifierProvider<CountriesProvider, CountriesState>(() => CountriesProvider());