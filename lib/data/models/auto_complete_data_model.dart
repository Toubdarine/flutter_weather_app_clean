class AutoCompleteDataModel {
  String? type;
  List<Features>? features;
  // Query? query;

  //AutoCompleteDataModel({this.type, this.features, this.query});
  AutoCompleteDataModel({this.type, this.features});
  List<String> get suggestList {
    return [];
  }

  AutoCompleteDataModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['features'] != null) {
      features = <Features>[];
      json['features'].forEach((v) {
        features!.add(Features.fromJson(v));
      });
    }
    //query = json['query'] != null ? new Query.fromJson(json['query']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (features != null) {
      data['features'] = features!.map((v) => v.toJson()).toList();
    }
    /* if (this.query != null) {
      data['query'] = this.query!.toJson();
    }*/
    return data;
  }
}

class Features {
  String? type;
  Properties? properties;
  Geometry? geometry;
  List<double>? bbox;

  Features({this.type, this.properties, this.geometry, this.bbox});

  Features.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
    geometry =
        json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    if (json['bbox'] != null) {
      bbox = json['bbox'].cast<double>();
    } else {
      bbox = null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties!.toJson();
    }
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['bbox'] = bbox;
    return data;
  }
}

class Properties {
  Datasource? datasource;
  String? name;
  String? country;
  String? countryCode;
  String? state;
  String? county;
  String? city;
  String? hamlet;
  double? lon;
  double? lat;
  String? suburb;
  String? formatted;
  String? addressLine1;
  String? addressLine2;
  String? category;
  Timezone? timezone;
  String? resultType;
  Rank? rank;
  String? placeId;
  String? region;
  String? municipality;
  String? postcode;
  String? stateCode;
  String? stateCOG;
  String? departmentCOG;

  Properties(
      {this.datasource,
      this.name,
      this.country,
      this.countryCode,
      this.state,
      this.county,
      this.city,
      this.hamlet,
      this.lon,
      this.lat,
      this.suburb,
      this.formatted,
      this.addressLine1,
      this.addressLine2,
      this.category,
      this.timezone,
      this.resultType,
      this.rank,
      this.placeId,
      this.region,
      this.municipality,
      this.postcode,
      this.stateCode,
      this.stateCOG,
      this.departmentCOG});

  Properties.fromJson(Map<String, dynamic> json) {
    datasource = json['datasource'] != null
        ? Datasource.fromJson(json['datasource'])
        : null;
    name = json['name'];
    country = json['country'];
    countryCode = json['country_code'];
    state = json['state'];
    county = json['county'];
    city = json['city'];
    hamlet = json['hamlet'];
    lon = json['lon'];
    lat = json['lat'];
    suburb = json['suburb'];
    formatted = json['formatted'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    category = json['category'];
    timezone =
        json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null;
    resultType = json['result_type'];
    rank = json['rank'] != null ? Rank.fromJson(json['rank']) : null;
    placeId = json['place_id'];
    region = json['region'];
    municipality = json['municipality'];
    postcode = json['postcode'];
    stateCode = json['state_code'];
    stateCOG = json['state_COG'];
    departmentCOG = json['department_COG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (datasource != null) {
      data['datasource'] = datasource!.toJson();
    }
    data['name'] = name;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['state'] = state;
    data['county'] = county;
    data['city'] = city;
    data['hamlet'] = hamlet;
    data['lon'] = lon;
    data['lat'] = lat;
    data['suburb'] = suburb;
    data['formatted'] = formatted;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['category'] = category;
    if (timezone != null) {
      data['timezone'] = timezone!.toJson();
    }
    data['result_type'] = resultType;
    if (rank != null) {
      data['rank'] = rank!.toJson();
    }
    data['place_id'] = placeId;
    data['region'] = region;
    data['municipality'] = municipality;
    data['postcode'] = postcode;
    data['state_code'] = stateCode;
    data['state_COG'] = stateCOG;
    data['department_COG'] = departmentCOG;
    return data;
  }
}

class Datasource {
  String? sourcename;
  String? attribution;
  String? license;
  String? url;

  Datasource({this.sourcename, this.attribution, this.license, this.url});

  Datasource.fromJson(Map<String, dynamic> json) {
    sourcename = json['sourcename'];
    attribution = json['attribution'];
    license = json['license'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sourcename'] = sourcename;
    data['attribution'] = attribution;
    data['license'] = license;
    data['url'] = url;
    return data;
  }
}

class Timezone {
  String? name;
  String? offsetSTD;
  int? offsetSTDSeconds;
  String? offsetDST;
  int? offsetDSTSeconds;
  String? abbreviationSTD;
  String? abbreviationDST;

  Timezone(
      {this.name,
      this.offsetSTD,
      this.offsetSTDSeconds,
      this.offsetDST,
      this.offsetDSTSeconds,
      this.abbreviationSTD,
      this.abbreviationDST});

  Timezone.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    offsetSTD = json['offset_STD'];
    offsetSTDSeconds = json['offset_STD_seconds'];
    offsetDST = json['offset_DST'];
    offsetDSTSeconds = json['offset_DST_seconds'];
    abbreviationSTD = json['abbreviation_STD'];
    abbreviationDST = json['abbreviation_DST'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['offset_STD'] = offsetSTD;
    data['offset_STD_seconds'] = offsetSTDSeconds;
    data['offset_DST'] = offsetDST;
    data['offset_DST_seconds'] = offsetDSTSeconds;
    data['abbreviation_STD'] = abbreviationSTD;
    data['abbreviation_DST'] = abbreviationDST;
    return data;
  }
}

class Rank {
  double? importance;
  double? confidence;
  double? confidenceCityLevel;
  String? matchType;

  Rank(
      {this.importance,
      this.confidence,
      this.confidenceCityLevel,
      this.matchType});

  Rank.fromJson(Map<String, dynamic> json) {
    importance = json['importance'];
    confidence = json['confidence'].toDouble();
    if (json['confidence_city_level'] != null) {
      confidenceCityLevel = json['confidence_city_level'].toDouble();
    } else {
      confidenceCityLevel = null;
    }
    matchType = json['match_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['importance'] = importance;
    data['confidence'] = confidence;
    data['confidence_city_level'] = confidenceCityLevel;
    data['match_type'] = matchType;
    return data;
  }
}

class Geometry {
  String? type;
  List<double>? coordinates;

  Geometry({this.type, this.coordinates});

  Geometry.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class Query {
  String? text;
  Parsed? parsed;

  Query({this.text, this.parsed});

  Query.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    parsed = json['parsed'] != null ? Parsed.fromJson(json['parsed']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    if (parsed != null) {
      data['parsed'] = parsed!.toJson();
    }
    return data;
  }
}

class Parsed {
  String? city;
  String? expectedType;

  Parsed({this.city, this.expectedType});

  Parsed.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    expectedType = json['expected_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city'] = city;
    data['expected_type'] = expectedType;
    return data;
  }
}
