import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Constants {
  static final pageSize = 10;
  // static String baseUrl = 'http://192.168.0.120:3000';
  static String baseUrl = 'http://128.4.118.79:5000/api/data';
  static final String appVersion = 'v2.0.5';
  static String listEndMessage = 'It looks like you\'ve reached the end';
  static BaseOptions networkOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: Duration(milliseconds: 150000),
    receiveTimeout: Duration(milliseconds: 100000),
  );
  static int pageLimite = 10;
  static Color? shimmerBaseColor = Colors.grey[300];
  static Color? shimmerHighlightColor = Colors.grey[100];
  static Color? backgroundColor = Colors.grey[100];
  static TextStyle processButton =
      TextStyle(fontFamily: 'Poppins', fontSize: 20);
  static TextStyle manuallyButton = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: Color(0xff2B2B2B),
  );
}
