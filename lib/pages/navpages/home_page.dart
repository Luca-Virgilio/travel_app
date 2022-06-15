import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //menu
          Row(children: [
            const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black54,
            ),
            Expanded(child: Container()),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.3)),
            ),
          ]),
          const SizedBox(
            height: 40,
          ),
          // text
          AppLargeText(text: 'Discover'),
          //tabbar
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              labelPadding: const EdgeInsets.only(left: 0, right: 20),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:
                  CircleTabIndicator(color: AppColors.mainColor, radius: 4),
              tabs: const [
                Tab(
                  text: 'Places',
                ),
                Tab(
                  text: 'Inspiration',
                ),
                Tab(
                  text: 'Emotions',
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext contex, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage('images/mountain.jpeg'),
                        ),
                      ),
                    );
                  },
                ),
                const Text('There'),
                const Text('Bye')
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    // -10 depends on tab padding
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2 - 10,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
