import 'dart:convert';

class ImgWikipediaResponse {
  final String? source;

  ImgWikipediaResponse({this.source});

  factory ImgWikipediaResponse.fromJson(String str) =>
      ImgWikipediaResponse.fromMap(json.decode(str));

  factory ImgWikipediaResponse.fromMap(Map<String, dynamic> json) {
    final Map<String, dynamic>? pages = json['query']?['pages'];
    if (pages == null || pages.isEmpty) {
      return ImgWikipediaResponse(source: null);
    }

    // Toma el primer resultado sin importar el ID numérico de la página
    final firstPage = pages.values.first as Map<String, dynamic>;
    return ImgWikipediaResponse(
      source: firstPage['thumbnail']?['source'],
    );
  }

}