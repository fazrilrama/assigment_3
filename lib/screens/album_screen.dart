import 'package:app_assigment_3/models/album_model.dart';
import 'package:app_assigment_3/providers/album_provider.dart';
import 'package:app_assigment_3/widgets/album_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumOverviewScreen extends StatefulWidget {
  const AlbumOverviewScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _albumOverviewScreenState createState() {
    return _albumOverviewScreenState(); 
  } 
}

// ignore: camel_case_types
class _albumOverviewScreenState extends State<AlbumOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super .didChangeDependencies();
    if(_init) {
      setState(() {
        _isLoading = true;
      });
    }

    Provider.of<AlbumProvider>(context)
      .fetchAlbums()
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
        title: const Text('Album Overview'),
      ),
      body: Consumer<AlbumProvider>(
        builder: (context, albumProvider, child) {
          return _isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
              itemCount: albumProvider.albums.length,
              itemBuilder: (context, index) {
                final album = albumProvider.albums[index];
                return AlbumCard(
                  id: album.id, 
                  title: album.title, 
                  userId: album.userId
                );
              },
            );
        },
      ),
    );
  }
}