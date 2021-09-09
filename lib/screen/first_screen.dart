import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tap_design/controller/appController.dart';
import 'package:tap_design/model/category_model.dart';
import 'background.dart';
import 'bio_page.dart';
import 'utils/utils.dart';
import 'widgets/buttons.dart';
import 'utils/constants.dart';
import '../service/api_services.dart';
import 'widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categoriesList = [];
  AppController interestController = Get.put(AppController());

  @override
  void initState() {
    boot();
    super.initState();
  }

  boot() async {
    var data = await interestController.getInterests();
      setState(() {
        categoriesList =data;
      });

  }

  @override
  Widget build(BuildContext context) => Background(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.west, color: WHITE),
                  text(
                    'PASSION',
                    WHITE,
                    16.0,
                    FontWeight.w700,
                  ),
                  SizedBox(width: 30),
                ],
              ),
            ),
            SizedBox(height: 30),
            text('What are you into?', WHITE, 28.0),
            SizedBox(height: 20),
            text('Pick at least 5', WHITE, 15.0),
            Stack(
              children: [
                Container(
                  height: 500,
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: categoriesList.isEmpty
                      ? Center(child: CircularProgressIndicator(color: WHITE))
                      : StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: categoriesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = categoriesList[index];
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  Stack(
                                    children: [
                                      Image.network(
                                        '$ImageBaseUrl${item.image}',
                                        fit: BoxFit.contain,
                                      ),
                                      Text('${item.name}'),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(1),
                        ),
                ),
                Positioned(
                  bottom: 0,
                  left: 100,
                  child: circleContainer('ADVENTURE'),
                ),
                Positioned(
                  top: 50,
                  right: 50,
                  child: circleContainer('SOCIAL'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      bottomLine(1, 0.3),
                      bottomLine(3, 1.0),
                      bottomLine(6, 0.3),
                    ],
                  ),
                  SizedBox(height: 30),
                  defaultButton(
                      title: 'CONTINUE',
                      onTap: () {
                        Get.to(() => BioPage());
                      })
                ],
              ),
            ),
          ],
        ),
      ));
}
