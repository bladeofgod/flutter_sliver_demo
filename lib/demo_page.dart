import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';




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
    tabController = TabController(vsync: this,length: 4);
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
                indicatorSize: TabBarIndicatorSize.label,
                controller: tabController,
                //isScrollable: true,
                tabs: <Widget>[
                  Tab(child: Container(
                    width: 60,
                    child: Text("tabOne"),
                  ),),
                  Tab(text: "tabTwo",),
                  Tab(text: "tabThree",),
                  Tab(
                    child: Container(
                      width: 300,

                    ),
                  ),
                ],
              ) ,
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            buildWaterFall(),
            //_buildListView("one"),
            _buildListView("two"),
            _buildListView("three"),
            _buildListView("four"),

          ],
        ),
      ),
    );
  }

  Widget buildWaterFall(){
    List items = List<int>.generate(20, (index){
      return index;
    });
    return WaterfallFlow.builder(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverWaterfallFlowDelegate(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          /// 可以在尾部 加入特殊布局的item
          //lastChildLayoutTypeBuilder: ,
        ),
        itemCount: 30,
        itemBuilder: (ctx,index){
          if(index % 2 == 0){
            return Container(
              color: Colors.red,
              width: double.infinity,
              height: 300,
              child: Text("$index",style: TextStyle(fontSize: 20),),
            );
          }else{
            return Container(
              color: Colors.cyanAccent,
              width: double.infinity,
              height: 200,
              child: Text("$index",style: TextStyle(fontSize: 20),),
            );
          }
        }
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
























