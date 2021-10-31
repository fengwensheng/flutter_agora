import 'package:flutter/material.dart';

class ViKeepAliveWrapper extends StatefulWidget {
  final Widget child;
  const ViKeepAliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _YwKeepAliveWrapperState createState() => _YwKeepAliveWrapperState();
}

class _YwKeepAliveWrapperState extends State<ViKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
