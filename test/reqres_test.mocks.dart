// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_application_1/test/reqres_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i6;

import 'package:flutter_application_1/303/reqres_resource/model/resource_model.dart'
    as _i4;
import 'package:flutter_application_1/303/reqres_resource/service/reqres_service.dart'
    as _i2;
import 'package:flutter_application_1/303/reqres_resource/viewModel/reqres_provider.dart'
    as _i3;
import 'package:flutter_application_1/product/global/resource_context.dart'
    as _i5;
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
// ignore_for_file: subtype_of_sealed_class

class _FakeIResourceService_0 extends _i1.SmartFake
    implements _i2.IResourceService {
  _FakeIResourceService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ReqresProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockReqresProvider extends _i1.Mock implements _i3.ReqresProvider {
  MockReqresProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IResourceService get reqresService => (super.noSuchMethod(
        Invocation.getter(#reqresService),
        returnValue: _FakeIResourceService_0(
          this,
          Invocation.getter(#reqresService),
        ),
      ) as _i2.IResourceService);

  @override
  List<_i4.Data> get resources => (super.noSuchMethod(
        Invocation.getter(#resources),
        returnValue: <_i4.Data>[],
      ) as List<_i4.Data>);

  @override
  set resources(List<_i4.Data>? _resources) => super.noSuchMethod(
        Invocation.setter(
          #resources,
          _resources,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: false,
      ) as bool);

  @override
  set isLoading(bool? _isLoading) => super.noSuchMethod(
        Invocation.setter(
          #isLoading,
          _isLoading,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  bool? saveToLocale(
    _i5.ResourceContext? resourceContext,
    List<_i4.Data>? resources,
  ) =>
      (super.noSuchMethod(Invocation.method(
        #saveToLocale,
        [
          resourceContext,
          resources,
        ],
      )) as bool?);

  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ResourceContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockResourceContext extends _i1.Mock implements _i5.ResourceContext {
  MockResourceContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  set model(_i4.ResourceModel? _model) => super.noSuchMethod(
        Invocation.setter(
          #model,
          _model,
        ),
        returnValueForMissingStub: null,
      );

  @override
  void saveModel(_i4.ResourceModel? model) => super.noSuchMethod(
        Invocation.method(
          #saveModel,
          [model],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );
}