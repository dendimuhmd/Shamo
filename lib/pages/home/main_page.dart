import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlisht_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'lib/assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 16,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              currentIndex: currentIndex,
              backgroundColor: backgroundColor4,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'lib/assets/icon_home.png',
                        width: 21,
                        color: currentIndex == 0
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'lib/assets/icon_chat.png',
                        width: 20,
                        color: currentIndex == 1
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'lib/assets/icon_wishlist.png',
                        width: 18,
                        color: currentIndex == 2
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
                BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      child: Image.asset(
                        'lib/assets/image_profile.png',
                        width: 18,
                        color: currentIndex == 3
                            ? primaryColor
                            : Color(0xff808191),
                      ),
                    )),
              ]),
        ),
      );
    }

    Widget? body() {
      switch (currentIndex) {
        case 0:
          return const HomePage();

        case 1:
          return const ChatPage();

        case 2:
          return const WishlistPage();

        case 3:
          return const ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      bottomNavigationBar: customButtonNav(),
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(),
    );
  }
}
