import 'package:fetch_apis/controller/post_controller.dart';
import 'package:fetch_apis/model/post_model.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PostModel> postList = [];
  getDataPost() async {
    await PostController().getPost().then((value) {
      setState(() {
        postList = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: postList.length,
          itemBuilder: (context, index) =>
              _buildPostCard(post: postList[index]),
        ));
  }

  Widget _buildPostCard({required PostModel post}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 235, 232, 232)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                post.content,
                style: TextStyle(),
              ),
              // CachedNetworkImage(
              //   height: 250,
              //   imageUrl: post.thumbnail,
              //   placeholder: (context, url) =>
              //       Center(child: CircularProgressIndicator()),
              //   errorWidget: (context, url, error) => const Icon(Icons.error),
              // ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(post.thumbnail))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
