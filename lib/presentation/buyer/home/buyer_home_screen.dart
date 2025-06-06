import 'package:canarytemplate/presentation/bloc/get_all_burung_tersedia/bloc/getburungtersedia_bloc.dart';
import 'package:canarytemplate/presentation/bloc/get_all_burung_tersedia/bloc/getburungtersedia_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetburungtersediaBloc>().add(GetAllBurungTersediaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
