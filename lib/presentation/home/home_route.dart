import 'package:configuration/di/di_module.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/domain/login/entities/auth_entity.dart';
import 'package:flutter_architecture/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_architecture/presentation/home/ui/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRoute extends RouteDefine {
  static const id = 'home';

  static push(BuildContext context, AuthEntity entity) {
    Navigator.pushNamed(context, id, arguments: {"authEntity": entity});
  }

  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>(),
            child: HomeScreen(
              authEntity: arguments == null
                  ? null
                  : arguments["authEntity"] as AuthEntity,
            ),
          ),
        ),
      ];
}
