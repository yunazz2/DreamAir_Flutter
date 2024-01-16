class Schedule {

  // 플라이 여부
  String? flightNo;
  String? flightName;
  String? routeNo;
  String? departure;
  String? departureDate;
  String? departureTime;
  String? destination;
  String? destinationDate;
  String? destinationTime;
  
  Schedule(
    // requried : 객체 생성 시, 필수로 전달해야할 값으로 지정
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