import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _disposeAllController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        child: Column(
          children: [
            _buildTextField(
                controller: _nameController, hintText: 'Enter Name'),
            SizedBox(height: 5.h),
            _buildTextField(
                controller: _addressController, hintText: 'Enter Address'),
            SizedBox(height: 5.h),
            _buildTextField(
                controller: _phoneController, hintText: 'Enter Phone number'),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String hintText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide())),
    );
  }

  void _disposeAllController() {
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
  }
}
