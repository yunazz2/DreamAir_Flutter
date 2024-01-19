import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {

  String departure = '';
  String departureEng = '';
  String destination = '';
  String destinationEng = '';
  String roundTrip = '편도';
  int pasCount = 1;
  String departureDate = '';
  int productPrice = 10000;      // 0으로 변경
  String flightName = 'DA0001';        // '' 
  String departureTime = '10:00';     // ''
  String destinationTime = '11:00';   // ''
  String duration = '1';   // ''
  int totalPrice = 0;
  double discount = 1.0;
  int discountPrice = 0;

  // 탑승객 정보
  int pinType = 0;
  List<int> pinTypes = [];
  int passengerNo = 0;
  List<int> passengerNos = [];
  String passengerName = '';
  List<String> passengerNames = [''];
  String firstName = '';
  List<String> firstNames = [];
  String lastName = '';
  List<String> lastNames = [];
  String gender = '';
  List<String> genders = [];
  String birth = '';
  List<String> births = [];
  String phone = '';
  List<String> phones = [];
  String email = '';
  List<String> emails = [];

  String get getDeparture => departure;
  String get getDepartureEng => departureEng;
  String get getDestination => destination;
  String get getDestinationEng => destinationEng;
  int get getPasCount => pasCount;
  String get getRoundTrip => roundTrip;
  String get getDepartureDate => departureDate;
  int get getProductPrice => productPrice;
  String get getFlightName => flightName;
  String get getDepartureTime => departureTime;
  String get getDestinationTime => destinationTime;
  String get getDuration => duration;
  int get getTotalPrice => totalPrice;
  double get getDiscount => discount;
  int get getDiscountPrice => discountPrice;

  // 탑승객 정보
  List<int> get getPinTypes => pinTypes;
  List<int> get getPassengerNos => passengerNos;
  List<String> get getPassengerNames => passengerNames;
  List<String> get getFirstNames => firstNames;
  List<String> get getLastNames => lastNames;
  List<String> get getGenders => genders;
  List<String> get getBirths => births;
  List<String> get getPhones => phones;
  List<String> get getEmails => emails;

  set setPinTypes(int parmPinType) => pinTypes.add(parmPinType);
  set setPassengerNos(int paramPassengerNo) => passengerNos.add(paramPassengerNo);
  set setPassengerNames(String paramPassengerName) => passengerNames.add(paramPassengerName);
  set setFirstNames(String paramFirstName) => firstNames.add(paramFirstName);
  set setLastNames(String paramLastName) => lastNames.add(paramLastName);
  set setGenders(String paramGender) => genders.add(paramGender);
  set setBirths(String paramBirth) => births.add(paramBirth);
  set setPhones(String paramPhone) => phones.add(paramPhone);
  set setEmails(String paramEmail) => emails.add(paramEmail);

  // set setFirstNames(String paramFirstName) {
  //   firstNames.add(paramFirstName);
  // }

  set setDeparture(String parmDeparture) {
    departure = parmDeparture;
    notifyListeners();
  }

  set setDepartureEng(String parmDepartureEng) {
    departureEng = parmDepartureEng; 
    notifyListeners();
  }

  set setDestination(String parmDestination) { 
    destination = parmDestination;
    notifyListeners();
  }

  set setDestinationEng(String parmDestinationEng) {
    destinationEng = parmDestinationEng;
    notifyListeners();
  }

  set setRoundTrip(String parmRoundTrip) { 
    roundTrip = parmRoundTrip;
    notifyListeners();
  }

  set setPasCount(int parmPasCount) {
    pasCount = parmPasCount;
    // notifyListeners();
  }

  set setDeprtureDate(String parmDepartureDate) {
    departureDate = parmDepartureDate;
    notifyListeners();
  }

  set setProductPrice(int parmProductPrice) {
    productPrice = parmProductPrice;
    notifyListeners();
  }

  set setFlightName(String parmFlightName) {
    flightName = parmFlightName;
    notifyListeners();
  }

  set setDepartureTime(String parmDepartureTime) {
    departureTime = parmDepartureTime;
    notifyListeners();
  }

  set setDestinationTime(String parmDestinationTime) {
    destinationTime = parmDestinationTime;
    notifyListeners();
  }

  set setTotalPrcie(int parmTotalPrice) {
    totalPrice = parmTotalPrice;
    notifyListeners();
  }

  // 탑승객 정보
  set setPinType(int parmPinType) {
    pinType = parmPinType;
    notifyListeners();
  }

  set setDiscount(double paramDiscount) => discount = paramDiscount;
  set setDiscountPrice(int paramDiscountPrice) => discountPrice = paramDiscountPrice;
}