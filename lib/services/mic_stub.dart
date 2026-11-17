// Fuera de web la grabación va por el paquete record (speech_service.dart).

void micStart({
  required Map<String, Object> cfg,
  required void Function() onStopped,
  required void Function(String text) onResult,
  required void Function() onNoVoice,
  required void Function() onCancelled,
  required void Function() onUnsupported,
  required void Function() onDone,
}) {}

void micFinish() {}

void micCancel() {}

void micRelease(String owner) {}
