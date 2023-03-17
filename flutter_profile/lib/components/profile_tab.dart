import 'package:flutter/material.dart';

// Stateful 상태가 있는 위젯 => 상태에 따라 위젯 변경됨
class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with SingleTickerProviderStateMixin{

  TabController? _tabController;

  // ProfileTab 그림이 그려질 때 한번만 실행되는 함수
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _builtTabBarView()),
      ],
    );
  }

  Widget _buildTabBar(){
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(icon: Icon(Icons.directions_car)),
        Tab(icon: Icon(Icons.directions_transit)),
    ],
    );
  }

  Widget _builtTabBarView(){
    return TabBarView(
        controller: _tabController,
        children: [

            GridView.builder(
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index){
                return Image.network("https://picsum.photos/id/${index + 1}/200/200",
                scale: 0.3,
                );
              },
            ),

          GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index){
              return Image.network("https://picsum.photos/id/${index + 10}/200/200",
                scale: 0.3,
              );
            },
          ),
        ],
    );
  }
}
