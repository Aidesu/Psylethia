import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/viewmodel/mushroom_view_model.dart';
import '../components/widgets/app_bar/app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Consumer<MushroomsViewModel>(
          builder: (context, vm, _) => MyAppBar(onSearch: vm.filter),
        ),
      ),
      body: Center(child: Container(child: Text('Profile Page'))),
    );
  }
}
