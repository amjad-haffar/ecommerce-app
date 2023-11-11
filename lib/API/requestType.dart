
import 'package:ecommerce/API/request.dart';
import 'package:ecommerce/model/model.dart';
import 'package:get/get.dart';

typedef JsonDecoder<T> = Function(Map<String, dynamic> json);

// typedef Empty<T> = T Function();

class Request {
  static Future<T> getModel<T>(
    String url,
    JsonDecoder<T> fromJson,
  ) async {
    var body = {};
    var data = await RequestDio.callAPI(
      url,
      body,
      'GET',
    );
    print(data);
    dynamic object;
    if (data != null) {
      T r = fromJson(data);
      object = r;
      return object;
    }
    return object;
  }

  static Future<List<T>> getAllModel<T>(
    String url,
    JsonDecoder<T> fromJson,
  ) async {
    var body = {};
    var data = await RequestDio.callAPI(
      url,
      body,
      'GET',
    );
    List<T> objects = [];
    if (data == []) {
      return [];
    } else {
      if (data != null) {
        for (dynamic d in data[data.keys.toList()[0]]) {
          T r = fromJson(d);
          objects.add(r);
        }
        return objects;
      }
      return [];
    }
  }

  static Future<String> createModel(Model obj, String url) async {
    var body = {};
    body = obj.toJson();
    var data = await RequestDio.callAPI(
      url,
      body,
      'POST',
    );
    print(data);
    if (data['success']) {
      Get.snackbar(
        'message',
        'Task added successfully',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      return data['data']['_id'];
    } else {
      Get.snackbar(
        'Failed',
        'something went wrong',
        duration: const Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
      );
      return "";
    }
  }

  static Future<bool> deleteModelByID<T>(String url) async {
    var body = {};
    var data = await RequestDio.callAPI(
      url,
      body,
      'DELETE',
    );
    try {
      if (data['success']) {
        Get.snackbar(
          'message',
          'Task Deleted successfully',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      }
    } catch (e, stacktrace) {
      print("deleted model() | catch exception");
      print(e);
      print(stacktrace);
    }
    Get.snackbar(
      'Failed',
      'something went wrong',
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }

  static Future<bool> updateModel(Model obj, String url) async {
    try {
      var body = obj.toJson();
      var data = await RequestDio.callAPI(url, body, 'PUT');
      if (data != null) {
        Get.snackbar(
          'message',
          'Task updated successfully',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM,
        );
        return true;
      }
    } catch (e, stacktrace) {
      print("updateModel() | catch exception");
      print(e);
      print(stacktrace);
    }
    Get.snackbar(
      'Failed',
      'something went wrong',
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
    );
    return false;
  }
}
