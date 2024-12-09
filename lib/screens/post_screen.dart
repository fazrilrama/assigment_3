import 'package:app_assigment_3/providers/post_provider.dart';
import 'package:app_assigment_3/screens/album_screen.dart';
import 'package:app_assigment_3/screens/user_screen.dart';
import 'package:app_assigment_3/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostOverviewScreen extends StatefulWidget {
  const PostOverviewScreen({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _postOverviewScreen createState() {
    return _postOverviewScreen();
  }
}

// ignore: camel_case_types
class _postOverviewScreen extends State<PostOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super .didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
    }
    
    Provider.of<PostProvider>(context)
      .fetchPosts()
      .then((value) => {})
      .catchError((error) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('An error occurred!'),
            content: const Text('Something went wrong.'),
            actions: [
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }).whenComplete(() {
        setState(() {
          _init = false;
          setState(() {
            _isLoading = false;
          });
        });
      });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Data Posts',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        actions: [
          Consumer<PostProvider>(
            builder: (BuildContext context, value, Widget? child) {
              return ElevatedButton(
                onPressed: () {}, 
                child: const Text('Refresh Fetch')
              );
            },
          )
        ],
      ),
      body: Consumer<PostProvider>(
        builder: (context, post, child) {
          final postsData = post.posts;
          return ListView(
            children: postsData.map((el) => PostCard(
              id: el.id, 
              title: el.title, 
              body: el.body, 
              userId: el.userId,
            )).toList(),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 244, 27, 27), 
              ),
              accountName: Text(
                'Fazril Ramadhan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('fazrilramadhan2000@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 50,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Data Posts'),
              onTap: () {
                
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Data Users'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserOverviewScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Data Albums'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AlbumOverviewScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}