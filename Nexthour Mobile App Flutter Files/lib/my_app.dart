import 'package:flutter/material.dart';
import 'providers/actor_movies_provider.dart';
import 'providers/app_config.dart';
import 'common/route_paths.dart';
import 'package:provider/provider.dart';
import 'common/styles.dart';
import 'providers/faq_provider.dart';
import 'providers/login_provider.dart';
import 'providers/main_data_provider.dart';
import 'providers/menu_data_provider.dart';
import 'providers/menu_provider.dart';
import 'providers/movie_tv_provider.dart';
import 'providers/notifications_provider.dart';
import 'providers/payment_key_provider.dart';
import 'providers/slider_provider.dart';
import 'providers/user_profile_provider.dart';
import 'providers/wishlist_provider.dart';
import 'ui/route_generator.dart';
import 'ui/screens/splash_screen.dart';
import 'providers/watch_history_provider.dart';

class MyApp extends StatelessWidget {
  MyApp({this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppConfig()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => UserProfileProvider()),
          ChangeNotifierProvider(create: (_) => MenuProvider()),
          ChangeNotifierProvider(create: (_) => SliderProvider()),
          ChangeNotifierProvider(create: (_) => MainProvider()),
          ChangeNotifierProvider(create: (_) => MovieTVProvider()),
          ChangeNotifierProvider(create: (_) => MenuDataProvider()),
          ChangeNotifierProvider(create: (_) => WishListProvider()),
          ChangeNotifierProvider(create: (_) => NotificationsProvider()),
          ChangeNotifierProvider(create: (_) => FAQProvider()),
          ChangeNotifierProvider(create: (_) => PaymentKeyProvider()),
          ChangeNotifierProvider(create: (_) => WatchHistoryProvider()),
          ChangeNotifierProvider(create: (_) => ActorMoviesProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: RoutePaths.appTitle,
            theme: buildDarkTheme(),
            initialRoute: RoutePaths.splashScreen,
            onGenerateRoute: RouteGenerator.generateRoute,
            routes: {
              RoutePaths.splashScreen: (context) => SplashScreen(token: token),
            },
        ),
    );
  }
}
