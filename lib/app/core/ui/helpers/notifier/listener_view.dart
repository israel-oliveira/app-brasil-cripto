import 'package:app_cripto/app/core/enum/app_state_enum.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/core/ui/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:mobx/mobx.dart';

class ListenerView {
  final AppBaseViewModel viewModel;
  late ReactionDisposer _disposer;
  late ReactionDisposer _disposerInfo;

  ListenerView({required this.viewModel});

  void listener({
    required BuildContext context,
    required SuccesssVoidCallback successCallback,
    ErrorVoidCallback? errorCallback,
  }) {
    _disposerInfo = reaction<String?>(
      (_) => viewModel.infoMessage,
      (infoMessage) {
        if (infoMessage != null) {
          Messages.of(context).showInfo(infoMessage);
        }
      },
    );
    _disposer = reaction<AppState>(
      (_) => viewModel.state,
      (state) {
        if (viewModel.state.isLoading) {
          Loader.show(context);
        } else {
          Loader.hide();
        }

        if (viewModel.state.isError) {
          if (errorCallback != null) {
            errorCallback(viewModel, this);
          }
          Messages.of(context).showError(viewModel.error ?? 'Ocorreu um erro');
          return;
        }

        if (viewModel.state.isSuccess) {
          successCallback(viewModel, this);
          return;
        }
      },
    );
  }

  void dispose() {
    _disposer();
    _disposerInfo();
  }
}

typedef SuccesssVoidCallback =
    void Function(AppBaseViewModel viewModel, ListenerView listenerView);
typedef ErrorVoidCallback =
    void Function(AppBaseViewModel viewModel, ListenerView listenerView);
