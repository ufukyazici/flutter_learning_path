import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});
  final String _titleText = "Practice";
  final String _imageName = "822957";
  final String _imageName2 = "5593976";
  final String _imageName3 = "12345";
  final String _imageLogo = "applelogo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        leading: const Icon(Icons.arrow_back_ios_rounded, size: 18),
        actions: [
          _PngImage2(imageName: _imageLogo, imageSizes: 35),
        ],
      ),
      body: Column(children: [
        _RowWidget(imageName3: _imageName),
        _RowWidget(imageName3: _imageName2),
        _RowWidget(imageName3: _imageName3),
      ]),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.accessible_forward_outlined), label: "vınnn")
      ]),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class _RowWidget extends StatelessWidget {
  const _RowWidget({
    required String imageName3,
  }) : _imageName3 = imageName3;

  final String _imageName3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _PngImage2(imageName: _imageName3, imageSizes: 160),
        _ColumnWidget(imageName: _imageName3),
        _ColumnWidget(imageName: _imageName3),
        _ColumnWidget(imageName: _imageName3)
      ],
    );
  }
}

class _ColumnWidget extends StatelessWidget {
  const _ColumnWidget({
    required String imageName,
  }) : _imageName = imageName;

  final String _imageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PngImage2(imageName: _imageName, imageSizes: 80),
        _PngImage2(imageName: _imageName, imageSizes: 80),
      ],
    );
  }
}

class _PngImage2 extends StatelessWidget {
  const _PngImage2({required String imageName, required double imageSizes})
      : _imageName = imageName,
        _imageSizes = imageSizes;

  final String _imageName;
  final double _imageSizes;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/png/$_imageName.png",
        height: _imageSizes, width: _imageSizes);
  }
}
