import 'package:flutter/material.dart';

class BookingProvider extends ChangeNotifier {

  String departure = '';
  String departureEng = '';
  String destination = '';
  String destinationEng = '';
  String roundTrip = '편도';
  int pasCount = 1;
  String departureDate = '';
  int productPrice = 0;      
  String flightName = 'DA0001';        // '' 
  String goDepartureTime = '10:00';     // ''
  String goDestinationTime = '11:00';   // ''
  String backDepartureTime = '10:00';     // ''
  String backDestinationTime = '11:00';   // ''
  String duration = '1';   // ''
  int totalPrice = 0;
  double discount = 1.0;
  int discountPrice = 0;
  int productNoDep = 0;
  int productNoDes = 0;
  int routeNoDep = 0;
  int routeNoDes = 0;
  String input = '탑승객 정보 입력';


  // 탑승객 정보
  int pinType = 0;
  List<int> pinTypes = [];
  int passengerNo = 0;
  List<int> passengerNos = [];
  String passengerName = '';
  List<String> passengerNames = [];
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
  int get getPasCount => this.pasCount;
  String get getRoundTrip => roundTrip;
  String get getDepartureDate => departureDate;
  int get getProductPrice => productPrice;
  String get getFlightName => flightName;
  String get getGoDepartureTime => goDepartureTime;
  String get getGoDestinationTime => goDestinationTime;
  String get getBackDepartureTime => backDepartureTime;
  String get getBackDestinationTime => backDestinationTime;
  String get getDuration => duration;
  int get getTotalPrice => totalPrice;
  double get getDiscount => discount;
  int get getDiscountPrice => discountPrice;
  int get getProductNoDep => productNoDep;
  int get getProductNoDes => productNoDes;
  int get getRouteNoDep => routeNoDep;
  int get getRouteNoDes => routeNoDes;
  String get getInput => input;

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

  set setDepartureDate(String parmDepartureDate) {
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

  set setGoDepartureTime(String parmDepartureTime) {
    goDepartureTime = parmDepartureTime;
    notifyListeners();
  }

  set setGoDestinationTime(String parmDestinationTime) {
    goDestinationTime = parmDestinationTime;
    notifyListeners();
  }
  
  set setBackDepartureTime(String parmDepartureTime) {
    backDepartureTime = parmDepartureTime;
    notifyListeners();
  }

  set setBackDestinationTime(String parmDestinationTime) {
    backDestinationTime = parmDestinationTime;
    notifyListeners();
  }

  set setDuration(String paramDuration) {
    duration = paramDuration;
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

  set setInput(String paramInput) {
    input = paramInput;
    notifyListeners();
  }

  set setDiscount(double paramDiscount) => discount = paramDiscount;
  set setDiscountPrice(int paramDiscountPrice) => discountPrice = paramDiscountPrice;
  set setProductNoDep(int paramProductNoDep) => productNoDep = paramProductNoDep;
  set setProductNoDes(int paramProductNoDes) => productNoDes = paramProductNoDes;
  set setRouteNoDep(int paramRouteNoDep) => routeNoDep = paramRouteNoDep;
  set setRouteNoDes(int paramRouteNoDes) => routeNoDes = paramRouteNoDes;
}