import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tap_design/controller/appController.dart';
import 'package:tap_design/model/bio_model.dart';
import 'package:tap_design/screen/utils/utils.dart';
import 'background.dart';
import 'widgets/buttons.dart';
import 'utils/constants.dart';
import '../service/api_services.dart';
import 'widgets/widgets.dart';

class BioPage extends StatefulWidget {
  const BioPage({Key? key}) : super(key: key);

  @override
  _BioPageState createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  var profileDetail;
  AppController bioController = Get.put(AppController());

  @override
  void initState() {
    boot();
    super.initState();
  }

  boot() async {
    var data = await bioController.getBio();
    setState(() {
      profileDetail = data['profile'];
      print(profileDetail);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child:profileDetail==null
          ? Center(
          child: CircularProgressIndicator(
            color: WHITE,
          ))
          : SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                profileDetail==null
                    ? Center(
                        child: CircularProgressIndicator(
                        color: WHITE,
                      ))
                    : CarouselSlider.builder(
                        carouselController: _controller,
                        itemCount: profileDetail['photos'].length,
                        options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: false,
                          aspectRatio: 0.7,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        itemBuilder: (context, index, realIdx) {
                          var item = profileDetail['photos'][index];
                          return Stack(
                            children: [
                              Image.network(item['filename'],
                                  fit: BoxFit.fitWidth,
                                  height: size.height * 0.6,
                                  width: double.infinity),

                            ],
                          );
                        },
                      ),
                Positioned(
                  right: 10,
                  bottom: size.height * 0.12,
                  child: Column(
                    children: [
                      likeDislikeButton(
                        onTap: () {},
                        icon: 'assets/images/like.png',
                      ),
                      SizedBox(height: 8),
                      likeDislikeButton(
                        onTap: () {},
                        icon: 'assets/images/dislike.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${profileDetail['name']}, ${profileDetail['age']}',
                    style: headerStyle(),
                  ),
                  SizedBox(height: 15),
                  text('${profileDetail['bio']}', WHITE),
                  SizedBox(height: 20),
                  Text(
                    'Basic info',
                    style: headerStyle(),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: WHITE.withOpacity(0.15),
                    ),
                    child: Column(
                      children: [
                        profileItem(title: 'Name', desc: '${profileDetail['name']}'),
                        profileItem(
                            title: 'Gender',
                            desc: '${profileDetail['gender']}'),
                        profileItem(
                            title: 'Age', desc: '${profileDetail['age']}'),
                        profileItem(
                            title: 'Location',
                            desc: '${profileDetail['gender']}'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Personal info',
                    style: headerStyle(),
                  ),
                  SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: WHITE.withOpacity(0.15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 660,
                          child: profileDetail == null
                              ? Center(child: Container())
                              : ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: profileDetail['basic_info'].length,
                                  itemBuilder: (context, index) {
                                    var item = profileDetail['basic_info'][index];
                                    return profileItem(
                                        title: '${item['key']['name']}',
                                        desc: '${item['value']}');
                                  }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '100 Instagram Posts',
                    style: headerStyle(),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [

                  SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        height: 500,
                        child: profileDetail == null
                            ? Container()
                            : StaggeredGridView.countBuilder(
                                crossAxisCount: 2,
                                itemCount: profileDetail['interests'].length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = profileDetail['interests'][index];
                                  return circleContainer(item['name']);
                                },
                                staggeredTileBuilder: (int index) =>
                                    new StaggeredTile.fit(1),
                              ),
                      ),
                      Image.asset(
                        'assets/images/Image 96.png',
                        width: size.width,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
                    child: Column(
                      children: [
                        generalButton(
                            onTap: () {},
                            title: 'REPORT',
                            color: Color(0xFF081C71)),
                        generalButton(
                            onTap: () {},
                            title: 'UNPAIR',
                            color: Color(0xFF0E398B)),
                        generalButton(
                            onTap: () {},
                            title: 'BLOCK',
                            color: Color(0xFF4F547C)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
