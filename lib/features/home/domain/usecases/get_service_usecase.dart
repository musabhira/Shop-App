import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';
import 'package:shopapp/features/home/domain/repository/service_repository.dart';

class GetServiceUseCase {
  final ServiceRepository repository;

  GetServiceUseCase({required this.repository});

  Stream<List<ServiceEntity>> call() async* {
    try {
      final serviceStream = repository.getService();
      await for (final services in serviceStream) {
        yield [
          for (final service in services)
            ServiceEntity(service: service.service)
        ];
      }
    } catch (e) {
      throw BaseException('Error while loading chat. Try Again');
    }
  }
}
