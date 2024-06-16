import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../state_holder/donar_list_controller.dart';
import '../widgets/donar_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.find<DonalListController>().getDonarData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          title: const Text('Home'),
          flexibleSpace: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <TextField>[
                TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search..',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
      body: GetBuilder<DonalListController>(
        builder: (donalListController) {
          if (donalListController.isDonarDataInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              await donalListController.getDonarData();
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return DonarCard(
                  donarData:
                      donalListController.donarDataModel.donarData![index],
                );
              },
              itemCount:
                  donalListController.donarDataModel.donarData?.length ?? 0,
            ),
          );
        },
      ),
    );
  }
}
