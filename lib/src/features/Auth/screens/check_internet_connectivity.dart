import 'package:caffae_app/src/Global/Export/export.dart';
import 'package:caffae_app/src/Global/Utils/internet_connectivity.dart';
import 'package:caffae_app/src/Global/widgets/no_internet_screen.dart';

class ConnectionAwareScreen extends StatelessWidget {
  const ConnectionAwareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: ConnectionStatusListener.getInstance()
          .connectionChangeController
          .stream,
      initialData: ConnectionStatusListener.getInstance().hasConnection,
      builder: (context, snapshot) {
        final hasConnection = snapshot.data ?? false;

        if (!hasConnection) {
          return const NoInternetScreen();
        } else {
          return Container();
        }
      },
    );
  }
}
