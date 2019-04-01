import 'package:flutter/material.dart';

class ViewPagerWorker extends StatefulWidget {
  @override
  _ViewPagerWorkerState createState() => _ViewPagerWorkerState();
}

class _ViewPagerWorkerState extends State<ViewPagerWorker> {
  final PageController controller = new PageController(initialPage: 4);

  @override
  Widget build(BuildContext context) {
    return getPageView();
    /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(child: new Text("No"),onPressed: (){
                print("onClick No");
              },),
              RaisedButton(child: new Text("Yes"),onPressed: (){
                print("onClick Yes");
              },)
            ],
          )*/
  }

  Widget getPageView() {
    return PageView(
      children: <Widget>[
        getItemPageView("https://ribalych"
            ".ru/wp-content/uploads/2018/01/shabani_001.jpg"),
        getItemPageView(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgkWQBTvoiV9GNZRlbDdkULXQvdP77TKBAHhX3wMVGVWiufVpmEQ"),
        getItemPageView("https://ribalych"
            ".ru/wp-content/uploads/2018/01/shabani_000.jpg"),
        getItemPageView(
            "https://avatars3.githubusercontent.com/u/26433088?s=400&v=4"),
        getItemPageView("https://i.ytimg.com/vi/hAAWvh1YTZ8/maxresdefault.jpg"),
        getItemPageView(
            "https://www.advantour.com/img/uzbekistan/symbolics/uzbekistan-flag.jpg"),
        getItemPageView(
            "https://st2.depositphotos.com/1381835/8881/v/600/depositphotos_88811344-stock-video-flag-of-mali.jpg"),
        getItemPageView(
            "http://www.ostrovec-oost.guo.by/uploads/b1/s/12/54/editor_picture/0/361/orig_Molochko_Andrey.jpg"),
        getItemPageView(
            "https://otyrar.kz/wp-content/uploads/2017/05/09220f39bfa655d36fa00a276c991c96.jpg"),
      ],
      controller: controller,
    );
  }

  Widget getItemPageView(String url) {
    return Center(child: Image.network(url));
  }

  Widget getButton(String text) {
    return RaisedButton(
      child: new Text(text),
    );
  }
}
