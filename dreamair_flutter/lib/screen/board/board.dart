class Board {
  final int boardNo;
  final String writer;
  final String title;
  final String content;
  final String regDate;
  final String updDate;
  final String date;
  final int views;
  final int userNo;
  final int adminNo;
  final int like;


Board(this.regDate, this.updDate, this.date, this.views, this.userNo, this.adminNo, this.like, {
  required this.boardNo,
  required this.writer,
  required this.title,
  required this.content,
});

}

List<Board> boardList = [];