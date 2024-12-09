import 'package:app_assigment_3/models/user_model.dart';
import 'package:app_assigment_3/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserOverviewScreen extends StatefulWidget {
    const UserOverviewScreen({super.key});

    @override
  // ignore: library_private_types_in_public_api
  _userOverviewScreenState createState() {
    return _userOverviewScreenState();
  }
}


class _userOverviewScreenState extends State<UserOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  void didChangeDependencies() {
    super .didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
    }

    Provider.of<UserProvider>(context)
      .fetchUsers()
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
        title: const Text('User Overview'),
      ),
      body: _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<UserProvider>(
            builder: (ctx, userProvider, _) => ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(userProvider.users[i].name),
                subtitle: Text(userProvider.users[i].email),
              ),
            ),
          ),
    );
  }
}