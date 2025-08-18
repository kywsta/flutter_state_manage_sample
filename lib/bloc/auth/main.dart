import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manage_sample/bloc/auth/bloc/auth_bloc.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthBloc())],
      child: MaterialApp(home: AuthStatusPage()),
    );
  }
}

class AuthStatusPage extends StatefulWidget {
  const AuthStatusPage({super.key});

  @override
  State<AuthStatusPage> createState() => _AuthStatusPageState();
}

class _AuthStatusPageState extends State<AuthStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            final isAuthenticated = context.select(
              (AuthBloc bloc) => bloc.state.status == AuthStatus.authenticated,
            );
            return isAuthenticated
                ? _buildAuthenticatedContent()
                : _buildUnauthenticatedContent();
          },
        ),
      ),
    );
  }

  Widget _buildAuthenticatedContent() {
    return Builder(
      builder: (context) {
        final user = context.select((AuthBloc bloc) => bloc.state.user);

        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle),
              Text(
                'Authenticated',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text("${user?.name}\n${user?.email}"),
              ElevatedButton(onPressed: _logout, child: Text('Logout')),
            ],
          ),
        );
      },
    );
  }

  Widget _buildUnauthenticatedContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lock),
          Text(
            'Unauthenticated',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: _login, child: Text('Login')),
        ],
      ),
    );
  }

  void _login() {
    context.read<AuthBloc>().add(
      LoginEvent(email: 'test@test.com', password: '123456'),
    );
  }

  void _logout() {
    context.read<AuthBloc>().add(LogoutEvent());
  }
}
