

import 'dart:io';

class NetworkConnection {
  checkConnection() async {
    bool connectivityCheck = false;
    try {
      final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 20));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

        connectivityCheck = true;
      } else {
        connectivityCheck = false;
      }
    } on Exception catch (error) {
      connectivityCheck = false;
    }
    return connectivityCheck;
  }
}