import 'package:fashion/models/product_model.dart';
import 'package:fashion/screens/home.dart';
import 'package:fashion/screens/checkout.dart';
import 'package:fashion/screens/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const kCheckOut = "/checkout';";
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const Home()),
      GoRoute(
        path: AppRouter.kCheckOut,
        builder: (context, state) {
          final product = state.extra as ProductModel;
          return CheckOut(product: product);
        },
      ),
    ],
  );
}
