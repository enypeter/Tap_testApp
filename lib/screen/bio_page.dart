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

  List<BioModel> profileDetail = [];
  AppController bioController = Get.put(AppController());
String name='';
String age='';
String gender='';
String bio='';
List inst=[];
var location;
  @override
  void initState() {
    boot();
    super.initState();
  }

  boot() async {
    var data = await bioController.getBio();
    setState(() {
      profileDetail = data;
      name = profileDetail[0].name;
      age = profileDetail[0].age.toString();
      gender = profileDetail[0].gender;
      bio = profileDetail[0].bio;
      location = profileDetail[0].location.coordinates;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                profileDetail.isEmpty
                    ? Center(
                    child: CircularProgressIndicator(
                      color: WHITE,
                    ))
                    : CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: profileDetail[0].photos.length,
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
                    var item = profileDetail[0].photos;
                    return Stack(
                    children: [
                    Image.network(item[0].filename,
                    fit: BoxFit.fitWidth,
                    height: size.height * 0.6,
                    width: double.infinity),
                    Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: profileDetail.asMap().entries.map((entry) {
                    return GestureDetector(
                    onTap: () =>
                    _controller.animateToPage(entry.key),
                    child: slideDot(
                    _current == entry.key ? 1.0 : 0.3),
                    );
                    }).toList(),
                    ),
                    ),
                    ]
                    ,
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
                  SizedBox(height: 20),
                  Text(
                    '$name, $age',
                    style: headerStyle(),
                  ),
                  SizedBox(height: 15),
                  text('$bio', WHITE),
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
                        profileItem(
                            title: 'Name', desc: '$name'),
                        profileItem(
                            title: 'Gender',
                            desc: '$gender'),
                        profileItem(
                            title: 'Age', desc: '$age'),
                        profileItem(
                            title: 'Location',
                            desc: '$location'),
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
                          child: profileDetail.isEmpty
                              ? Center(child: Container())
                              : ListView.builder(
                              padding: EdgeInsets.all(0),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: profileDetail[0].basicInfo.length,
                              itemBuilder: (context, index) {
                                var item =
                                profileDetail[0].basicInfo[index];
                                return profileItem(
                                    title: '${item.key.name}',
                                    desc: '${item.value}');
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
                  Image.asset(
                    'assets/images/Image 96.png',
                    width: size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  SizedBox(height: 20),
                  Container(height: 500,
                    child: profileDetail.isEmpty
                        ? Container()
                        : StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: profileDetail[0].interests.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = profileDetail[0].interests[index];
                        return circleContainer(item.name);
                      },
                      staggeredTileBuilder: (int index) =>
                      new StaggeredTile.fit(1),
                    ),
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
