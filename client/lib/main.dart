import 'package:flutter/material.dart';
import 'screens/home.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: "Toys MCH",
    theme: ThemeData(fontFamily: "ProximaNova"),
    home: const AppNavigation(),
  ));
}

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const Text("Favorite"),
    const Text("Cart"),
    const Text("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: _widgetOptions[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? const Color(0xFFA95AC5)
                            : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.home_outlined,
                          color: _selectedIndex == 0
                              ? Colors.white
                              : const Color(0xFFA95AC5)),
                    )),
                tooltip: "Home",
                label: ""),
            BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? const Color(0xFFA95AC5)
                            : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite_border_outlined,
                          color: _selectedIndex == 1
                              ? Colors.white
                              : const Color(0xFFA95AC5)),
                    )),
                tooltip: "Favorite",
                label: ""),
            BottomNavigationBarItem(
              icon: Container(
                  decoration: BoxDecoration(
                      color: _selectedIndex == 2
                          ? const Color(0xFFA95AC5)
                          : Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart_outlined,
                        color: _selectedIndex == 2
                            ? Colors.white
                            : const Color(0xFFA95AC5)),
                  )),
              tooltip: "Cart",
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedIndex == 3
                            ? const Color(0xFFA95AC5)
                            : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100.0))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.person_outlined,
                          color: _selectedIndex == 3
                              ? Colors.white
                              : const Color(0xFFA95AC5)),
                    )),
                tooltip: "Profile",
                label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
