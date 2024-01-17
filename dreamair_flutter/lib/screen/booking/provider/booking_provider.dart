import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {

  String _departure = '김포';
  String _departureEng = '(GMP)';
  String _destination = '김포';
  String _destinationEng = '(GMP)';
  String _roundTrip = '왕복 가는편';
  int _pasCount = 1;
  String _departureDate = '';
  int _productPrice = 10000;      // 0으로 변경
  String _flightName = 'DA0001';        // '' 
  String _departureTime = '10:00';     // ''
  String _destinationTime = '11:00';   // ''
  String _duration = '1시간';   // ''

  String get getDeparture => _departure;
  String get getDepartureEng => _departureEng;
  String get getDestination => _destination;
  String get getDestinationEng => _destinationEng;
  int get getPasCount => _pasCount;
  String get getRoundTrip => _roundTrip;
  String get getDepartureDate => _departureDate;
  int get getProductPrice => _productPrice;
  String get getFlightName => _flightName;
  String get getDepartureTime => _departureTime;
  String get getDestinationTime => _destinationTime;
  String get getDuration => _duration;

  set setDeparture(String departure) {
    _departure = departure;
    notifyListeners();
  }

  set setDepartureEng(String departureEng) {
    _departureEng = departureEng; 
    notifyListeners();
  }

  set setDestination(String destination) { 
    _destination = destination;
    notifyListeners();
  }

  set setDestinationEng(String destinationEng) {
    _destinationEng = destinationEng;
    notifyListeners();
  }

  set setRoundTrip(String roundTrip) { 
    _roundTrip = roundTrip;
    notifyListeners();
  }

  set setPasCount(int pasCount) {
    _pasCount = pasCount;
    // notifyListeners();
  }

  set setDeprtureDate(String departureDate) {
    _departureDate = departureDate;
    notifyListeners();
  }

  set setProductPrice(int productPrice) {
    _productPrice = productPrice;
    notifyListeners();
  }

  set setFlightName(String flightName) {
    _flightName = flightName;
    notifyListeners();
  }

  set setDepartureTime(String departureTime) {
    _departureTime = departureTime;
    notifyListeners();
  }

  set setDestinationTime(String destinationTime) {
    _destinationTime = destinationTime;
    notifyListeners();
  }
}