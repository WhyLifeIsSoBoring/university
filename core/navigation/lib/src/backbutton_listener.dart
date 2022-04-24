import 'package:flutter/widgets.dart';

class BackButtonListener extends StatefulWidget {
  final Widget? child;
  final Future<bool> Function()? onBackPressed;

  const BackButtonListener({
    this.child,
    this.onBackPressed,
  });
  @override
  BackButtonListenerState createState() => BackButtonListenerState();
}

class BackButtonListenerState extends State<BackButtonListener> {
  BackButtonDispatcher? dispatcher;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dispatcher?.removeCallback(widget.onBackPressed!);

    dispatcher = Router.of(context)
        .backButtonDispatcher
        ?.createChildBackButtonDispatcher();
    dispatcher?.addCallback(widget.onBackPressed!);
    dispatcher?.takePriority();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}
