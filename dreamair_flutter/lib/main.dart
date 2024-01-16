import 'package:flight_booking/screen/Authentication/splash%20screen/splash_screen.dart';
import 'package:flight_booking/screen/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          locale: Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          title: 'Flight Booking',
          theme: ThemeData(fontFamily: 'Display'),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
