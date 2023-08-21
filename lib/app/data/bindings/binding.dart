import 'package:project_work/index.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    //providers
    Get.lazyPut<UserProvider>(
      () => UserProvider(),
      fenix: true,
    );

    Get.lazyPut<UtilProvider>(
      () => UtilProvider(),
      fenix: true,
    );

    //services
    Get.lazyPut<SessionService>(
      () => SessionService(),
      fenix: true,
    );
    Get.lazyPut<BookService>(
      () => BookService(),
      fenix: true,
    );

    Get.lazyPut<LocalService>(
      () => LocalService(),
      fenix: true,
    );
  }
}
