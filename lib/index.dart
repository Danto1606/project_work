///
///dart
export 'dart:developer' show log;
export 'dart:isolate';

///
///flutter
export 'package:flutter/material.dart' hide basicLocaleListResolution;
export 'package:async/async.dart' show StreamQueue;
export 'package:flutter/src/foundation/constants.dart';

///
///third parties
export 'package:get/get.dart';

///
///modules

//pages
export 'app/routes/app_pages.dart';

//bindings
export 'app/modules/dashboard/home/bindings/home_binding.dart';
export 'app/modules/dashboard/bindings/dashboard_binding.dart';
export 'app/modules/dashboard/profile/bindings/profile_binding.dart';
export 'app/modules/login/bindings/login_binding.dart';
export 'app/modules/signup/bindings/signup_binding.dart';
export 'app/modules/book/bindings/book_binding.dart';
export 'app/data/bindings/binding.dart';

//controller
export 'app/modules/dashboard/controllers/dashboard_controller.dart';
export 'app/modules/dashboard/home/controllers/home_controller.dart';
export 'app/modules/login/controllers/login_controller.dart';
export 'app/modules/dashboard/profile/controllers/profile_controller.dart';
export 'app/modules/signup/controllers/signup_controller.dart';
export 'app/modules/book/controllers/book_controller.dart';

//view
export 'app/modules/dashboard/views/dashboard_view.dart';
export 'app/modules/dashboard/profile/views/profile_view.dart';
export 'app/modules/dashboard/home/views/home_view.dart';
export 'app/modules/login/views/login_view.dart';
export 'app/modules/signup/views/signup_view.dart';
export 'app/modules/book/views/book_view.dart';
///
///data

//services
export 'app/data/services/local_service.dart';
export 'app/data/services/session_service.dart';
export 'app/data/services/books_service.dart';

//providers
export 'app/data/providers/user_provider.dart';
export 'app/data/providers/util_provider.dart';

//models
export 'app/data/models/category_model.dart';
export 'app/data/models/book_model.dart';
export 'app/data/models/user_model.dart';

///
///core
export 'app/core/utils/dimensions.dart';
export 'app/core/constants/endpoints.dart';
export 'app/core/constants/const_colors.dart';
export 'app/core/themes/light_theme.dart';

//widgets
export 'app/modules/widgets/category.dart';
export 'app/modules/widgets/product.dart';
