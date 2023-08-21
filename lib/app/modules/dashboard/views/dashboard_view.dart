import 'package:project_work/index.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Navigator(
        key: Get.nestedKey(1),
        onGenerateRoute: controller.onGenerate,
      ),
      bottomNavigationBar: Obx(
        () => GestureDetector(
          onHorizontalDragUpdate: controller.horizontalNav,
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            selectedFontSize: 11,
            iconSize: 21,
            onTap: controller.setIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_circle_outline,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                activeIcon: Icon(Icons.person),
                label: "PROFILE",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
