import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_web_example/screens/home_screen.dart';
import 'package:flutter_web_example/screens/thumb_neumorphic.dart';

import 'blocs/preferences_bloc.dart';
import 'generated/l10n.dart';
import 'infrastructure/repositories/preferences_repository_impl.dart';

void main() async  {
   WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  

  final preferencesRepository = PreferencesRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferencesRepository: preferencesRepository,
    initialLocale: await preferencesRepository.locale,
  );
  runApp(
    BlocProvider(
      create: (context) => preferencesBloc,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Work',
          initialRoute: ThumNeu.id,
          routes: {
            HomeScreen.id: (context) => HomeScreen(),
            ThumNeu.id: (context) => ThumNeu(),
          },
          // home: WorkList(),
          home: ThumNeu(),
           localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: state.locale,
        
        );
      },
    );
  }
}
