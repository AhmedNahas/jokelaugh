import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jokelaugh/constants/api_endpoint.dart';
import 'package:jokelaugh/constants/color_constants.dart';
import 'package:jokelaugh/screens/home_controller.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Jokes app',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              leading: Icon(
                Icons.change_circle_sharp,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
              title: Text(
                "Any",
                style: TextStyle(
                  fontSize: 18.0,
                  color: context.isDarkMode
                      ? AppColors.spaceCadet
                      : AppColors.spaceBlue,
                ),
              ),
              onTap: () {
                Get.find<HomeController>().getAllJokes(ApiEndpoint.getAnyJokes);
                Get.back();
              }),
          ListTile(
            leading: Icon(
              Icons.add_reaction_sharp,
              color: context.isDarkMode
                  ? AppColors.spaceCadet
                  : AppColors.spaceBlue,
            ),
            title: Text(
              "Programming",
              style: TextStyle(
                fontSize: 18.0,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              Get.find<HomeController>()
                  .getAllJokes(ApiEndpoint.getProgrammingJokes);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_task_sharp,
              color: context.isDarkMode
                  ? AppColors.spaceCadet
                  : AppColors.spaceBlue,
            ),
            title: Text(
              "Misc",
              style: TextStyle(
                fontSize: 18.0,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              Get.find<HomeController>().getAllJokes(ApiEndpoint.getMiscJokes);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.toggle_on_sharp,
              color: context.isDarkMode
                  ? AppColors.spaceCadet
                  : AppColors.spaceBlue,
            ),
            title: Text(
              "Dark",
              style: TextStyle(
                fontSize: 18.0,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              Get.find<HomeController>().getAllJokes(ApiEndpoint.getDarkJokes);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_comment_sharp,
              color: context.isDarkMode
                  ? AppColors.spaceCadet
                  : AppColors.spaceBlue,
            ),
            title: Text(
              "Pun",
              style: TextStyle(
                fontSize: 18.0,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              Get.find<HomeController>().getAllJokes(ApiEndpoint.getPunJokes);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.update_sharp,
              color: context.isDarkMode
                  ? AppColors.spaceCadet
                  : AppColors.spaceBlue,
            ),
            title: Text(
              "Spooky",
              style: TextStyle(
                fontSize: 18.0,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              Get.find<HomeController>()
                  .getAllJokes(ApiEndpoint.getSpookyJokes);
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.update_sharp,
              color: context.isDarkMode
                  ? AppColors.spaceCadet
                  : AppColors.spaceBlue,
            ),
            title: Text(
              "Christmas",
              style: TextStyle(
                fontSize: 18.0,
                color: context.isDarkMode
                    ? AppColors.spaceCadet
                    : AppColors.spaceBlue,
              ),
            ),
            onTap: () {
              Get.find<HomeController>()
                  .getAllJokes(ApiEndpoint.getChristmasJokes);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
