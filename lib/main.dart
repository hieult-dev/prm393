import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(child: MyWidget()),
          // appBar: AppBar(
          //   backgroundColor: Colors.red,
          //   title: const Text('Tự học flutter'),
          // ),
          // body: const Center(
          //     child: Text('Hello world')
          // ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
          'Dự án giải pháp phần mềm chuyển đổi số cho các shop spa'
              ' thú cưng và người nuôi thú cưng ứng dụng AI, chatBot vào để tư vấn sức '
              'khỏe cho thú cưng dựa trên từng chỉ số, thông tin của thú cưng'),
    );
  }
}

// class MyWidget2 extends StatefulWidget {
//   final bool loading;
//
//   MyWidget2(this.loading);
//
//   @override
//   State<StatefulWidget> createState() {
//     return MyWidget2State();
//   }
// }

// class MyWidget2State extends State<MyWidget2> {
//   late bool _localLoading;
//
//   // chạy khi MyWidget2 được gọi và chạy trước build
//   @override
//   void initState() {
//     _localLoading = widget.loading;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // widget laf 1 instance của MyWidget2
//     return _localLoading
//         ? const CircularProgressIndicator()
//         : FloatingActionButton(onPressed: onClickButton);
//   }
//
//   void onClickButton() {
//     setState(() {
//       _localLoading = true;
//     });
//   }
// }
