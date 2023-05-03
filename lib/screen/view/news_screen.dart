import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/news_modal.dart';
import '../provider/news_provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  homeProvider? oo,pp;
  Welcome? w1;

  @override
  void initState() {
    super.initState();

    Provider.of<homeProvider>(context,listen: false).getNews;
  }
  @override
  Widget build(BuildContext context) {

    oo = Provider.of<homeProvider>(context,listen: true);
    pp = Provider.of<homeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "News App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.red,
                      child: TextButton(onPressed: () {
                        pp!.change("in",);
                      },
                          child: Text("in",style: TextStyle(color: Colors.white,fontSize: 17),)),
                    ),
                    Container(
                      color: Colors.red,
                      child: TextButton(onPressed: () {
                        pp!.change("ca");
                      }, child: Text("ca",style: TextStyle(color: Colors.white,fontSize: 17))),
                    ),
                    Container(
                      color: Colors.red,
                      child: TextButton(onPressed: () {
                        pp!.change("au");
                      }, child: Text("au",style: TextStyle(color: Colors.white,fontSize: 17))),
                    ),
                    Container(
                      color: Colors.red,
                      child: TextButton(onPressed: () {
                        pp!.change("us");
                      }, child: Text("us",style: TextStyle(color: Colors.white,fontSize: 17))),
                    ),
                  ],
                ),
                FutureBuilder(builder: (context, snapshot) {

                  if(snapshot.hasError)
                  {
                    return Text("${snapshot.error}");
                  }
                  else if(snapshot.hasData)
                  {
                    Welcome? w1 = snapshot.data;

                    return Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return Card(
                          color: Colors.black,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),

                            title: Text("${w1.articles[index].author}",style: TextStyle(color: Colors.white)),

                            subtitle: Text("${w1.articles[index].content}",style: TextStyle(color: Colors.white)),

                          ),
                        );
                      },
                        itemCount: w1!.articles.length,
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
                  future: pp!.getNews(oo!.selectedCountry),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}