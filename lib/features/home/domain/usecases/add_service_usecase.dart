import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/features/home/domain/entites/cart_entity.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';
import 'package:shopapp/features/home/domain/repository/service_repository.dart';

class AddServiceUseCase {
  final ServiceRepository repository;
  AddServiceUseCase(this.repository);

  Future<void> call(CartEntity message) async {
    try {
      await repository.sendService(message);
    } on BaseException catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    } catch (e) {
      throw BaseException('An unexpected error occurred.');
    }
  }
}
