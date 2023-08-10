import 'package:SAAYADecor/screens/signin.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';


import '../screens/cart/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
Stripe.publishableKey =
      'pk_test_51LLLPoKaRPx08H0846E1eAB75FHnMgR0abUlVKuZsmnPyzO7c1SBVYGTsl2u33MCKRJccnsVJ2ox6bcf2oUbcjJP00HspIipe5'; 
       Stripe.instance.applySettings();
       String stripePublishableKey='pk_test_51LLLPoKaRPx08H0846E1eAB75FHnMgR0abUlVKuZsmnPyzO7c1SBVYGTsl2u33MCKRJccnsVJ2ox6bcf2oUbcjJP00HspIipe5'; 
;
       Stripe.publishableKey = stripePublishableKey;
  AwesomeNotifications().initialize('resource://drawable/launcher', [
    NotificationChannel(
      channelGroupKey: 'basic_channel_group',
      channelKey: 'basic_channel',
      channelName: 'Basic Notifications',
      defaultColor: const Color.fromARGB(255, 232, 242, 241),
      importance: NotificationImportance.Max,
      ledColor: const Color.fromARGB(255, 157, 120, 9),
      channelShowBadge: true,
      channelDescription: 'Notification for the basic test of the app',
    ),
  ]);
  // objectBox = await ObjectBox.init();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

   @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            initialRoute: SignIn.route,
            title: 'SAAYA Decor',
           // routes: getAppRoutes,
             //themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            
            
          );
        },
      ),
    );
  }
}