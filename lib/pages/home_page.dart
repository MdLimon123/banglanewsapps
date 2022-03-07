import 'package:banglanews/models/newsinfo.dart';
import 'package:banglanews/services/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bangla News'),
        centerTitle: true,
      ),
      body: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data!.articles[index];
                  return Container(
                    height: 130,
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              article.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),

                        ),
                        SizedBox(width: 20,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(article.title,overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.green),),
                              Text(article.tag, style:
                              TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.pink),),
                              Text(article.excerpt,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(article.newsUrl,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.red),),
                              Text(article.author,overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight:FontWeight.bold),),
                              Text(article.source),
                              Text(article.sourceUrl,overflow: TextOverflow.ellipsis),

                            ],

                          ),
                        ),

                    ]
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
