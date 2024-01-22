import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PickImg extends StatefulWidget {
  const PickImg({super.key});

  @override
  State<PickImg> createState() => _PickImgState();
}

class _PickImgState extends State<PickImg> {

  @override
  Widget build(BuildContext context) {

    // 이미지 업로드
    Future uploadImg() asnyc {
      var url = 'http://10.0.2.2:9090/board?{boardNo}';
      // var response = await http.get(Uri.parse(url));
      var request = new http.MultipartRequest('POST', url);
      final httpImage = http.MultipartFile.fromBytes('files.myimage', bytes,
          contentType: MediaType.parse(mimeType), filename: 'myImage.png');
      request.files.add(httpImage);
      final response = await request.send();
    }

    return const Placeholder();
  }
}