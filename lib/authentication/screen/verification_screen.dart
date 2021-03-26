import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_feed/app.dart';

class VerificationScreen extends StatelessWidget {
  final String phone;
  VerificationScreen({@required this.phone});
  final TextEditingController _pin = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      cubit: BlocProvider.of<LoginBloc>(context),
      listener: buildListener,
      builder: _buildState,
    );
  }

  void buildListener(context, state) {
    if (state is VerficationExceptionState) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(state.message), Icon(Icons.error)],
        ),
        backgroundColor: Colors.red,
      ));
    }
  }

  Widget _buildState(context, state) {
    if (state is UnauthenticatedState) {
      _buildForm(context);
    } else if (state is LoginLoadingState) {
      return LoadingIndicator();
    } else if (state is LoginCompleteState) {
      BlocProvider.of<AuthenticationBloc>(context)
          .add(AuthenticatedEvent(user: state.user));
    }
    return _buildForm(context);
  }

  _buildForm(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: [
            VerficationHeader(
              phone: '+251 $phone',
            ),
            CodeNumberInput(
              labelText: Constants.verificationCode,
              verficationTextController: _pin,
            ),
            SizedBox(
              height: 40,
            ),
            SigninButton(
              label: Constants.verify,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(VerifyPhoneNumberEvent(code: _pin.value.text));
                }
              },
            ),
            // ElevatedButton(
            //   child: Text("Resend Code"),
            //   onPressed: () {
            //     BlocProvider.of<LoginBloc>(context)
            //         .add(ResendCodeEvent(phoneNumber: _pin.value.text));
            //   },
            // )
          ],
        ));
  }

  // _goToFeedScreen(){
  //    return BlocProvider.value(
  //           value: _loginBloc,
  //           child: VerificationScreen(),
  //         );
  // }
}
