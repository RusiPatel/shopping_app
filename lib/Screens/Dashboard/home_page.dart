import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/Controllers/home_page_controller.dart';
import 'package:shopping_app/Models/product_list.dart';
import 'package:shopping_app/Screens/Authentication/login_page.dart';
import 'package:shopping_app/Screens/Dashboard/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  HomePageController homePageController = Get.put(HomePageController());

  @override
  void initState() {
    homePageController.addImages();
    homePageController.shoppingData();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff1C987E).withOpacity(0.7),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Your Profile',
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: const [
                  CircleAvatar(
                    foregroundColor: Color(0xff1C987E),
                    backgroundColor: Colors.white,
                    child: Icon(Icons.category_outlined),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Shop by Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.4),
            ),
            ListTile(
              title: Row(
                children: const [
                  CircleAvatar(
                    foregroundColor: Color(0xff1C987E),
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Your Orders',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.4),
            ),
            ListTile(
              title: Row(
                children: const [
                  CircleAvatar(
                    foregroundColor: Color(0xff1C987E),
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.logout),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              onTap: () async {
                GetStorage().erase();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginPage()));

                setState(() {});
              },
            ),
            Divider(
              color: Colors.black.withOpacity(0.4),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text("WeFashion",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  InkWell(
                      onTap: () => _key.currentState!.openEndDrawer(),
                      child: const Icon(Icons.format_list_bulleted_sharp))
                ],
              ),
              const SizedBox(height: 20),
              TabBar(
                indicatorColor: const Color(0x701C987E).withOpacity(1),
                labelColor: const Color(0x701C987E).withOpacity(1),
                labelStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Color(0x701C987E)),
                controller: _tabController,
                unselectedLabelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: const Color(0x701C987E).withOpacity(1)),
                tabs: const <Widget>[
                  Tab(
                    text: "Women",
                  ),
                  Tab(
                    text: "Men",
                  ),
                  Tab(
                    text: "Kids",
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Obx(() => homePageController.bannerImages.value.data == null
                        ? Text("No data Found.")
                        : productInfo(
                            productImages: homePageController
                                .bannerImages.value.data!.woman!,
                            productData: homePageController.womenproductData)),
    Obx(() =>   homePageController.bannerImages.value.data == null
                        ? Text("No data Found.")
                        : productInfo(
                            productImages: homePageController
                                .bannerImages.value.data!.men!,
                            productData: homePageController.menproductData)),
      Obx(() =>       homePageController.bannerImages.value.data == null
                        ? Text("No data Found.")
                        : productInfo(
                            productImages: homePageController
                                .bannerImages.value.data!.kid!,
                            productData: homePageController.kidproductData),
      )],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  productInfo(
      {required List<String> productImages,
      required List<ProductData> productData}) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          productImages.isEmpty
              ? const Text("No Data Found")
              : Container(
                  height: 400,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.18),
                            offset: const Offset(2, 3),
                            blurRadius: 10.0,
                            spreadRadius: 3.0),
                      ], borderRadius: BorderRadius.circular(42)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(42),
                        child: Image.network(
                          productImages[index],
                          height: 400,
                          width: 280,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    itemCount: productImages.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 20);
                    },
                  ),
                ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text("Popular Product", style: TextStyle(fontSize: 20)),
              const Spacer(),
              Text("See All",
                  style: TextStyle(
                      color: const Color(0x701C987E).withOpacity(1),
                      fontSize: 15)),
            ],
          ),
          const SizedBox(height: 20),
          Obx(
            () => productData.isEmpty
                ? const Text("No Data Found")
                : Container(
                    child: productImages.isEmpty
                        ? const Center(
                            child: Text(
                            "No Data",
                            style: TextStyle(fontSize: 30),
                          ))
                        : GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 30,
                              childAspectRatio: 0.89,
                            ),
                            itemCount: productData.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                          product: productData[index],
                                        )));
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        productData[index].imageURL!,
                                        fit: BoxFit.fill,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          productData[index].name!,
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "Rs:-${productData[index].prize}",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
          )
        ],
      ),
    );
  }
}
