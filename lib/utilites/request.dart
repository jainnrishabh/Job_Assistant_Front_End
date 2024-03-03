import 'package:dio/dio.dart';
import 'package:jobaiassitant/utilites/constants.dart';
import 'package:jobaiassitant/utilites/utility.dart';

class Request {
  Future<Dio> getApiClient(bool isPublic) async {
    Dio dio = Dio(Constants.networkOptions);
    dio.interceptors.clear();
    var token = "";
    dio.options.headers['Demo-Header'] = 'demo header';
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (!isPublic) {
          options.headers['Authorization'] = 'Bearer ' + token;
          options.headers['Access-Control-Allow-Origin'] = '*';
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        if (Utility.isNullEmptyOrFalse(error.response)) {
          return handler.next(error);
          // Fluttertoast.showToast(
          //     msg: error.message,
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        } else if (!Utility.isNullEmptyOrFalse(error.response) &&
            !Utility.isNullEmptyOrFalse(error.response!.data['message'])) {
          return handler.next(error);
          // Fluttertoast.showToast(
          //     msg: error.response.data['message'],
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        } else {
          return handler.next(error);
        }
      },
    ));
    // final exportedCollection = await PostmanDioLogger.export();
    // print(exportedCollection);
    return dio;
  }
}
