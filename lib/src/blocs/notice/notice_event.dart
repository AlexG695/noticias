import 'package:news/src/models/notice.dart';

abstract class NoticeEvent {
  const NoticeEvent();
}

class LoadNotice extends NoticeEvent {}
