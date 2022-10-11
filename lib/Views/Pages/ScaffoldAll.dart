import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Models/Public.dart';

import 'UserPage.dart';
import 'AddPage.dart';
import 'SetingsPage.dart';
import 'SearchPage.dart';
import 'MainPage.dart';

class ScaffoldAll extends StatelessWidget {
  final Widget body, title;
  final List<Tab> myTabs;
  final bool IsAdd, IsUser, IsSideBar, IsTabBar;
  final double topBarHeight;
  ScaffoldAll(
      {Key key,
      @required this.body,
      this.title,
      this.IsAdd = false,
      this.IsUser = false,
      this.IsSideBar = false,
      this.IsTabBar = false,
      this.myTabs,
      this.topBarHeight = 0.15})
      : super(key: key);

/*  List<Tab> myTabs = <Tab>[
    Tab(text: 'page1.'),
    Tab(text: 'page2.'),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SWi * topBarHeight),
          child: MyAppBar(
              myTabs: myTabs,
              title: title != null ? title : telfun,
              IsTabBar: IsTabBar,
          IsUser:IsUser)),
      drawer: IsSideBar ? MyDrawer(context) : null,
      bottomNavigationBar: MyBottomNavBar(IsAdd: IsAdd, IsUser: IsUser),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //floatingActionButton: MyFloatingActionButton(),
      body: body,
    );
  }

  FloatingActionButton MyFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
    );
  }

  Drawer MyDrawer(context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Color(0xff7262DF),
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  )),
              SafeArea(child: Container()),
            ],
          ),
        ),
        /* child: Container(
          color: Colors.white,
          child: Column(
            children: [
              */ /* Container(color: Colors.red,width: 100,height: MediaQuery.of(context).hashCode,),*/ /*
            ],
          ),
        ),*/
      );
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key key,
    @required this.myTabs,
    @required this.title,
    this.IsTabBar,
    this.IsUser,
  }) : super(key: key);

  final List<Tab> myTabs;
  final Widget title;
  final bool IsTabBar,IsUser;

  @override
  _MyAppBarState createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: widget.myTabs == null ? 0 : widget.myTabs.length);
    tabController.addListener(() {
      Provider.of<UsesVar>(context, listen: false).Select(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: widget.IsTabBar
          ? PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Container(
                padding: EdgeInsets.only(left: SWi * 0.06, right: SWi * 0.06),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: tabController,
                  tabs: widget.myTabs,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(color: Colors.red),
                ),
              ),
            )
          : null,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(bottom: Radius.circular(SWi * 0.08))),
      backgroundColor: Colors.white,
      title: widget.title,
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {
              if(widget.IsUser){
                Navigator.of(context)
                    .pushNamed(SetingsPage.routName);
              }else{
                Navigator.of(context)
                    .pushNamed(SearchPage.routName);
              }
            },
            icon: Icon(
             widget.IsUser?Icons.settings: Icons.search,
            ))
      ],
    );
  }
}

class MyBottomNavBar extends StatefulWidget {
  final bool IsAdd, IsUser;
  const MyBottomNavBar({Key key, this.IsAdd, this.IsUser}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  double _iconSize = 30;
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SWi * 0.08),
            topRight: Radius.circular(SWi * 0.08)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SWi * 0.08),
            topRight: Radius.circular(SWi * 0.08)),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff7262DF),
          currentIndex: selectIndex,
          onTap: (index) {
            setState(() {
              oldSelect = selectIndex;
              selectIndex = index;
              if (selectIndex == 0) {
               // Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).popUntil((route) => route.isFirst);
                /*.pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()))*/;
              } else if (oldSelect == 2 && selectIndex == 1) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AddPage()));
              } else if (oldSelect == 1 && selectIndex == 2) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => UserPage()));
              } else if (selectIndex == 1 && !widget.IsAdd) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddPage()));
              } else if (selectIndex == 2 && !widget.IsUser) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserPage()));
              }
            });
          },
          iconSize: SWi * 0.09,
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                )),
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  Icons.add_circle_outline_rounded,
                  color: Colors.blue[800],
                )),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.account_circle_outlined)),
          ],
        ),
      ),

      /*ClipRRect(
        borderRadius:BorderRadius.only(
            topLeft: Radius.circular(SWi*0.08), topRight: Radius.circular(SWi*0.08)),
        child: AnimatedBottomNavigationBar(

            shadow: Shadow(color: Colors.green, blurRadius: 10),
            backgroundColor: Colors.white,
           // gapLocation: GapLocation.center,
            icons: [Icons.home_outlined, Icons.add_box,Icons.account_circle_outlined],
            iconSize: 30,
            activeIndex: _selectIndex,
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
        onTap: (index){
           setState(() {
             _selectIndex=index;
           });
       },
        ),
      ),*/

      /* ClipRRect(
        borderRadius:BorderRadius.only(
            topLeft: Radius.circular(SWi*0.08), topRight: Radius.circular(SWi*0.08)),
        child: BottomNavigationBar(

          backgroundColor: Colors.white,
          // selectedItemColor: Color(0xff7262DF),
          currentIndex: _selectIndex,
          onTap: (index) {
            setState(() {
              _selectIndex = index;
              print(index);
            });
          },
          iconSize: SWi*0.09,
          items: [
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.add_box)),
            BottomNavigationBarItem(
                label: "", icon: Icon(Icons.account_circle_outlined)),
          ],
        ),
      ),*/
    );
  }
}
