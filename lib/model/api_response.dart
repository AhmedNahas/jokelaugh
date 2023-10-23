import 'package:jokelaugh/model/joke_model.dart';

class ApiResponse {
  late bool error;
  late int amount;
  late List<Joke> jokes;

  ApiResponse();

  ApiResponse.withA(this.error, this.amount, this.jokes);

  ApiResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    amount = json['amount'];
    if (json['jokes'] != null) {
      jokes = <Joke>[];
      json['jokes'].forEach((v) {
        jokes.add(Joke.fromJson(v));
      });
    }
  }
}
