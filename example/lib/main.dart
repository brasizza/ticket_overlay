import 'package:flutter/material.dart';
import 'package:ticket_overlay/ticket_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  TicketAnimation.show(context: context, duration: const Duration(seconds: 2), child: TicketAnimation.ticketDefault);
                },
                child: const Text(
                  'Default Ticket',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  TicketAnimation.show(
                      context: context,
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        'assets/images/ticket.png',
                      ));
                },
                child: const Text(
                  'Custom Image',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
