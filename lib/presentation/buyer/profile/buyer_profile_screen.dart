import 'package:canarytemplate/presentation/buyer/profile/bloc/profile_buyer_bloc.dart';
import 'package:canarytemplate/presentation/buyer/profile/bloc/profile_buyer_event.dart';
import 'package:canarytemplate/presentation/buyer/profile/bloc/profile_buyer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerProfileScreen extends StatefulWidget {
  const BuyerProfileScreen({super.key});

  @override
  State<BuyerProfileScreen> createState() => _BuyerProfileScreenState();
}

class _BuyerProfileScreenState extends State<BuyerProfileScreen> {
  @override
  initState() {
    super.initState();
    context.read<ProfileBuyerBloc>().add(GetProfileBuyerEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Pembeli')),
      body: BlocListener<ProfileBuyerBloc, ProfileBuyerState>(
        listener: (context, state) {
          if (state is ProfileBuyerAdded) {
            context.read<ProfileBuyerBloc>().add(GetProfileBuyerEvent());
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Profile berhasil ditambahkan')),
            );
          }
        },
      ),
    );
  }
}
