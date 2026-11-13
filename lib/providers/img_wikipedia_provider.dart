import 'package:countries_app/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ImgWikipediaProvider extends AsyncNotifier<List<String>> {
  final Country country;
  ImgWikipediaProvider(this.country);

  final String _baseUrl = "en.wikipedia.org";
  final String _action = "query";
  final String _prop = "pageimages";
  final String _format = "json";
  final String _piprop = "thumbnail";
  final String _pithumbsize = "500";
  final String _placehold = "https://placehold.co/200x300/png";

  @override
  Future<List<String>> build() async {
    final String capitalTitle = country.capitalName;
    final String currencyTitle = country.currencies.isNotEmpty
        ? (country.currencies.first["name"] ?? "")
        : "";
    final String regionTitle = country.region;
    final String subregionTitle = country.subregion;

    return await Future.wait([
      _fetchWikipediaImage(capitalTitle),
      _fetchWikipediaImage(currencyTitle),
      _fetchWikipediaImage(regionTitle),
      _fetchWikipediaImage(subregionTitle),
    ]);
  }

  Future<String> _fetchWikipediaImage(String? title) async {
    if (title == null || title.isEmpty) return _placehold;

    try {
      final url = Uri.https(_baseUrl, "w/api.php", {
        "action": _action,
        "prop": _prop,
        "format": _format,
        "piprop": _piprop,
        "pithumbsize": _pithumbsize,
        "titles": title,
      });

      final result = await http.get(url);
      final imgSource = ImgWikipediaResponse.fromJson(result.body);

      return imgSource.source ?? _placehold;

    } catch (e) {
      return "";
    }
  }
}


final imgWikipediaProvider = AsyncNotifierProvider.family<ImgWikipediaProvider, List<String>, Country>(ImgWikipediaProvider.new,);