import 'package:cooknotes/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel.dart';

class View<T extends Viewmodel> extends StatelessWidget {
  final Widget Function(BuildContext context, T viewmodel, Widget child)
      builder;

  final void Function(T viewmodel) initViewmodel;

  View({this.builder, this.initViewmodel});

  T _setupViewmodel() {
    final viewmodel = service<T>();

    if (initViewmodel != null) {
      initViewmodel(viewmodel);
    }
    return viewmodel;
  }

  Widget _builder(BuildContext context, T viewmodel, Widget child) {
    if (viewmodel.busy) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: _setupViewmodel(),
      child: Consumer<T>(builder: _builder),
    );
  }
}

class ConsumerView<T extends Viewmodel> extends View<T> {
  ConsumerView({@required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);
}

class SelectorView<T extends Viewmodel, R> extends View<T> {
  final R Function(BuildContext context, T viewmodel) selector;

  SelectorView({@required this.selector, @required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);

  Widget _selectorBuilder(
      BuildContext context, R selectorResult, Widget child) {
    final viewmodel = service<T>();
    return _builder(context, viewmodel, child);
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        value: _setupViewmodel(),
        child: Selector<T, R>(selector: selector, builder: _selectorBuilder),
      );
}

class WidgetView<T extends Viewmodel> extends View<T> {
  WidgetView({@required builder, initViewmodel})
      : super(builder: builder, initViewmodel: initViewmodel);

  @override
  Widget build(BuildContext context) {
    final viewmodel = service<T>();
    return ChangeNotifierProvider.value(
        value: _setupViewmodel(), child: _builder(context, viewmodel, null));
  }
}
