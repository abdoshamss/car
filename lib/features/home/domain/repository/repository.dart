
import '../../../../core/data_source/dio_helper.dart';

  //put it in locators locator.registerLazySingleton(() => HomeWebRepository(locator<DioService>()));
//  import '../../modules/home_web/domain/repository/repository.dart';
class HomeWebRepository{
final  DioService dioService ;
  HomeWebRepository(this.dioService);
}
