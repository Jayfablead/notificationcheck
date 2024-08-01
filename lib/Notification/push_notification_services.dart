import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:http/http.dart' as http;

class PushNotificationServices {
  Future<String> getAccessToken() async {
    final servicesAccountJson = {
      "type": "service_account",
      "project_id": "testnotification-67999",
      "private_key_id": "f9bde759a5f81a03ac7438fe94848ec87dbe529d",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDjp7oskDem2dvc\njLWk366dtnoYq0I2nOYPiHIJUJJ42laxJM3ZtUgJSIWoxwD0fmawmloJfij+OmCz\nUD5a1j3tQHfLoD6us2wRUL5Y/HbJisSdA7g7pfMRIcPVPo61Kl3GPzpkD3sDYja8\nOiOI441ihrGHQ9XY5rrmpJ4rDXLpotZ/5k5eDvaSHgA+dyvELSxBvhUrcsymfwaw\nZpFJdm5kzhM62/szcH2RIwHflyZsx17C0sG3MV+D5ySSVLYVQhFDCwawqr8ng/XT\nyZL+zhZmtgLvV1bhn9sfi0WkLg8rXybwre5SMYInGvBIDWU4R+OovJo3rOXjhV5U\nyLkXQb4pAgMBAAECggEAC/UJ+KSFGOzDcAcI1M6V/69YbWFrGmVfbg629zT+9sZ4\nd6GTvghhJZaI6YZsBet5+XMVakheldRf1yjzBXurrJPOe41JxGgARgVovXY1x06d\nX8q5S23jKqQeuZRgXOvCGZMzmW5B3ZUhqGshCfY7dFmOnaitZNEFnVylZmR9qEi/\n0fHpgp4wNSn2BjelabFxuw9LniQlgkS3ipLyKqzcbsXrFyZsKAPRZZald8r5o/Xa\n3vezuFTS3UwUJq/xmpS9xV/sJLQpESyWWgHO2JOcVApsjMjE+m8Z0W+mIlb51YAL\nnDvjzZvfqRK8YmXjJ2oyYTtTjsrEkIgDKyFsawehuwKBgQD3LHAJP0kQdItBBkk9\nJuu8UmMovUevKVTR7Cil855fFQpS3/ak2Nj9HovssxrTaJ02PlAwHpEU6kRk+B62\nGwMQvY4jUDIY7MjGUOl7tsIqT0pvAhafKn/Wln2R02OK3+uiW39u3tt/Y5/gqryS\noZ3bGLu55WQqHThAF0RSlVG4JwKBgQDryNw0J/g5Qc5IXJvAhY13OnOk2RE7z9vk\nVuxTymbwcBAxgqa/XABe/N0HjXFX93rAYp48k8ymTQcJMZXj04wzAVaBmLRwbzsT\nJHSE8GSswkSqIddN3Ya/WLnCWcCmVO0yNlqHIyrIB9XKh7ORMFoOxGSUn9xGQdoU\nC9NMgKX5LwKBgArOLYOp+Za3kZLhJHiA6BNOgrk4NRcKNoQKz+gZU1YSxGXFFrI0\nLKA8Ip/RYJ3XV/AUH0tLOspwR1cmpakOWz7zGnCew+HlEA3jYaGf5rMUzks2Cykg\nIYCPCaRDWnmqulFZsKN3KJ9UCpw2upGqcQ0v8pz40z0oE9pxafI2RuFHAoGAf2Y5\nbUkHe1COOFUppx3CcWC46aKMCEhopPk+mourkVDLvyS8GnuIi8qPVyxayNAkmFzw\n6QRnOJg4LASJ298LSuf3KPEs1e+T+OTivI3zp9EULuU4I4+F5k/3lwbN7FHJFC+A\nPLKIxCpPny4xnUqF7qK5QgEakS+1uM0m75g3lesCgYAmUhpRQr/Z3Ehc4Z2aTd0c\nOkr2MXO4NV+2wAp98JXVgIU2yeldd2nSiW5KT4X+gKrYYD1l5TggeTM++xZJQn8Q\nBCshGNQXmDw5+QwZW+uEug47NICZdfZ83WFhlLT6aY+yt9dQEe5fPxqhc2qll8yo\niLwF7i9NIGOygyjbW/bk7g==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "flutter-notify-jack@testnotification-67999.iam.gserviceaccount.com",
      "client_id": "111334867097715962850",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/flutter-notify-jack%40testnotification-67999.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com"
    };
    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(servicesAccountJson), scopes);

    /// Get Access Token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(servicesAccountJson),
            scopes,
            client);

    client.close();

    return credentials.accessToken.data;
  }
}
