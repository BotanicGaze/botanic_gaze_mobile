import 'package:base_network/src/repository/model/notification_data.dart';
import 'package:shared/shared.dart';

import 'base/base_data_mapper.dart';

@Injectable()
class NotificationDataMapper
    extends BaseDataMapper<NotificationData, NotificationData> {
  @override
  NotificationData mapToEntity(NotificationData? data) {
    return NotificationData(
      notificationId: data?.notificationId ?? '',
      image: data?.image ?? '',
      title: data?.title ?? '',
      message: data?.message ?? '',
    );
  }
}
