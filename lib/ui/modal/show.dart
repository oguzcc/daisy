import 'package:daisy/core/extension/context_extension.dart';
import 'package:daisy/ui/modal/wolt_layout.dart';
import 'package:daisy/ui/util/strings/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>(debugLabel: 'root');

sealed class Show {
  /// shows modal bottom sheet
  static Future<T?> modal<T>(
    BuildContext context,
    Widget child, {
    bool? drag,
    double? radius,
  }) async {
    return showModalBottomSheet<T>(
      showDragHandle: drag ?? false,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(radius ?? 24)),
      ),
      context: context,
      builder: (ctx) => Padding(
        padding: ctx.mediaViewInset,
        child: child,
      ),
    );
  }

  // Implement pageIndexNotifier from page using ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);
  static Future<T?> woltModal<T>(BuildContext context,
      {bool? showDragHandle = false,
      bool? barrierDismissible = true,
      VoidCallback? onModalDismissedWithBarrierTap,
      VoidCallback? onModalDismissedWithDrag,
      required List<WoltModalSheetPage> pages}) async {
    return WoltModalSheet.show(
        pageIndexNotifier: pageIndexNotifier,
        useSafeArea: true,
        context: context,
        showDragHandle: showDragHandle,
        barrierDismissible: barrierDismissible,
        modalBarrierColor: Colors.black.withOpacity(.3),
        onModalDismissedWithBarrierTap: () {
          WoltLayout.backToFirstPageAndPop(context);
        },
        onModalDismissedWithDrag: () {
          WoltLayout.backToFirstPageAndPop(context);
        },
        pageListBuilder: (context) => pages);
  }

  static Future<T?> woltSingle<T>(
    BuildContext context, {
    required String title,
    bool? isLeading = false,
    Color? onButtonColor,
    String? buttonTitle,
    VoidCallback? onButtonPressed,
    VoidCallback? onLeadingPressed,
    VoidCallback? onTrailingPressed,
    Widget? heroImage,
    bool? cancelButton,
    required Widget child,
  }) async {
    return woltModal(context, pages: [
      WoltLayout.woltPage(
        context,
        title: title,
        buttonTitle: buttonTitle,
        heroImage: heroImage,
        isLeading: isLeading,
        onLeadingPressed: onLeadingPressed,
        onTrailingPressed: onTrailingPressed,
        onButtonPressed: onButtonPressed,
        cancelButton: cancelButton ?? true,
        child: child,
        onButtonColor: onButtonColor,
      )
    ]);
  }

  static Future<T?> cupertinoSheet<T>(
    BuildContext context,
    Widget child,
  ) async {
    return showCupertinoModalPopup<T>(
      context: context,
      builder: (context) => child,
    );
  }

  /// shows dialog
  static Future<T?> floatingModal<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      useRootNavigator: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (contex) => child,
    );
  }

  static Future<T?> searchModal<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      showDragHandle: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (contex) => child,
    );
  }

  /// shows snack bar in the current context
  static void snack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: context.colorScheme.surface,
        content: Column(
          children: [
            Text(message, style: context.text.bodySmall),
          ],
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// shows snack bar top of everything
  static void snackTop(BuildContext context, String message,
      {bool isError = false}) {
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: context.colorScheme.surface,
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 48),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
              color: isError
                  ? context.colorScheme.error
                  : context.colorScheme.primary,
              width: 1),
        ),
        content: Text(message,
            style: TextStyle(
                fontSize: 14,
                color: isError
                    ? context.colorScheme.error
                    : context.colorScheme.primary)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// shows snack bar top of everything
  static void snackNotificationPopup(Widget child) {
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: child,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(8),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 600),
      ),
    );
  }

  /// shows dialog
  static Future<T?> dialog<T>(BuildContext context, Widget child) async {
    return showDialog<T>(
      context: context,
      builder: (context) => child,
    );
  }

  /// shows cupertino dialog
  static Future<T?> cupertinoDialog<T>(
      BuildContext context, Widget child) async {
    return showCupertinoDialog<T>(
      context: context,
      builder: (context) => child,
    );
  }

  // shows cupertino modal popup
  static Future<T?> cupertinoModalPopup<T>(
    BuildContext context,
    Widget child,
  ) {
    return showCupertinoModalPopup(
      context: context,
      barrierColor: Colors.black87,
      builder: (context) => child,
    );
  }

  /// shows dialog
  static Future<T?> feedback<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      useRootNavigator: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (contex) => child,
    );
  }

  /// shows banner in the current context
  static void banner(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text(message,
            style: context.text.bodySmall
                ?.copyWith(color: context.colorScheme.onSurface)),
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: Text(Strings.close,
                style: context.text.bodySmall
                    ?.copyWith(color: context.colorScheme.onSurface)),
          ),
        ],
      ),
    );
  }

  /// shows banner top of everything
  static void bannerTop(String message) {
    rootScaffoldMessengerKey.currentState?.clearMaterialBanners();
    rootScaffoldMessengerKey.currentState?.showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              rootScaffoldMessengerKey.currentState
                  ?.hideCurrentMaterialBanner();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  static void syncIndicator(String message) async {
    rootScaffoldMessengerKey.currentState?.clearMaterialBanners();
    rootScaffoldMessengerKey.currentState?.showMaterialBanner(
      MaterialBanner(
        content: Text(message),
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.black12,
        dividerColor: Colors.black12,
        // leading: Indicator.sync(),
        actions: [
          TextButton(
            onPressed: () {
              rootScaffoldMessengerKey.currentState
                  ?.hideCurrentMaterialBanner();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );

    rootScaffoldMessengerKey.currentState?.hideCurrentMaterialBanner();
  }

  static void loading(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black45,
      barrierDismissible: false,
      barrierLabel: 'Loading...',
      pageBuilder: (_, __, ___) {
        return Center(
          child: LoadingOverlay(
            color: context.colorScheme.primary,
          ),
        );
      },
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  // @override
  // Widget build(BuildContext context) => LoadingIndicator.center(
  //       color: color,
  //       size: size,
  //     );
}
