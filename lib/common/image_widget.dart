import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    this.url,
    Key? key,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return url != null
        ? Image.network(
            url!,
            errorBuilder: (_, __, ___) {
              return SvgPicture.network(
                url!,
              );
            },
          )
        : const SizedBox();
  }
}
