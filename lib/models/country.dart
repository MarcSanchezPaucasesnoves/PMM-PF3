import 'dart:convert';

class Country {
  final Map<String, dynamic> names;
  final Map<String, dynamic> codes;
  final List<Map<String, dynamic>> capitals;
  final Map<String, dynamic> flag;
  final String region;
  final String subregion;
  final Map<String, dynamic> area;
  final List<dynamic> assets;
  final List<String> borders;
  final List<String> callingCodes;
  final Map<String, dynamic> cars;
  final Map<String, dynamic> classification;
  final List<String> continents;
  final Map<String, dynamic> coordinates;
  final List<Map<String, dynamic>> currencies;
  final Map<String, dynamic> date;
  final Map<String, dynamic> demonyms;
  final Map<String, dynamic> descriptions;
  final Map<String, dynamic> economy;
  final String governmentType;
  final bool landlocked;
  final List<Map<String, dynamic>> languages;
  final List<Map<String, dynamic>> leaders;
  final Map<String, dynamic> links;
  final Map<String, bool> memberships;
  final Map<String, dynamic> numberFormat;
  final Map<String, dynamic> parent;
  final int population;
  final Map<String, dynamic> postalCode;
  final List<String> timezones;
  final List<dynamic> tlds;
  final Map<String, dynamic> units;
  final String uuid;
  final Map<String, dynamic> meta;

  String get fullFlagImage {
    if (flag["url_png"] != "") {
      return flag["url_png"];
    }
    return "https://placehold.co/300x400/png";
  }

  Country({
    required this.names,
    required this.codes,
    required this.capitals,
    required this.flag,
    required this.region,
    required this.subregion,
    required this.area,
    required this.assets,
    required this.borders,
    required this.callingCodes,
    required this.cars,
    required this.classification,
    required this.continents,
    required this.coordinates,
    required this.currencies,
    required this.date,
    required this.demonyms,
    required this.descriptions,
    required this.economy,
    required this.governmentType,
    required this.landlocked,
    required this.languages,
    required this.leaders,
    required this.links,
    required this.memberships,
    required this.numberFormat,
    required this.parent,
    required this.population,
    required this.postalCode,
    required this.timezones,
    required this.tlds,
    required this.units,
    required this.uuid,
    required this.meta,
  });

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        names: Map<String, dynamic>.from(json["names"] ?? {}),
        codes: Map<String, dynamic>.from(json["codes"] ?? {}),
        capitals: json["capitals"] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json["capitals"].map((x) => Map<String, dynamic>.from(x))),
        flag: Map<String, dynamic>.from(json["flag"] ?? {}),
        region: json["region"] ?? "",
        subregion: json["subregion"] ?? "",
        area: Map<String, dynamic>.from(json["area"] ?? {}),
        assets: List<dynamic>.from(json["assets"] ?? []),
        borders: List<String>.from(json["borders"] ?? []),
        callingCodes: List<String>.from(json["calling_codes"] ?? []),
        cars: Map<String, dynamic>.from(json["cars"] ?? {}),
        classification: Map<String, dynamic>.from(json["classification"] ?? {}),
        continents: List<String>.from(json["continents"] ?? []),
        coordinates: Map<String, dynamic>.from(json["coordinates"] ?? {}),
        currencies: json["currencies"] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json["currencies"].map((x) => Map<String, dynamic>.from(x))),
        date: Map<String, dynamic>.from(json["date"] ?? {}),
        demonyms: Map<String, dynamic>.from(json["demonyms"] ?? {}),
        descriptions: Map<String, dynamic>.from(json["descriptions"] ?? {}),
        economy: Map<String, dynamic>.from(json["economy"] ?? {}),
        governmentType: json["government_type"] ?? "",
        landlocked: json["landlocked"] ?? false,
        languages: json["languages"] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json["languages"].map((x) => Map<String, dynamic>.from(x))),
        leaders: json["leaders"] == null
            ? []
            : List<Map<String, dynamic>>.from(
                json["leaders"].map((x) => Map<String, dynamic>.from(x))),
        links: Map<String, dynamic>.from(json["links"] ?? {}),
        memberships: json["memberships"] == null
            ? {}
            : Map<String, bool>.from(json["memberships"]),
        numberFormat: Map<String, dynamic>.from(json["number_format"] ?? {}),
        parent: Map<String, dynamic>.from(json["parent"] ?? {}),
        population: json["population"] ?? 0,
        postalCode: Map<String, dynamic>.from(json["postal_code"] ?? {}),
        timezones: List<String>.from(json["timezones"] ?? []),
        tlds: List<dynamic>.from(json["tlds"] ?? []),
        units: Map<String, dynamic>.from(json["units"] ?? {}),
        uuid: json["uuid"] ?? "",
        meta: Map<String, dynamic>.from(json["_meta"] ?? {}),
      );

  Map<String, dynamic> toMap() => {
        "names": names,
        "codes": codes,
        "capitals": capitals,
        "flag": flag,
        "region": region,
        "subregion": subregion,
        "area": area,
        "assets": assets,
        "borders": borders,
        "calling_codes": callingCodes,
        "cars": cars,
        "classification": classification,
        "continents": continents,
        "coordinates": coordinates,
        "currencies": currencies,
        "date": date,
        "demonyms": demonyms,
        "descriptions": descriptions,
        "economy": economy,
        "government_type": governmentType,
        "landlocked": landlocked,
        "languages": languages,
        "leaders": leaders,
        "links": links,
        "memberships": memberships,
        "number_format": numberFormat,
        "parent": parent,
        "population": population,
        "postal_code": postalCode,
        "timezones": timezones,
        "tlds": tlds,
        "units": units,
        "uuid": uuid,
        "_meta": meta,
      };
}