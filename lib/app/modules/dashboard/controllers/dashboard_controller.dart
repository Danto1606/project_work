import 'package:project_work/index.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  bool isDrag = false;
  var pages = AppPages.routes.first.children;
  bool isForward = true;

  @override
  void onReady() {}

  @override
  void onClose() {}

  void setIndex(int index) {
    if (index == selectedIndex.value) return;
    isForward = index > selectedIndex.value;
    if (index < 0) index = 2;
    if (index > 2) index = 0;

    switch (index) {
      case 1:
        Get.offAndToNamed(Routes.ADD, id: 1);
        break;
      case 2:
        Get.offAndToNamed(Routes.PROFILE, id: 1);
      default:
        Get.offAndToNamed(Routes.HOME, id: 1);
    }
    selectedIndex.value = index;
  }

  Route onGenerate(RouteSettings settings) {
    GetPage page;
    switch (settings.name) {
      case Routes.ADD:
        page = pages[1];
      case Routes.PROFILE:
        page = pages[2];
      default:
        page = pages[0];
    }

    return GetPageRoute(
      settings: settings,
      page: page.page,
      binding: page.binding,
      transition: isForward ? Transition.rightToLeft : Transition.leftToRight,
    );
  }

  void horizontalNav(DragUpdateDetails details) async {
    if (isDrag) return;

    isDrag = true;
    int index = selectedIndex.value;

    if (details.delta.dx > 0) {
      setIndex(index - 1);
    } else {
      setIndex(index + 1);
    }

    await Future.delayed(500.milliseconds);
    isDrag = false;
  }
}
