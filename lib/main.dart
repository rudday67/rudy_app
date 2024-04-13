import 'package:flutter/material.dart';
import 'package:rudy_app/screens/home_screen.dart';
import 'package:rudy_app/screens/news_screen.dart';
import 'package:rudy_app/screens/routes/BooksScreen/books_screen.dart';
import 'package:rudy_app/screens/routes/NewsScreen/create_news_screen.dart';
import 'package:rudy_app/screens/routes/SecondScreen/custom_screen.dart';
import 'package:rudy_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:rudy_app/screens/setting_screen.dart';
import 'package:rudy_app/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Home Screen'),
      routes: {
        '/second-screen': (context) => const SecondScreen(),
        '/custom-screen': (context) => const CustomScreen(),
        '/news-screen': (context) => const NewsScreen(),
        '/create-news-screen': (context) => const CreateNewsScreen(),
        '/books-screen': (context) => const BooksScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SettingScreen(),
    const ProfileScreen(),
    const BooksScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Settings',
    'Latihan API',
    'Latihan CRUD',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateAndCloseDrawer(BuildContext context, String routeName) {
    if (Scaffold.of(context).isDrawerOpen) {
      Navigator.pop(context); // Close the drawer first
    }
    Navigator.pushNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('Rudy Satya 4A'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Latihan API'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Latihan CRUD'),
              selected: _selectedIndex == 3,
              onTap: () {
                // Update the state of the app
                _onItemTapped(3);
                // // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            // ignore: unnecessary_const
            icon: const Icon(
              Icons.home,
              color: Colors.blueGrey, // Ubah warna ikon untuk item 'Home'
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.blueGrey, // Ubah warna ikon untuk item 'Settings'
            ),
            label: 'Settings',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color:
                  Colors.blueGrey, // Ubah warna ikon untuk item 'Latihan API'
            ),
            label: 'Latihan API',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.note_add,
              color:
                  Colors.blueGrey, // Ubah warna ikon untuk item 'Latihan CRUD'
            ),
            label: 'Latihan CRUD',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black87,
        onTap: _onItemTapped,
      ),
    );
  }
}
