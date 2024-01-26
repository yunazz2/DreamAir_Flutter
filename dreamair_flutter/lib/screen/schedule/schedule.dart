class Schedule {
  int? flightNo;
  String? flightName;
  int? routeNo;
  String? departure;
  String? departureDate;
  String? departureTime;
  String? destination;
  String? destinationDate;
  String? destinationTime;
  
  Schedule(
    {
      required this.flightNo,
      required this.flightName,
      required this.routeNo,
      required this.departure,
      required this.departureDate,
      required this.departureTime,
      required this.destination,
      required this.destinationDate,
      required this.destinationTime,
    }
  );
}