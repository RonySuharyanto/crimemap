import 'package:crimemap/screens/akun_page.dart';
import 'package:crimemap/screens/dashboard_page.dart';
import 'package:crimemap/screens/editprofile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  //

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, Object>> _pages = [
    {
      'page': DashboardPage(),
      'title': 'Dashboard',
    },
    {
      'page': AkunPage(),
      'title': 'Akun',
    },
  ];

  int _selectedPageIndex = 0;

  Future<void> _selectPage(int index) async {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(_pages[_selectedPageIndex]['title']);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      actions: <Widget>[
        (_pages[_selectedPageIndex]['title'] == 'Akun') ? FlatButton(onPressed: (){
          print('editprofile page');
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
        }, child: Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 18),),) : Text('')
      ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(0.3),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            title: Text('Akun'),
          ),
        ],
      ),
    );
  }
}
