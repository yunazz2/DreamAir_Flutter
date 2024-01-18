class SeatInfo {

  int flightNo = 1; // 항공기 번호
  List<String> seatNo = []; // 좌석 번호
  
  // 생성자
  SeatInfo() {
    // A1부터 A10까지의 값을 seatNo 배열에 추가
    for (int i = 1; i <= 10; i++) {
      seatNo.add("A$i");
    }
    for (int i = 1; i <= 10; i++) {
      seatNo.add("B$i");
    }
    for (int i = 1; i <= 10; i++) {
      seatNo.add("C$i");
    }
    for (int i = 1; i <= 10; i++) {
      seatNo.add("D$i");
    }
  }
}