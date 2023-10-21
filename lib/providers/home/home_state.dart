import 'package:equatable/equatable.dart';
import 'package:space_cats_app/data/data.dart';
import 'package:space_cats_app/data/models/user.dart';

enum HomeStateStatus { loading, success, failure }

class HomeState extends Equatable {
  final HomeStateStatus? status;
  final User? user;

  const HomeState({this.status, this.user});
  const HomeState.initial({this.status, this.user});

  HomeState copyWith({required HomeStateStatus? status, User? user}) {
    return HomeState(status: status ?? this.status, user: user ?? user);
  }

  @override
  List<Object> get props => [];
}
