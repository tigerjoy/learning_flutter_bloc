import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter_bloc/bloc/counter_bloc.dart';
import 'package:learning_flutter_bloc/cubit/counter_cubit.dart';
import 'package:learning_flutter_bloc/inc_dec_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    // <BlocType, stateType>
    // Does not require setState()
    // This initiates a re-build of the entire Widget tree
    // Therefore we should wrap the smallest part of the code
    // where the state changes with BlocBuilder
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // BlocBuilder<CounterCubit, int>(
            //   bloc: counterCubit,
            //   builder: (context, state) {
            //     return Text(
            //       '$state',
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     );
            //   },
            // ),
            BlocBuilder<CounterBloc, int>(
              // If bloc: is not explicityly provided, then BlocBuilder
              // goes up the WidgetTree and tries to find a provider
              // that matches the type CounterBloc
              // bloc: counterBloc,
              builder: (context, state) {
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'homePage_inc_btn',
            onPressed: () {
              // counterCubit.increment();
              counterBloc.add(CounterIncremented());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: 'navigate_next',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const IncDecPage(),
              ));
            },
            tooltip: 'Navigate Next',
            child: const Icon(Icons.navigate_next),
          )
          // const SizedBox(
          //   width: 15,
          // ),
          // FloatingActionButton(
          //   onPressed: () {
          //     counterCubit.decrement();
          //   },
          //   tooltip: 'Decrement',
          //   child: const Icon(Icons.remove),
          // )
        ],
      ),
    );
  }
}

// Using Bloc we don't need a StatefulWidget anymore
// We can just use a Stateless widget
// class _MyHomePageState extends State<MyHomePage> {
//   // We will be using BlocProvider to retrieve the
//   // singleton instance of the counterCubit
//   // late final CounterCubit counterCubit;

//   // _MyHomePageState() {
//   //   counterCubit = CounterCubit();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final counterCubit = BlocProvider.of<CounterCubit>(context);

//     // <BlocType, stateType>
//     // Does not require setState()
//     // This initiates a re-build of the entire Widget tree
//     // Therefore we should wrap the smallest part of the code
//     // where the state changes with BlocBuilder
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             BlocBuilder<CounterCubit, int>(
//               bloc: counterCubit,
//               builder: (context, state) {
//                 return Text(
//                   '$state',
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               counterCubit.increment();
//             },
//             tooltip: 'Increment',
//             child: const Icon(Icons.add),
//           ),
//           // const SizedBox(
//           //   width: 15,
//           // ),
//           // FloatingActionButton(
//           //   onPressed: () {
//           //     counterCubit.decrement();
//           //   },
//           //   tooltip: 'Decrement',
//           //   child: const Icon(Icons.remove),
//           // )
//         ],
//       ),
//     );
//   }
// }
