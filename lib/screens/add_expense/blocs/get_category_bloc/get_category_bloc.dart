import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_category_event.dart';
part 'get_category_state.dart';

class GetCategoryBloc extends Bloc<GetCategoryEvent, GetCategoryState> {
  GetCategoryBloc() : super(GetCategoryInitial()) {
    on<GetCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
