import 'dart:convert';
import 'models.dart';

class TenCountriesResponse {
    final Data data;

    TenCountriesResponse({
        required this.data,
    });

    factory TenCountriesResponse.fromJson(String str) => TenCountriesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TenCountriesResponse.fromMap(Map<String, dynamic> json) => TenCountriesResponse(
        data: Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "data": data.toMap(),
    };
}

class Data {
    final List<Country> objects;
    final Meta meta;

    Data({
        required this.objects,
        required this.meta,
    });

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        objects: List<Country>.from(json["objects"].map((x) => Country.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "objects": List<dynamic>.from(objects.map((x) => x.toMap())),
        "meta": meta.toMap(),
    };
}

class Meta {
    final int total;
    final int count;
    final int limit;
    final int offset;
    final bool more;
    final String requestId;
    final int duration;

    Meta({
        required this.total,
        required this.count,
        required this.limit,
        required this.offset,
        required this.more,
        required this.requestId,
        required this.duration,
    });

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        total: json["total"],
        count: json["count"],
        limit: json["limit"],
        offset: json["offset"],
        more: json["more"],
        requestId: json["request_id"],
        duration: json["duration"],
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "count": count,
        "limit": limit,
        "offset": offset,
        "more": more,
        "request_id": requestId,
        "duration": duration,
    };
}