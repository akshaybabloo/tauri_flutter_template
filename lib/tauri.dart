import 'dart:js_interop';
import 'package:web/web.dart';

@JS()
@staticInterop
class _Tauri {}

@JS()
@staticInterop
class _TauriCore {}

extension TauriCoreExtension on _TauriCore {
  external JSPromise<JSAny> invoke(JSAny target, JSAny? args);
}

extension TauriExtension on _Tauri {
  external _TauriCore get core;
}

extension TauriInterop on Window {
  /// Invokes a Tauri command.
  Future<Object?> invoke(String cmd, [Map<String, Object?> args = const {}]) async {
    final result = await __TAURI__.core.invoke(cmd.toJS, args.jsify()).toDart;
    return result.dartify();
  }

  external _Tauri get __TAURI__;
}
