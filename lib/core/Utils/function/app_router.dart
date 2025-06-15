import 'package:fashion/screens/home.dart';
import 'package:fashion/screens/product_details.dart';
import 'package:fashion/screens/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const kProductDetails = "/product-details";
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const Home()),
      GoRoute(
        path: kProductDetails,
        builder: (context, state) => const ProductDetails(),
      ),
    ],
  );
}
