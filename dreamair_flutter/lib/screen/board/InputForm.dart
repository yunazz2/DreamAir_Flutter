import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board_screen.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {

  @override
  void initState() {
    super.initState();
    _getPermission();
  }

  File? _selectedFile; 
  TextEditingController _titleController = TextEditingController();
  TextEditingController _writerController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  
  Future<void> _getPermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      // 권한이 이미 허용된 경우
      // proceedWithFileOperation(); // 파일 작업 진행
      print('이미 권한 승인됨...');
    } else {
      // 권한을 요청
      var permission = await Permission.storage.request();
      if (permission.isGranted) {
        // 권한이 허용된 경우
        // proceedWithFileOperation(); // 파일 작업 진행
        print('이미 권한 승인됨...');
      } else {
        // 권한이 거부된 경우
        // _handlePermissionDenied();
        print('이미 권한 승인됨...');
      }
    }
  }

  Future<void> _pickFile() async {

    // bool check = await _getPermission();

    // if( !check ) {
    //   return;
    // }

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      return;
    }

    var uri = Uri.parse('http://10.0.2.2:9090/board'); // 업로드할 서버의 URL
    var request = http.MultipartRequest('POST', uri);

    // 파일을 추가
    var fileField = await http.MultipartFile.fromPath('files', _selectedFile!.path);
    request.files.add(fileField);

    // 텍스트 데이터 추가
    request.fields['title'] = _titleController.text;
    request.fields['writer'] = _writerController.text;
    request.fields['content'] = _contentController.text;

    try {
      // 업로드 요청 보내기
      var response = await request.send();

      // 응답 확인
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('File uploaded successfully');

        // 파일 업로드가 성공하면 페이지 이동
      await _navigateToBoardScreen(context);

      } else {
        print('File upload failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading file: $error');
    }
  }

  Future<void> _navigateToBoardScreen(BuildContext context) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => const BoardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: '제목',   
                          border: OutlineInputBorder(),
                          ),
                      ),
                     const SizedBox(height: 20,),
                      TextField(
                        controller: _writerController,
                        decoration: InputDecoration(
                          labelText: '작성자',
                          border: OutlineInputBorder(),
                          ),
                      ),
                      const SizedBox(height: 20,),
                      TextField(
                        maxLength: 200,
                        maxLines: 9,
                        controller: _contentController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.clear),
                          labelText: "내용을 입력해 주세요. (최대 200자)",
                          border: OutlineInputBorder(),
                          ),
                      ),
                      const SizedBox(height: 15),
                     
                      _selectedFile != null
                          ? Text('Selected File: ${_selectedFile!.path}')
                          : const Text('No file selected'),
                      const SizedBox(height: 15),

                      // ElevatedButton(
                      //   onPressed: _pickFile,
                      //   child: const Column(
                      //   children: [
                      //     Icon(Icons.photo_outlined),
                      //     Text('첨부하기')
                      //   ],
                      // ),
                      // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: const Alignment(1.8, -1.8),
                        children: [
                          OutlinedButton(
                            onPressed: _pickFile,
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.all(16),
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(Icons.photo_outlined),
                                Text('첨부하기'),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.add_circle_rounded,
                            color: Colors.amber[900],
                            size: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                    //  const SizedBox(height: 20),
                    // 등록 버튼
                    const SizedBox(height: 10.0),
                    ButtonGlobalWithoutIcon(
                      buttontext: lang.S.of(context).uploadbutton,
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: _uploadFile,
                      buttonTextColor: kWhite,
                  ),
                ]),
        ),
    );
  }
}