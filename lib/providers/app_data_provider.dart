import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/earthquake_model.dart';
import 'package:earthquake_app/utils/helper_functions.dart';

class AppDataProvider with ChangeNotifier {
  // Tu budete pridávať premené, gettery a metódy
  final Uri _baseUrl = Uri.parse('https://earthquake.usgs.gov/fdsnws/event/1/query');
  Map<String, dynamic> _queryParams = {};
  double _maxRadiusKm = 500.0;
  double _latitude = 0.0;
  double _longitude = 0.0;
  String _startTime = '';
  String _endTime = '';
  String _orderBy = 'time'; // predvolené triedenie podľa času
  String? _currentCity;
  final double _maxRadiusThreshold = 20001.6; // max. povolená hodnota podľa dokumentácie
  bool _shouldUseLocation = false;
  EarthquakeModel? _earthquakeModel;

  double get maxRadiusKm => _maxRadiusKm;
  double get latitude => _latitude;
  double get longitude => _longitude;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get orderBy => _orderBy;
  String? get currentCity => _currentCity;
  double get maxRadiusThreshold => _maxRadiusThreshold;
  bool get shouldUseLocation => _shouldUseLocation;
  EarthquakeModel? get earthquakeModel => _earthquakeModel;

  bool get hasDataLoaded => earthquakeModel != null;

  void _setQueryParams() {
    _queryParams['format'] = 'geojson';
    _queryParams['starttime'] = _startTime;
    _queryParams['endtime'] = _endTime;
    _queryParams['minmagnitude'] = '4';
    _queryParams['orderby'] = _orderBy;
    _queryParams['limit'] = '500';
    _queryParams['latitude'] = '$_latitude';
    _queryParams['longitude'] = '$_longitude';
    _queryParams['maxradiuskm'] = '$_maxRadiusKm';
  }

  init() {
    final now = DateTime.now();
    final earlier = now.subtract(const Duration(days: 10)); // pôvodne 1 deň
    _startTime = getFormattedDateTime(earlier.millisecondsSinceEpoch);
    _endTime = getFormattedDateTime(now.millisecondsSinceEpoch);
    _maxRadiusKm = maxRadiusThreshold;
    _setQueryParams();

    // Zavolanie metódy pre načítanie dát
    getEarthquakeData();
  }

  Future getEarthquakeData() async {
    final uri = Uri.https(_baseUrl.authority, _baseUrl.path, _queryParams);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _earthquakeModel = EarthquakeModel.fromJson(json);
        print(earthquakeModel!.features!.length);
        notifyListeners();
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void setOrder(String value) {
    _orderBy = value;
    notifyListeners();
    _setQueryParams();
    getEarthquakeData();
  }

  void setStartTime(String date) {
    _startTime = date;
    _setQueryParams();
    notifyListeners();
  }

  void setEndTime(String date) {
    _endTime = date;
    _setQueryParams();
    notifyListeners();
  }

  Color getAlertColor(String color) {
    return switch(color) {
      'green' => Colors.green,
      'yellow' => Colors.yellow,
      'orange' => Colors.orange,
      _ => Colors.red,
    };
  }
}
