import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/data_source/dio_helper.dart';
import '../../../core/utils/Locator.dart';
import '../domain/repository/repository.dart';
import 'home_web_states.dart';

class HomeWebCubit extends Cubit<HomeWebStates> {
  HomeWebCubit() : super(HomeWebInitial());
  static HomeWebCubit get(context) => BlocProvider.of(context);
  
 HomeWebRepository home_webRepository =  HomeWebRepository(locator<DioService>());
}