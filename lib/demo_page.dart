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

    return null;
  }
}
























