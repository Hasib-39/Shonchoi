import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/expense_repo.dart';
import 'package:expense_repository/src/expense_repository.dart';

class FirebaseExpenseRepo implements ExpenseRepository{
  final categoryCollection = FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  createCategory(Category category) async {
    try{
      categoryCollection.doc(category.categoryId).set(category.toEntity().toDocument());

    }
    catch(e){
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try{
      return await categoryCollection
          .doc()
          .get()
          .then((value) => value.docs.map((e) =>
          Category.fromEntity(CategoryEntity.fromDocument(e.data()))).toList());
    }
    catch (e){
      log(e.toString());
      rethrow;
    }
  }


}

extension on DocumentSnapshot<Map<String, dynamic>> {
  get docs => null;
}