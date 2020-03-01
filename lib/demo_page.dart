import 'package:flutter/material.dart';




class DemoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DemoPageState();
  }

}

class DemoPageState extends State<DemoPage> with SingleTickerProviderStateMixin{

  TabController tabController ;
  ScrollController scrollController;


  @override
  void initState() {

    super.initState();
    scrollController = ScrollController(initialScrollOffset: 0);
    tabController = TabController(vsync: this,length: 3);
  }
  @override
  void dispose() {

    super.dispose();
    scrollController?.dispose();
    tabController?.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Material(
      child: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (ctx,innerBoxScrolled){
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 400,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  child: Column(
                    children: <Widget>[
                      buildAppBar(),
                      buildBannerZone(),
                      buildHorListView(),

                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                controller: tabController,
                tabs: <Widget>[
                  Tab(text: "tabOne",),
                  Tab(text: "tabTwo",),
                  Tab(text: "tabThree",),
                ],
              ) ,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            _buildListView("one"),
            _buildListView("two"),
            _buildListView("three"),

          ],
        ),
      ),
    );
  }

  Widget _buildListView(String s){
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) =>Divider(color: Colors.grey,height: 1,),
        itemBuilder: (BuildContext context, int index) {
          return Container(color: Colors.white, child: ListTile(title: Text("$s第$index 个条目")));
        });
  }

  Widget buildHorListView(){
    List items = List<int>.generate(10, (index){
      return index;
    });
    return Container(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: items.map((item){
          if(item % 2 == 0){
            return Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              color: Colors.pink,
              child: Text("$item",style: TextStyle(fontSize: 20,color: Colors.blueGrey),),
            );
          }else{
            return Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              color: Colors.orange,
              child: Text("$item",style: TextStyle(fontSize: 20,color: Colors.lightGreenAccent),),
            );
          }
        }).toList(),
      ),
    );
  }


  Widget buildBannerZone(){
    return Container(
      color: Colors.yellowAccent,
      height: 200,
      alignment: Alignment.center,
      child: Text("banner zone",style: TextStyle(fontSize: 40,color: Colors.purple),),
    );
  }



  Widget buildAppBar(){
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      height: 60,
      alignment: Alignment.center,
      child: Text(
        "sliver demo",style: TextStyle(fontSize: 20,color: Colors.black),
      ),
    );
  }




}
























