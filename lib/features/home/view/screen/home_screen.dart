import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/cubit/app_cubit.dart';
import 'package:tasks/core/cubit/app_states.dart';
import 'package:tasks/features/home/view/widgets/card_builder.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jewelry Shop")),
      body: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          if (state is LoadingData) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetDataSuccessfully) {
            if (cubit.products.isEmpty) {
              return const Center(child: Text("No products available"));
            }
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cubit.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                final product = cubit.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                  child: CardBuilder(product: product),
                );
              },
            );
          } else if (state is ErrorLoadingData) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
