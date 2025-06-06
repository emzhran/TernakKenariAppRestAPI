import 'package:flutter/material.dart';

class ProfileBuyerForm extends StatefulWidget {
  const ProfileBuyerForm({super.key});

  @override
  State<ProfileBuyerForm> createState() => _ProfileBuyerFormState();
}

class _ProfileBuyerFormState extends State<ProfileBuyerForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}