import 'dart:convert';

class BitcoinModel {
  Time? time;
  String? disclaimer;
  String? chartName;
  Bpi? bpi;

  BitcoinModel({
    this.time,
    this.disclaimer,
    this.chartName,
    this.bpi,
  });

  factory BitcoinModel.fromJson(String str) => BitcoinModel.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory BitcoinModel.fromMap(Map<String, dynamic> json) => BitcoinModel(
        time: Time.fromMap(json["time"]),
        disclaimer: json["disclaimer"],
        chartName: json["chartName"],
        bpi: Bpi.fromMap(json["bpi"]),
      );

  Map<String, dynamic> toMap() => {
        "time": time?.toMap(),
        "disclaimer": disclaimer,
        "chartName": chartName,
        "bpi": bpi?.toMap(),
      };
}

class Bpi {
  Eur? usd;
  Eur? gbp;
  Eur? eur;

  Bpi({
    this.usd,
    this.gbp,
    this.eur,
  });

  factory Bpi.fromJson(String str) => Bpi.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Bpi.fromMap(Map<String, dynamic> json) => Bpi(
        usd: Eur.fromMap(json["USD"]),
        gbp: Eur.fromMap(json["GBP"]),
        eur: Eur.fromMap(json["EUR"]),
      );

  Map<String, dynamic> toMap() => {
        "USD": usd?.toMap(),
        "GBP": gbp?.toMap(),
        "EUR": eur?.toMap(),
      };
}

class Eur {
  String? code;
  String? symbol;
  String? rate;
  String? description;
  double? rateFloat;

  Eur({
    this.code,
    this.symbol,
    this.rate,
    this.description,
    this.rateFloat,
  });

  factory Eur.fromJson(String str) => Eur.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Eur.fromMap(Map<String, dynamic> json) => Eur(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}

class Time {
  String? updated;
  DateTime? updatedIso;
  String? updateduk;

  Time({
    this.updated,
    this.updatedIso,
    this.updateduk,
  });

  factory Time.fromJson(String str) => Time.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Time.fromMap(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: DateTime.parse(json["updatedISO"]),
        updateduk: json["updateduk"],
      );

  Map<String, dynamic> toMap() => {
        "updated": updated,
        "updatedISO": updatedIso?.toIso8601String(),
        "updateduk": updateduk,
      };
}
