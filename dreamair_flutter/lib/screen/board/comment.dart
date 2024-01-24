class Comment{
  final int commentNo;
  final int boardNo;
  final String parentTable;
  final int parentNo;
  final String writer;
  final String content;
  final String regDate;
  final String updDate;
  
   Comment({
    required this.commentNo,
    required this.boardNo, 
    required this.parentTable, 
    required this.parentNo, 
    required this.writer, 
    required this.content, 
    required this.regDate, 
    required this.updDate,
   });

}