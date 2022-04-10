// Mocks generated by Mockito 5.1.0 from annotations
// in diagrams/services/file_operation/file_operation.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;
import 'dart:typed_data' as _i6;

import 'package:diagrams/bloc/add_remove_element/add_remove_element_bloc.dart'
    as _i7;
import 'package:diagrams/bloc/arrows/draw_arrows_bloc.dart' as _i8;
import 'package:diagrams/bloc/save/file_model.dart' as _i2;
import 'package:diagrams/services/file_operation/file_operation.dart' as _i3;
import 'package:file_selector/file_selector.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeFileModel_0 extends _i1.Fake implements _i2.FileModel {}

/// A class which mocks [FileOperationService].
///
/// See the documentation for Mockito's code generation for more information.
class MockFileOperationService extends _i1.Mock
    implements _i3.FileOperationService {
  MockFileOperationService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<String?> getPath() =>
      (super.noSuchMethod(Invocation.method(#getPath, []),
          returnValue: Future<String?>.value()) as _i4.Future<String?>);
  @override
  _i4.Future<_i5.XFile?> openFromDisk() =>
      (super.noSuchMethod(Invocation.method(#openFromDisk, []),
          returnValue: Future<_i5.XFile?>.value()) as _i4.Future<_i5.XFile?>);
  @override
  _i4.Future<bool> saveOnDisk({_i6.Uint8List? data, String? path}) =>
      (super.noSuchMethod(
          Invocation.method(#saveOnDisk, [], {#data: data, #path: path}),
          returnValue: Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i6.Uint8List collectDataToSave(
          _i7.AddRemoveElementBloc? addRemoveElementBloc,
          _i8.DrawArrowsBloc? drawArrowsBloc) =>
      (super.noSuchMethod(
          Invocation.method(
              #collectDataToSave, [addRemoveElementBloc, drawArrowsBloc]),
          returnValue: _i6.Uint8List(0)) as _i6.Uint8List);
  @override
  _i4.Future<_i2.FileModel> modelFromOpenedFile(_i5.XFile? openingFile) =>
      (super.noSuchMethod(
              Invocation.method(#modelFromOpenedFile, [openingFile]),
              returnValue: Future<_i2.FileModel>.value(_FakeFileModel_0()))
          as _i4.Future<_i2.FileModel>);
}
