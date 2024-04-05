import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffae_app/src/Global/Export/export.dart';

class CommonCameraWidget extends StatelessWidget {
  final String imageUrl;
  final VoidCallback cameraCallback;
  const CommonCameraWidget({
    super.key,
    required this.imageUrl,
    required this.cameraCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            /* Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(
                  imageUrl: imageUrl,
                ),
              ),
            );*/
          },
          child: Hero(
            tag: imageUrl,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 110,
                  width: 110,
                  alignment: FractionalOffset.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.green,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fitWidth),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => CircleAvatar(
                  maxRadius: 18,
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 2,
          child: InkWell(
            onTap: cameraCallback,
            child: const Icon(
              Icons.photo_camera,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
