import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/components/home_window_header.dart';
import 'package:untitled/components/podcast_window_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/store/StoreObserver.dart';
import 'package:untitled/store/store.dart';

import 'components/drawer_item.dart';
import 'components/home_window_body.dart';
import 'components/podcast_window_body.dart';
import 'components/settings_window_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  StoreObserver observer = StoreObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_)=>StoreCubit(), child: MaterialApp(
      title: 'PodFetch Mobile',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx)=> const MainScreen(headerContent: HomeWindowHeader(),bodyContent: HomeWindowBody()),
        '/podcasts': (ctx)=>  const MainScreen(headerContent: PodcastWindowHeader(), bodyContent: PodcastWindowBody()),
        '/settings': (ctx)=> const MainScreen(headerContent: SettingsWindowHeader(), bodyContent: Text('test3')),
      },
    ));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.headerContent,
    required this.bodyContent});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Widget headerContent;
  final Widget bodyContent;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:   [
             DrawerListItem(
            title: AppLocalizations.of(context)!.home,
            icon: const Icon(Icons.home),
              path: '/',
          ),
         DrawerListItem(
          title: AppLocalizations.of(context)!.podcasts,
          path: '/podcasts',
          icon: const Icon(Icons.podcasts),
        ),
            DrawerListItem(
                title: AppLocalizations.of(context)!.settings,
                icon: const Icon(Icons.settings),
            path: '/settings',
            key: const Key('drawer_settings'))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: widget.headerContent,
        toolbarHeight: 50,
      ),
      body: widget.bodyContent
    );
  }
}
