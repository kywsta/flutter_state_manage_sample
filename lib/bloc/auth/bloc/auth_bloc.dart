import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    on<LoginEvent>(_onLoginRequested);
    on<LogoutEvent>(_onLogoutRequested);
  }

  void _onLoginRequested(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      final user = User(id: '1', email: 'john@test.com', name: 'John Doe');
      await Future.delayed(const Duration(milliseconds: 500));
      emit(AuthState.authenticated(user: user));
    } catch (error) {
      emit(AuthState.unauthenticated(errorMessage: error.toString()));
    }
  }

  void _onLogoutRequested(LogoutEvent event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const AuthState.unauthenticated());
  }
}
