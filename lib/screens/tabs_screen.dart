import 'package:flutter/material.dart';
import '../screens/infojournal_screen.dart';
import '../screens/infoloyalty_screen.dart';
import '../screens/start_screen.dart';
import '../screens/brew_screen.dart';
import '../widgets/main_drawer.dart';
import './home_items_screen.dart';
import './journal_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/language_picker_widget.dart';
import 'package:provider/provider.dart';
import '../providers/locale_provider.dart';

class TabsScreen extends StatefulWidget {
  final int index;
  TabsScreen(this.index);
  static const routeName = '/tabs';
  @override
  _TabScreenState createState() => _TabScreenState(index);
}

class _TabScreenState extends State<TabsScreen> {
  String token;
  String userId;
  Future<Map<String, dynamic>> myData;
  List<Map<String, Object>> _pages;
  List<Map<String, Object>> _pagesnotloggedin;
  @override
  void initState() {
    super.initState();
    getFireToken();
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if (mounted) {
        setState(() {});
      }
    });
    _pages = [
      {'page': HomeItemsScreen(), 'title': 'HOME'},
      {'page': StartScreen(true), 'title': 'LOYALTY'},
      {'page': BrewScreen(true), 'title': 'BREW'},
      {'page': JournalList(true), 'title': 'COFFEE JOURNAL'}
    ];
    _pagesnotloggedin = [
      {'page': HomeItemsScreen(), 'title': 'HOME'},
      {'page': InfoLoyaltyScreen(true), 'title': 'LOYALTY'},
      {'page': BrewScreen(true), 'title': 'BREW'},
      {'page': InfoJournalScreen(true), 'title': 'COFFEE JOURNAL'}
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> getFireToken() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User user = _auth.currentUser;
    if (user != null) {
      final uid = user.uid;
      userId = uid;
    }
  }

  int _selectedPageIndex;

  _TabScreenState(this._selectedPageIndex);

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void updateScreen() {
    setState(() {
      _selectedPageIndex = 1;
    });
  }

  double fontSize(int index) {
    return 16.0;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 249, 242, 1),
      endDrawer: MainDrawer(),
      appBar: AppBar(
        leading: FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: provider.locale.toString() == "ar"
                  ? const EdgeInsets.fromLTRB(0, 0, 13, 0)
                  : const EdgeInsets.fromLTRB(13, 0, 0, 0),
              child: LanguagePickerWidget(),
            )),
      ),
      body: FirebaseAuth.instance.currentUser != null
          ? _pages[_selectedPageIndex]['page']
          : _pagesnotloggedin[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: fontSize(_selectedPageIndex),
        onTap: _selectPage,
        backgroundColor: Color.fromRGBO(252, 249, 242, 1),
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        unselectedFontSize: 14,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.home,
            ),
            label: AppLocalizations.of(context).home,
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.loyalty,
              ),
              label: AppLocalizations.of(context).loyalty),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.local_cafe,
              ),
              label: AppLocalizations.of(context).brew),
          BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.book,
              ),
              label: AppLocalizations.of(context).coffeejournalhome)
        ],
      ),
    );
  }
}
