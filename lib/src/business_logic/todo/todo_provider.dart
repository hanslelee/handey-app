import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handey_app/src/business_logic/todo/todo_model.dart';
import 'package:handey_app/src/business_logic/todo/todo_service.dart';

class ToDoProvider extends ChangeNotifier {
  ToDoBoxModel toDoBox = ToDoBoxModel();
  ToDoService _toDoService = ToDoService();
  List<ToDoBoxModel> toDoBoxList;

  /// 회원별 todobox list 불러오기
  Future<List<ToDoBoxModel>> getToDoBoxList(int userId) async {
    toDoBoxList = await _toDoService.getToDoBoxList(userId);

    return toDoBoxList;
  }

  /// todobox 객체 생성
  Future<int> createToDoBoxObj(int userId) async {
    int toDoBoxId = await _toDoService.createToDoBoxObj(userId);

    return toDoBoxId;
  }

  /// todobox title 수정
  Future<bool> updateToDoBoxTitle(int toDoBoxId, String title) async {
    // 요청 성공 여부 리턴
    return await _toDoService.updateToDoBoxTitle(toDoBoxId, title);
  }

  /// todobox 고정 여부 수정
  Future<bool> updateToDoBoxFixedYn(int toDoBoxId) async {
    // todobox 고정 상태 return
    return await _toDoService.updateToDoBoxFixedYn(toDoBoxId);
  }

  /// todobox 타이틀 유무 여부 수정
  Future<bool> updateToDoBoxNoTitleYn(int toDoBoxId) async {
    // toDoBox 타이틀 유무 상태 리턴
    return await _toDoService.updateToDoBoxNoTitleYn(toDoBoxId);
  }

  /// todobox 삭제
  Future<bool> deleteTodoBox(int userId, int toDoBoxId) async {
    // todobox 고정 상태 return
    return await _toDoService.deleteTodoBox(userId, toDoBoxId);
  }

  /// todoelm 객체 생성
  Future<int> createToDoElmObj(int toDoBoxId) async {
    return await _toDoService.createToDoElmObj(toDoBoxId);
  }

  /// todoelm 내용 수정
  Future<bool> updateToDoElmContent(int toDoElmId, String content) async {
    //요청 성공 여부 리턴
    return await _toDoService.updateToDoElmContent(toDoElmId, content);
  }

  /// todoelm 삭제
  Future<bool> deleteTodoElm(int toDoElmId) async {
    // 요청 성공 여부
    return await _toDoService.deleteTodoElm(toDoElmId);
  }

  /// todoelm complete 여부 수정
  Future<bool> updateToDoElmCompleted(int toDoElmId) async {
    bool data = await _toDoService.updateToDoElmCompleted(toDoElmId);
    return data;
  }
}