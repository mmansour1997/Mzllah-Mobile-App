import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './l10n/L10n.dart';
import './screens/coffee_detail_screen.dart';
import './screens/coffee_screen.dart';
import './screens/infojournal_screen.dart';
import './screens/infoloyalty_screen.dart';
import './screens/reset_screen.dart';
import './screens/aeropress.dart';
import './screens/chemex.dart';
import './screens/v60.dart';
import './screens/splash_screen.dart';
import './screens/auth_screen.dart';
import './screens/loyalty_detail_screen.dart';
import './screens/loyalty_price.dart';
import './screens/journal_detail_screen.dart';
import './screens/journal_list.dart';
import './screens/journal_screen.dart';
import './screens/brew_screen.dart';
import './screens/tabs_screen.dart';
import './screens/about_screen.dart';
import './screens/location_screen.dart';
import './screens/loyalty_screen.dart';
import './screens/home_items_screen.dart';
import './providers/entry_data.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:upgrader/upgrader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import './providers/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      home: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      dialogStyle: UpgradeDialogStyle.material,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Entries>(
            create: null,
            update: (ctx, auth, previousEntries) => Entries(
                auth.token,
                auth.userId,
                previousEntries == null ? [] : previousEntries.items),
          ),
          ChangeNotifierProvider(
            create: (context) => LocaleProvider(),
          )
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) {
            final lanprovider = Provider.of<LocaleProvider>(ctx);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mzllah',
              locale: lanprovider.locale,
              supportedLocales: L10n.all,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate
              ],
              theme: ThemeData(
                  primaryColor: Color.fromRGBO(252, 249, 242, 1),
                  accentColor: Colors.orange.shade200,
                  hintColor: Colors.grey,
                  fontFamily: 'Lyon',
                  appBarTheme: AppBarTheme(
                    iconTheme: IconThemeData(color: Colors.black),
                    toolbarTextStyle: TextStyle(color: Colors.black),
                    titleTextStyle: TextStyle(color: Colors.black),
                    backgroundColor: Color.fromRGBO(252, 249, 242, 1),
                    textTheme: ThemeData.light().textTheme.copyWith(
                        headline6: TextStyle(
                            fontFamily: 'Lyon',
                            fontSize: 20,
                            color: Colors.black)),
                  )),
              home: auth.isAuth
                  ? TabsScreen(0)
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : TabsScreen(0),
                    ),
              routes: {
                HomeItemsScreen.routeName: (ctx) => HomeItemsScreen(),
                AboutScreen.routeName: (ctx) => AboutScreen(),
                LocationScreen.routeName: (ctx) => LocationScreen(),
                LoyaltyScreen.routeName: (ctx) => LoyaltyScreen(false),
                BrewScreen.routeName: (ctx) => BrewScreen(false),
                JournalScreen.routeName: (ctx) => JournalScreen(),
                JournalList.routeName: (ctx) => JournalList(false),
                JournalDetail.routeName: (ctx) => JournalDetail(),
                LoyaltyPrice.routeName: (ctx) => LoyaltyPrice(),
                LoyaltyDetailScreen.routeName: (ctx) => LoyaltyDetailScreen(),
                StartScreen.routeName: (ctx) => StartScreen(false),
                AeroPress.routeName: (ctx) => AeroPress(),
                Chemex.routeName: (ctx) => Chemex(),
                V60.routeName: (ctx) => V60(),
                TabsScreen.routeName: (ctx) => TabsScreen(0),
                AuthScreen.routeName: (ctx) => AuthScreen(),
                ResetScreen.routeName: (ctx) => ResetScreen(),
                InfoLoyaltyScreen.routeName: (ctx) => InfoLoyaltyScreen(false),
                InfoJournalScreen.routeName: (ctx) => InfoJournalScreen(false),
                CoffeeScreen.routeName: (ctx) => CoffeeScreen(false),
                CoffeeDetail.routeName: (ctx) => CoffeeDetail()
              },
              onGenerateRoute: (settings) {
                print(settings.arguments);
                return MaterialPageRoute(builder: (ctx) => HomeItemsScreen());
              },
              onUnknownRoute: (settings) {
                return MaterialPageRoute(builder: (ctx) => HomeItemsScreen());
              },
            );
          },
        ),
      ),
    );
  }
}
