import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app.dart';

// ignore: must_be_immutable
class FeedsScreen extends StatelessWidget {
  AuthenticationBloc _authenticationBloc;
  FeedBloc _feedBloc;

  @override
  Widget build(BuildContext context) {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _feedBloc = FeedBloc();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(Constants.appBarTitle),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _signOut)
        ],
      ),
      body: BlocProvider(
        create: (_) => _feedBloc..add(FeedFetchedEvent()),
        child: FeedListScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _onAddPressed(context),
      ),
    );
  }

  _signOut() async {
    // var user = await _authenticationBloc.userRepository.getCurrentUser();
    var token = await _authenticationBloc.userRepository.getToken();
    print(token);
    _authenticationBloc.add(LoggedOutEvent());
  }

  _onAddPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: _feedBloc, child: FeedFormScreen())),
    );
  }
}
