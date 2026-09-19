import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:ict_hub_flutter/injection_container.dart';

// Auth
import '/features/auth/presentation/pages/login_page.dart';
import '/features/auth/presentation/pages/sign_up_page.dart';
import '/features/auth/presentation/pages/verification_page.dart';

// Products
import '/features/products/presentation/pages/products_page.dart';
import '/features/products/presentation/pages/product_details_page.dart';

// Product Cubit
import '/features/products/presentation/cubit/product_cubit.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: "/login",

    routes: [

      // =========================
      // Auth
      // =========================

      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return const LoginPage();
        },
      ),

      GoRoute(
        path: "/sign-up",
        name: "signUp",
        builder: (context, state) {
          return const SignUpPage();
        },
      ),

      GoRoute(
        path: "/verification",
        name: "verification",
        builder: (context, state) {
          return const VerificationPage();
        },
      ),

      // =========================
      // Products
      // =========================

      ShellRoute(
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => getIt<ProductCubit>(),
            child: child,
          );
        },
        routes: [

          GoRoute(
            path: "/products",
            name: "products",
            builder: (context, state) {
              return const ProductsPage();
            },
          ),

          GoRoute(
            path: "/product-details",
            name: "productDetails",
            builder: (context, state) {
              final String? id =
              state.uri.queryParameters['id'];

              return ProductDetailsPage(
                productId: id ?? "",
              );
            },
          ),

        ],
      ),
    ],
  );
}