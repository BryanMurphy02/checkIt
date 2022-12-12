import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final appState = FFAppState(); // Initialize FFAppState

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<Checkit2FirebaseUser> userStream;
  Checkit2FirebaseUser? initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = checkit2FirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'checkit2',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/bXKGRIOYB.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : currentUser!.loggedIn
              ? NavBarPage()
              : SplashScreenWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'mySubjects';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomeFeedScreen': HomeFeedScreenWidget(),
      'NewTaskScreen': NewTaskScreenWidget(),
      'mySubjects': MySubjectsWidget(),
      'InteractionsScreen': InteractionsScreenWidget(),
      'AllChatsScreen': AllChatsScreenWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: FloatingNavbar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).primaryBlack,
          selectedItemColor: FlutterFlowTheme.of(context).white,
          unselectedItemColor: FlutterFlowTheme.of(context).davysGrey,
          selectedBackgroundColor: FlutterFlowTheme.of(context).skyBlueCrayola,
          borderRadius: 40,
          itemBorderRadius: 40,
          margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 12),
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
          width: double.infinity,
          elevation: 4,
          items: [
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_filled,
                    color: currentIndex == 0
                        ? FlutterFlowTheme.of(context).white
                        : FlutterFlowTheme.of(context).davysGrey,
                    size: 24,
                  ),
                  Text(
                    'Home',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 0
                          ? FlutterFlowTheme.of(context).white
                          : FlutterFlowTheme.of(context).davysGrey,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_sharp,
                    color: currentIndex == 1
                        ? FlutterFlowTheme.of(context).white
                        : FlutterFlowTheme.of(context).davysGrey,
                    size: 24,
                  ),
                  Text(
                    'New ',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 1
                          ? FlutterFlowTheme.of(context).white
                          : FlutterFlowTheme.of(context).davysGrey,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    currentIndex == 2 ? Icons.view_list : Icons.view_list,
                    color: currentIndex == 2
                        ? FlutterFlowTheme.of(context).white
                        : FlutterFlowTheme.of(context).davysGrey,
                    size: 32,
                  ),
                  Text(
                    'Subjects',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 2
                          ? FlutterFlowTheme.of(context).white
                          : FlutterFlowTheme.of(context).davysGrey,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: currentIndex == 3
                        ? FlutterFlowTheme.of(context).white
                        : FlutterFlowTheme.of(context).davysGrey,
                    size: 24,
                  ),
                  Text(
                    'Interactions',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 3
                          ? FlutterFlowTheme.of(context).white
                          : FlutterFlowTheme.of(context).davysGrey,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    currentIndex == 4
                        ? Icons.chat_bubble_rounded
                        : Icons.chat_bubble_outline,
                    color: currentIndex == 4
                        ? FlutterFlowTheme.of(context).white
                        : FlutterFlowTheme.of(context).davysGrey,
                    size: 24,
                  ),
                  Text(
                    'Chat',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 4
                          ? FlutterFlowTheme.of(context).white
                          : FlutterFlowTheme.of(context).davysGrey,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
