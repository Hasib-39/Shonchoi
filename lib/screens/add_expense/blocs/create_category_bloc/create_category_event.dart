part of 'create_category_bloc.dart';

@immutable
sealed class CreateCategoryEvent extends Equatable{
  const CreateCategoryEvent();

  @override
  List<Object?> get props => [];
}


class CreateCategory extends CreateCategoryEvent{
  final Category category;

  const CreateCategory(this.category);

  @override
  // TODO: implement props
  List<Object?> get props => [category];
}

