import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_seventh_project/future_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final future = ref.watch(futureProvider);
            // skipLoadingOnRefresh => for loading on refresh 
            return future.when
            (skipLoadingOnRefresh: false,data: (data) => Text(data.toString()), error: (error, stack) => Text(error.toString()), loading: () => CircularProgressIndicator());
          },
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider);
        },
      ),
    );
  }
}
