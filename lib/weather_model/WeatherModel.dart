/// data : {"time":"2024-04-24T19:47:00Z","values":{"cloudBase":0.03,"cloudCeiling":null,"cloudCover":18,"dewPoint":26.19,"freezingRainIntensity":0,"humidity":99,"precipitationProbability":0,"pressureSurfaceLevel":1000.72,"rainIntensity":0,"sleetIntensity":0,"snowIntensity":0,"temperature":29.38,"temperatureApparent":41.05,"uvHealthConcern":0,"uvIndex":0,"visibility":10.45,"weatherCode":1100,"windDirection":156.31,"windGust":4.69,"windSpeed":1.13}}
/// location : {"lat":23.83123779296875,"lon":91.28237915039062,"name":"Agartala, Mohanpur, West Tripura District, Tripura, 799001, India","type":"city"}

class WeatherModel {
  WeatherModel({
      Data? data, 
      Location? location,}){
    _data = data;
    _location = location;
}

  WeatherModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _location = json['location'] != null ? Location.fromJson(json['location']) : null;
  }
  Data? _data;
  Location? _location;
WeatherModel copyWith({  Data? data,
  Location? location,
}) => WeatherModel(  data: data ?? _data,
  location: location ?? _location,
);
  Data? get data => _data;
  Location? get location => _location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    return map;
  }

}

/// lat : 23.83123779296875
/// lon : 91.28237915039062
/// name : "Agartala, Mohanpur, West Tripura District, Tripura, 799001, India"
/// type : "city"

class Location {
  Location({
      num? lat, 
      num? lon, 
      String? name, 
      String? type,}){
    _lat = lat;
    _lon = lon;
    _name = name;
    _type = type;
}

  Location.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
    _name = json['name'];
    _type = json['type'];
  }
  num? _lat;
  num? _lon;
  String? _name;
  String? _type;
Location copyWith({  num? lat,
  num? lon,
  String? name,
  String? type,
}) => Location(  lat: lat ?? _lat,
  lon: lon ?? _lon,
  name: name ?? _name,
  type: type ?? _type,
);
  num? get lat => _lat;
  num? get lon => _lon;
  String? get name => _name;
  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['name'] = _name;
    map['type'] = _type;
    return map;
  }

}

/// time : "2024-04-24T19:47:00Z"
/// values : {"cloudBase":0.03,"cloudCeiling":null,"cloudCover":18,"dewPoint":26.19,"freezingRainIntensity":0,"humidity":99,"precipitationProbability":0,"pressureSurfaceLevel":1000.72,"rainIntensity":0,"sleetIntensity":0,"snowIntensity":0,"temperature":29.38,"temperatureApparent":41.05,"uvHealthConcern":0,"uvIndex":0,"visibility":10.45,"weatherCode":1100,"windDirection":156.31,"windGust":4.69,"windSpeed":1.13}

class Data {
  Data({
      String? time, 
      Values? values,}){
    _time = time;
    _values = values;
}

  Data.fromJson(dynamic json) {
    _time = json['time'];
    _values = json['values'] != null ? Values.fromJson(json['values']) : null;
  }
  String? _time;
  Values? _values;
Data copyWith({  String? time,
  Values? values,
}) => Data(  time: time ?? _time,
  values: values ?? _values,
);
  String? get time => _time;
  Values? get values => _values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = _time;
    if (_values != null) {
      map['values'] = _values?.toJson();
    }
    return map;
  }

}

/// cloudBase : 0.03
/// cloudCeiling : null
/// cloudCover : 18
/// dewPoint : 26.19
/// freezingRainIntensity : 0
/// humidity : 99
/// precipitationProbability : 0
/// pressureSurfaceLevel : 1000.72
/// rainIntensity : 0
/// sleetIntensity : 0
/// snowIntensity : 0
/// temperature : 29.38
/// temperatureApparent : 41.05
/// uvHealthConcern : 0
/// uvIndex : 0
/// visibility : 10.45
/// weatherCode : 1100
/// windDirection : 156.31
/// windGust : 4.69
/// windSpeed : 1.13

class Values {
  Values({
      num? cloudBase, 
      dynamic cloudCeiling, 
      num? cloudCover, 
      num? dewPoint, 
      num? freezingRainIntensity, 
      num? humidity, 
      num? precipitationProbability, 
      num? pressureSurfaceLevel, 
      num? rainIntensity, 
      num? sleetIntensity, 
      num? snowIntensity, 
      num? temperature, 
      num? temperatureApparent, 
      num? uvHealthConcern, 
      num? uvIndex, 
      num? visibility, 
      num? weatherCode, 
      num? windDirection, 
      num? windGust, 
      num? windSpeed,}){
    _cloudBase = cloudBase;
    _cloudCeiling = cloudCeiling;
    _cloudCover = cloudCover;
    _dewPoint = dewPoint;
    _freezingRainIntensity = freezingRainIntensity;
    _humidity = humidity;
    _precipitationProbability = precipitationProbability;
    _pressureSurfaceLevel = pressureSurfaceLevel;
    _rainIntensity = rainIntensity;
    _sleetIntensity = sleetIntensity;
    _snowIntensity = snowIntensity;
    _temperature = temperature;
    _temperatureApparent = temperatureApparent;
    _uvHealthConcern = uvHealthConcern;
    _uvIndex = uvIndex;
    _visibility = visibility;
    _weatherCode = weatherCode;
    _windDirection = windDirection;
    _windGust = windGust;
    _windSpeed = windSpeed;
}

  Values.fromJson(dynamic json) {
    _cloudBase = json['cloudBase'];
    _cloudCeiling = json['cloudCeiling'];
    _cloudCover = json['cloudCover'];
    _dewPoint = json['dewPoint'];
    _freezingRainIntensity = json['freezingRainIntensity'];
    _humidity = json['humidity'];
    _precipitationProbability = json['precipitationProbability'];
    _pressureSurfaceLevel = json['pressureSurfaceLevel'];
    _rainIntensity = json['rainIntensity'];
    _sleetIntensity = json['sleetIntensity'];
    _snowIntensity = json['snowIntensity'];
    _temperature = json['temperature'];
    _temperatureApparent = json['temperatureApparent'];
    _uvHealthConcern = json['uvHealthConcern'];
    _uvIndex = json['uvIndex'];
    _visibility = json['visibility'];
    _weatherCode = json['weatherCode'];
    _windDirection = json['windDirection'];
    _windGust = json['windGust'];
    _windSpeed = json['windSpeed'];
  }
  num? _cloudBase;
  dynamic _cloudCeiling;
  num? _cloudCover;
  num? _dewPoint;
  num? _freezingRainIntensity;
  num? _humidity;
  num? _precipitationProbability;
  num? _pressureSurfaceLevel;
  num? _rainIntensity;
  num? _sleetIntensity;
  num? _snowIntensity;
  num? _temperature;
  num? _temperatureApparent;
  num? _uvHealthConcern;
  num? _uvIndex;
  num? _visibility;
  num? _weatherCode;
  num? _windDirection;
  num? _windGust;
  num? _windSpeed;
Values copyWith({  num? cloudBase,
  dynamic cloudCeiling,
  num? cloudCover,
  num? dewPoint,
  num? freezingRainIntensity,
  num? humidity,
  num? precipitationProbability,
  num? pressureSurfaceLevel,
  num? rainIntensity,
  num? sleetIntensity,
  num? snowIntensity,
  num? temperature,
  num? temperatureApparent,
  num? uvHealthConcern,
  num? uvIndex,
  num? visibility,
  num? weatherCode,
  num? windDirection,
  num? windGust,
  num? windSpeed,
}) => Values(  cloudBase: cloudBase ?? _cloudBase,
  cloudCeiling: cloudCeiling ?? _cloudCeiling,
  cloudCover: cloudCover ?? _cloudCover,
  dewPoint: dewPoint ?? _dewPoint,
  freezingRainIntensity: freezingRainIntensity ?? _freezingRainIntensity,
  humidity: humidity ?? _humidity,
  precipitationProbability: precipitationProbability ?? _precipitationProbability,
  pressureSurfaceLevel: pressureSurfaceLevel ?? _pressureSurfaceLevel,
  rainIntensity: rainIntensity ?? _rainIntensity,
  sleetIntensity: sleetIntensity ?? _sleetIntensity,
  snowIntensity: snowIntensity ?? _snowIntensity,
  temperature: temperature ?? _temperature,
  temperatureApparent: temperatureApparent ?? _temperatureApparent,
  uvHealthConcern: uvHealthConcern ?? _uvHealthConcern,
  uvIndex: uvIndex ?? _uvIndex,
  visibility: visibility ?? _visibility,
  weatherCode: weatherCode ?? _weatherCode,
  windDirection: windDirection ?? _windDirection,
  windGust: windGust ?? _windGust,
  windSpeed: windSpeed ?? _windSpeed,
);
  num? get cloudBase => _cloudBase;
  dynamic get cloudCeiling => _cloudCeiling;
  num? get cloudCover => _cloudCover;
  num? get dewPoint => _dewPoint;
  num? get freezingRainIntensity => _freezingRainIntensity;
  num? get humidity => _humidity;
  num? get precipitationProbability => _precipitationProbability;
  num? get pressureSurfaceLevel => _pressureSurfaceLevel;
  num? get rainIntensity => _rainIntensity;
  num? get sleetIntensity => _sleetIntensity;
  num? get snowIntensity => _snowIntensity;
  num? get temperature => _temperature;
  num? get temperatureApparent => _temperatureApparent;
  num? get uvHealthConcern => _uvHealthConcern;
  num? get uvIndex => _uvIndex;
  num? get visibility => _visibility;
  num? get weatherCode => _weatherCode;
  num? get windDirection => _windDirection;
  num? get windGust => _windGust;
  num? get windSpeed => _windSpeed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cloudBase'] = _cloudBase;
    map['cloudCeiling'] = _cloudCeiling;
    map['cloudCover'] = _cloudCover;
    map['dewPoint'] = _dewPoint;
    map['freezingRainIntensity'] = _freezingRainIntensity;
    map['humidity'] = _humidity;
    map['precipitationProbability'] = _precipitationProbability;
    map['pressureSurfaceLevel'] = _pressureSurfaceLevel;
    map['rainIntensity'] = _rainIntensity;
    map['sleetIntensity'] = _sleetIntensity;
    map['snowIntensity'] = _snowIntensity;
    map['temperature'] = _temperature;
    map['temperatureApparent'] = _temperatureApparent;
    map['uvHealthConcern'] = _uvHealthConcern;
    map['uvIndex'] = _uvIndex;
    map['visibility'] = _visibility;
    map['weatherCode'] = _weatherCode;
    map['windDirection'] = _windDirection;
    map['windGust'] = _windGust;
    map['windSpeed'] = _windSpeed;
    return map;
  }

}