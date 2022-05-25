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
                  height: 400,
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
        Navigator.push(context, MaterialPageRoute(builder: (_) => null!));
      },
      child: AspectRatio(
        aspectRatio: 5.5 / 9,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(18),
          ),
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
            ],
          ),
        ),
      ),
    );
  }
}
