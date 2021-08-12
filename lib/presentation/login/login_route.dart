import 'package:configuration/di/di_module.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter_architecture/data/user/repositories/user_repo.dart';
import 'package:flutter_architecture/domain/login/use_cases/login_usecases.dart';
import 'package:flutter_architecture/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_architecture/presentation/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRoute extends RouteDefine {
  static const id = 'login';

  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          name: id,
          builder: (_) => BlocProvider(
            create: (_) =>
                LoginCubit(loginUseCase: LoginUseCase(getIt<UserRepoImpl>())),
            child: LoginScreen(),
          ),
        ),
      ];
}
