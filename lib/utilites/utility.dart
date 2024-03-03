import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:jobaiassitant/utilites/constants.dart';

// import 'package:shared_preferences/shared_preferences.dart';

class Utility {
  static final storage = new FlutterSecureStorage();
  static bool isNullEmptyOrFalse(Object? o) {
    return o == null || false == o || "" == o || "null" == o || "false" == o;
  }

  static bool isNotNullEmptyOrFalse(Object? o) {
    return !isNullEmptyOrFalse(o);
  }

  static int count(any) {
    var count = 0;
    any.forEach((app) {
      if (app['status'] == 0) {
        count++;
      }
    });
    return count;
  }

  static int? notificationscount(any) {
    int? count = 0;
    count = any.length;
    return count;
  }

  static Future storeCookie(var userCookie, String? cookieName) async {
    Future added = storage.write(key: userCookie, value: cookieName);
    return added;
  }

  static Future<String> getCookies(String cookieName) async {
    String? cookies = await storage.read(key: cookieName);
    if (cookies != null) {
      return cookies;
    } else {
      return '';
    }
  }

  static Future<void> deleteCookie(String cookieName) async {
    await storage
        .delete(
          key: cookieName,
        )
        .then((value) => print('done'));

    String tess = await Utility.getCookies('IMEI1');
    print(tess);
  }

  static String formateDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formatter.format(date);
  }

  static String formateDateTime(DateTime date) {
    var dateValue = new DateFormat("yyyy-MM-dd HH:mm:ssZ")
        .parseUTC(date.toString())
        .toLocal();
    String formattedDate = DateFormat("dd MMM yyyy, hh:mm a").format(dateValue);
    // final DateFormat formatter = DateFormat('dd MMM yyyy');
    return formattedDate;
  }

  static logout(context) {
    storage.deleteAll().then((value) {
      Utility.storeCookie('guidelineCheck', 'true');
      Navigator.popAndPushNamed(context, '/login');
    });
  }

  static String getQuery(Params? query) {
    String url = '?';
    if (isNotNullEmptyOrFalse(query)) {
      if (isNotNullEmptyOrFalse(query!.page)) {
        url += 'page=${query.page}&';
      }
      if (isNotNullEmptyOrFalse(query.limit)) {
        url += 'limit=${query.limit}&';
      }
      if (isNotNullEmptyOrFalse(query.offset)) {
        url += 'offset=${query.offset}&';
      }
      if (isNotNullEmptyOrFalse(query.sorts) && query.sorts.length > 0) {
        query.sorts.forEach((sort) {
          url += 'sort=${sort.field},${sort.type}&';
        });
      }
      if (isNotNullEmptyOrFalse(query.filters) && query.filters.length > 0) {
        query.filters.forEach((filter) {
          url +=
              'filter=${filter.field}||${filter.condition}||${filter.value}&';
        });
      }
    }
    return url;
  }

  static int getGenderByNumber(String genderText) {
    var gender = 0;
    switch (genderText) {
      case 'Male':
        gender = 0;
        break;
      case 'Female':
        gender = 1;
        break;
      case 'Transgender':
        gender = 2;
        break;
    }
    return gender;
  }

  static int getAge(DateTime dateOfBirth) {
    var today = DateTime.now();

    var a = (today.year * 100 + today.month) * 100 + today.day;
    var b =
        (dateOfBirth.year * 100 + dateOfBirth.month) * 100 + dateOfBirth.day;

    return ((a - b) ~/ 10000);
  }
}

class Params {
  int page = 1;
  int limit = Constants.pageLimite;
  int? offset;
  List<Sort> sorts = [];
  List<Filter> filters = [];
  Params() {
    filters.add(new Filter('enabled', '\$eq', 'true'));
  }
}

class Filter {
  String field;
  String condition;
  String? value;
  Filter(this.field, this.condition, this.value);
}

class Sort {
  String field;
  String type;
  Sort(this.field, this.type);
}

class PageResponseModel<P> {
  List<P>? data;
  int? total;
  int? count;
  int? page;
  int? pageCount;
}
