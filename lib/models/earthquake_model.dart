import 'dart:convert';

EarthquakeModel earthquakeModelFromJson(String str) =>
    EarthquakeModel.fromJson(json.decode(str));

String earthquakeModelToJson(EarthquakeModel data) =>
    json.encode(data.toJson());

class EarthquakeModel {
  String? type;
  Metadata? metadata;
  List<Feature>? features;
  List<double>? bbox;

  EarthquakeModel({
    this.type,
    this.metadata,
    this.features,
    this.bbox,
  });

  factory EarthquakeModel.fromJson(Map<String, dynamic> json) =>
      EarthquakeModel(
        type: json["type"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => Feature.fromJson(x))),
        bbox: json["bbox"] == null
            ? []
            : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "metadata": metadata?.toJson(),
        "features": features == null
            ? []
            : List<dynamic>.from(features!.map((x) => x.toJson())),
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
      };
}

class Feature {
  String? type;
  Properties? properties;
  Geometry? geometry;
  String? id;

  Feature({
    this.type,
    this.properties,
    this.geometry,
    this.id,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        properties: json["properties"] == null
            ? null
            : Properties.fromJson(json["properties"]),
        geometry: json["geometry"] == null
            ? null
            : Geometry.fromJson(json["geometry"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties?.toJson(),
        "geometry": geometry?.toJson(),
        "id": id,
      };
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({
    this.type,
    this.coordinates,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(
                json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}

class Properties {
  double? mag;
  String? place;
  int? time;
  int? updated;
  int? tz;
  String? url;
  String? detail;
  int? felt;
  double? cdi;
  double? mmi;
  String? alert;
  String? status;
  int? tsunami;
  int? sig;
  String? net;
  String? code;
  String? ids;
  String? sources;
  String? types;
  int? nst;
  double? dmin;
  double? rms;
  double? gap;
  String? magType;
  String? type;
  String? title;

  Properties({
    this.mag,
    this.place,
    this.time,
    this.updated,
    this.tz,
    this.url,
    this.detail,
    this.felt,
    this.cdi,
    this.mmi,
    this.alert,
    this.status,
    this.tsunami,
    this.sig,
    this.net,
    this.code,
    this.ids,
    this.sources,
    this.types,
    this.nst,
    this.dmin,
    this.rms,
    this.gap,
    this.magType,
    this.type,
    this.title,
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        mag: json["mag"]?.toDouble(),
        place: json["place"],
        time: json["time"],
        updated: json["updated"],
        tz: json["tz"],
        url: json["url"],
        detail: json["detail"],
        felt: json["felt"],
        cdi: json["cdi"]?.toDouble(),
        mmi: json["mmi"]?.toDouble(),
        alert: json["alert"],
        status: json["status"],
        tsunami: json["tsunami"],
        sig: json["sig"],
        net: json["net"],
        code: json["code"],
        ids: json["ids"],
        sources: json["sources"],
        types: json["types"],
        nst: json["nst"],
        dmin: json["dmin"]?.toDouble(),
        rms: json["rms"]?.toDouble(),
        gap: json["gap"]?.toDouble(),
        magType: json["magType"],
        type: json["type"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "mag": mag,
        "place": place,
        "time": time,
        "updated": updated,
        "tz": tz,
        "url": url,
        "detail": detail,
        "felt": felt,
        "cdi": cdi,
        "mmi": mmi,
        "alert": alert,
        "status": status,
        "tsunami": tsunami,
        "sig": sig,
        "net": net,
        "code": code,
        "ids": ids,
        "sources": sources,
        "types": types,
        "nst": nst,
        "dmin": dmin,
        "rms": rms,
        "gap": gap,
        "magType": magType,
        "type": type,
        "title": title,
      };
}

class Metadata {
  int? generated;
  String? url;
  String? title;
  int? status;
  String? api;
  int? count;

  Metadata({
    this.generated,
    this.url,
    this.title,
    this.status,
    this.api,
    this.count,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        generated: json["generated"],
        url: json["url"],
        title: json["title"],
        status: json["status"],
        api: json["api"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "generated": generated,
        "url": url,
        "title": title,
        "status": status,
        "api": api,
        "count": count,
      };
}
