import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file_macos/open_file_macos.dart';
import 'package:tmp_path/tmp_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _openFileMacosPlugin = OpenFileMacos();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  final tmpFile = '${tmpPath()}.txt';
                  await File(tmpFile).writeAsString('Hello world!');
                  await _openFileMacosPlugin.open(tmpFile);
                } catch (err) {
                  print(err);
                }
              },
              child: const Text('Open file'),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final tmpFile = '${tmpPath()}.txt';
                  await File(tmpFile).writeAsString('Hello world!');
                  await _openFileMacosPlugin.open(tmpFile, viewInFinder: true);
                } catch (err) {
                  print(err);
                }
              },
              child: const Text('Open file in Finder'),
            ),
          ],
        ),
      ),
    );
  }
}
