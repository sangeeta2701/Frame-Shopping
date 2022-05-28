import 'package:buying_frames/product_detail_screen.dart';
import 'package:flutter/material.dart ';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "Persol",
    ),
    Tab(
      text: "Werby",
    ),
    Tab(
      text: "Parker",
    ),
    Tab(
      text: "MyKta",
    ),
    Tab(
      text: "Moscot",
    ),
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
        leading: Builder(builder: (context) {
          return TextButton(
            onPressed: () {},
            child: Image(
              image: AssetImage("assets/menu.png"),
            ),
          );
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                "Sunglasses",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: TabBar(
                  tabs: myTabs,
                  indicatorWeight: 3,
                  labelPadding: EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.red[300],
                  labelColor: Colors.black,
                  controller: _tabController,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 450,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 30, 25, 30),
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeItem(),
                        SizedBox(
                          width: 25,
                        ),
                        makeItem(),
                        SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget makeItem() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailScreen()));
      },
      child: AspectRatio(
        aspectRatio: 5.7 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(18),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Persol P03214S",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                      letterSpacing: 0.2,
                      color: Colors.black,
                      fontSize: 34),
                ),
                Container(
                  height: 105,
                  width: 230,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://static1.lenskart.com/media/desktop/img/14-June-20/599icon.jpg"))),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Text(
                      "Most well respected and distinguisher everywear brand in the world",
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  child: Text(
                    "\$202.30",
                    style: TextStyle(
                        color: Colors.black,
                        height: 1.1,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35.0),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(18, 6, 18, 6),
                    color: Colors.pink[700],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
