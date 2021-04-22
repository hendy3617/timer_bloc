import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_bloc/app.dart';
import 'package:timer_bloc/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const TimerApp());
}
