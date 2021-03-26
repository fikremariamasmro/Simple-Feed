import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/app.dart';

class LoginForm extends StatelessWidget {
  final UserRepository userRepository;
  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        userRepository = userRepository,
        super(key: key);

  final TextEditingController _phonNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    return BlocConsumer<LoginBloc, LoginState>(
      cubit: _loginBloc,
      listener: _buildListener,
      builder: (context, state) {
        if (state is UnauthenticatedState) {
          _buildForm(context);
        } else if (state is LoginLoadingState) {
          return LoadingIndicator();
        } else if (state is SmsSentState) {
          return BlocProvider.value(
            value: _loginBloc,
            child: VerificationScreen(phone: _phonNumber.text),
          );
        } else if (state is LoginCompleteState) {
          BlocProvider.of<AuthenticationBloc>(context)
              .add(AuthenticatedEvent(user: state.user));
        }
        return _buildForm(context);
      },
    );
  }

  void _buildListener(context, state) {
    if (state is ExceptionState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Expanded(child: Text(state.message)), Icon(Icons.error)],
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: [
            LoginHeader(),
            NumberInput(
              labelText: Constants.phoneNumber,
              phoneTextController: _phonNumber,
            ),
            SizedBox(
              height: 40,
            ),
            SigninButton(
              label: Constants.signIn,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(SendCodeEvent(phoneNumber: _phonNumber.value.text));
                }
              },
            )
          ],
        ));
  }
}
