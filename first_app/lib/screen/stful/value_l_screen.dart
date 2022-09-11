import 'package:first_app/util/constants.dart';
import 'package:flutter/material.dart';

class ValListenScreen extends StatelessWidget {
  ValueNotifier<int> count = ValueNotifier(0);
  int random = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count.value = count.value + 1;
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ValueListenableBuilder<int>(
            valueListenable: count,
            child: Image.network(imageSrc,
                height: double.infinity, fit: BoxFit.cover),
            builder: (context, cc, imageWidget) {
              return Stack(
                children: [
                  imageWidget!,
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'You have pressed this button',
                          style: txt.headline1!
                              .copyWith(fontSize: 24, color: Colors.white),
                        ),
                        Text(
                          cc.toString(),
                          style: txt.headline1!
                              .copyWith(fontSize: 50, color: Colors.red),
                        ),
                        Text(
                          "times",
                          style: txt.headline1!
                              .copyWith(fontSize: 50, color: Colors.red),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
