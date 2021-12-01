import 'package:flutter/material.dart';
import 'package:news_api_flutter/Model/newsinfo.dart';
import 'package:news_api_flutter/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModelClass> _newsModel;

  @override
  void initState() {
    _newsModel = APIManager().getNews(); //to get the data from APIManager/api
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          'News App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: FutureBuilder<NewsModelClass>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.articles.length,
              itemBuilder: (context, index) {
                var article = snapshot.data?.articles[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 1.5,
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(article!.urlToImage, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 15),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(article.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                              Text((article.publishedAt).toString(), style: TextStyle(fontSize: 10, color: Colors.grey),),
                              Text(article.description, overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.justify,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          return Center(
              child: CircularProgressIndicator(
            color: Colors.blueGrey,
          ));
        },
      ),
    );
  }
}
