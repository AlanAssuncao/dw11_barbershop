import 'package:dw11_barbershop/src/core/exceptions/repository_exception.dart';
import 'package:dw11_barbershop/src/core/fp/either.dart';
import 'package:dw11_barbershop/src/core/fp/nil.dart';

abstract class ScheduleRepository {
  Future<Either<RepositoryException, Nil>> scheduleClient(
      ({
        int barbershopId,
        int userId,
        String clientName,
        DateTime date,
        int time,
      }) scheduleData);
}
