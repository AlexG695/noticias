import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/src/blocs/notice/notice_event.dart';
import 'package:news/src/blocs/notice/notice_state.dart';

class NoticeBloc extends Bloc<NoticeEvent, NoticeState> {
  NoticeBloc() : super(NoticeLoading()) {
    on<LoadNotice>(_onLoadNotice);
  }

  _onLoadNotice(LoadNotice event, Emitter<NoticeState> emit) {
    emit(NoticeLoaded());
  }
}
