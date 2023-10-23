import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokelaugh/constants/color_constants.dart';
import 'package:jokelaugh/controllers/app_theme.dart';
import 'package:jokelaugh/controllers/theme_controller.dart';
import 'package:jokelaugh/model/joke_model.dart';
import 'package:jokelaugh/screens/home_controller.dart';
import 'package:jokelaugh/widgets/side_drawer.dart';

class HomeScreen extends StatefulWidget {
  final ScrollController _scrollController = ScrollController();

  HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  final themeController = Get.find<ThemeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen(),
          ),
          (route) => false,
        );
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor:
              context.isDarkMode ? Colors.black : AppColors.babyPink,
          appBar: AppBar(
            title: const Text("Jokes app"),
            actions: [
              IconButton(
                onPressed: () {
                  if (context.isDarkMode) {
                    themeController.changeTheme(Themes.lightTheme);
                    themeController.saveTheme(false);
                  } else {
                    themeController.changeTheme(Themes.darkTheme);
                    themeController.saveTheme(true);
                  }
                },
                icon: context.isDarkMode
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
              ),
            ],
          ),
          drawer: const SideDrawer(),
          body: Obx(
            () {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    controller: widget._scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (listViewContext, index) => GestureDetector(
                        onTap: () {},
                        child: jokeWidgetItem(controller.jokesList[index])),
                    itemCount: controller.jokesList.length,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget jokeWidgetItem(Joke joke) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8.0,
        ),
        Text(
          '${joke.joke}',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: context.isDarkMode ? Colors.white : AppColors.darkBlue,
          ),
          maxLines: 2,
        ),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget._scrollController.dispose();
  }
}
