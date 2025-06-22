import 'package:fashion/models/product_model.dart';
import 'package:fashion/screens/home/home.dart';
import 'package:fashion/screens/checkout/checkout.dart';
import 'package:fashion/screens/personal_data.dart';
import 'package:fashion/screens/place_order/place_order.dart';
import 'package:fashion/screens/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const kCheckOut = "/checkout";
  static const kPlaceOrder = "/placeorder";
  static const kPresonalData = "/presonaldata";

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
      GoRoute(
        path: AppRouter.kPlaceOrder,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          final product = data['product'] as ProductModel;
          final total = data['total'] as double;

          return PlaceOrder(product: product, total: total);
        },
      ),
      GoRoute(
        path: AppRouter.kPresonalData,
        builder: (context, state) => PresonalData(),
      ),
    ],
  );
}
