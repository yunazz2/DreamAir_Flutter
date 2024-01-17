import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {

  String _departure = '김포';
  String _departureEng = '(GMP)';
  String _destination = '김포';
  String _destinationEng = '(GMP)';
  String _roundTrip = '왕복 가는편';
  int _pasCount = 1;
  String _departureDate = '';

  String get getDeparture => _departure;
  String get getDepartureEng => _departureEng;
  String get getDestination => _destination;
  String get getDestinationEng => _destinationEng;
  int get getPasCount => _pasCount;
  String get getRoundTrip => _roundTrip;
  String get getDepartureDate => _departureDate;

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
  }

}