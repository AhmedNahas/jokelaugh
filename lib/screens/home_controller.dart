import 'package:get/get.dart';
import 'package:jokelaugh/constants/api_endpoint.dart';
import 'package:jokelaugh/model/joke_model.dart';
import 'package:jokelaugh/model/api_response.dart';
import 'package:jokelaugh/network/dio_helper.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var jokesList = <Joke>[].obs;
  var isDarkMode = false.obs;

  @override
  void onInit() {
    DioHelper.init();
    getAllJokes(ApiEndpoint.getAnyJokes);
    super.onInit();
  }

  void getAllJokes(String endPoint) async {
    isLoading(true);
    jokesList.clear();
    DioHelper.getAllJokes(endPoint).then(
      (value) {
        ApiResponse response = ApiResponse.fromJson(value?.data);
        for (var joke in (response.jokes)) {
          Joke data = joke;
          jokesList.add(data);
        }
        isLoading(false);
      },
    ).catchError(
      (error) {
        printError(info: error);
      },
    );
  }
}
