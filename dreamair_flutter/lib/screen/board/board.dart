class Board {
  final int boardNo;
  final String writer;
  final String title;
  final String content;
  final String regDate;
  final String updDate;
  final int views;
  final int like;

  Board({
    required this.boardNo,
    required this.writer,
    required this.title,
    required this.content,
    required this.regDate,
    required this.updDate,
    required this.views,
    required this.like,
  });
}
