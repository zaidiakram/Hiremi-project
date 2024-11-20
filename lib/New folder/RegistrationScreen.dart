import 'package:flutter/material.dart';
import 'package:hiremi_project/New%20folder/Colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiremi_project/New%20folder/Component/custom_text_field.dart';
import 'package:hiremi_project/New%20folder/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController birthPlaceController = TextEditingController();

  String? selectedGender;
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Create Account',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0f3cc9),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'Personal Information',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 24),
            HorizontalStepper(
              currentStep: currentStep,
              onStepTap: (index) {
                setState(() {
                  currentStep = index;
                });
              },
            ),
            const SizedBox(height: 24),
            CustomTextField(
              controller: fullNameController,
              labelText: "Full Name",
              hintText: 'John Doe',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),
            CustomTextField(
              controller: fatherNameController,
              labelText: "Father’s Full Name",
              hintText: 'Father Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your father\'s full name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Gender',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0F3CC9),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildGenderRadio('Male'),
                const SizedBox(width: 10),
                _buildGenderRadio('Female'),
                const SizedBox(width: 10),
                _buildGenderRadio('Other'),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: dobController,
              labelText: 'Date of Birth',
              hintText: 'DD/MM/YYYY',
              prefixIcon: const Icon(Icons.calendar_today,
                  color: AppColors.secondaryTextColor),
              isDatePicker: true,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  dobController.text =
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}';
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your date of birth';
                }
                return null;
              },
            ),
            CustomTextField(
            controller: birthPlaceController,
            hintText: 'Select State',
            labelText: 'State',
            isDropdown: true,
            dropdownItems: const [
              'Uttar Pradesh',
              'Maharashtra',
              'Delhi',
              'Karnataka',
              'Tamil Nadu',
              'Gujarat',
              'Rajasthan',
            ],
            onDropdownChanged: (value) {
              print('Selected State: $value');
            },
          ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreenUpdated(),
                      ),
                    );
                  },
                  child: Text('back'),
                  style: TextButton.styleFrom(
                    textStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff0F3CC9),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Gender: $selectedGender');
                  },
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                    backgroundColor: Color(0xff0F3CC9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderRadio(String gender) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.textFieldBorderColor,
          ),
          color: Color(0xffF1F4FF),
        ),
        child: RadioListTile<String>(
          value: gender,
          groupValue: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
          title: Text(
            gender,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color:
                  selectedGender == gender ? Color(0xff0F3CC9) : Colors.black,
            ),
          ),
          activeColor: Color(0xff0F3CC9),
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 2),
        ),
      ),
    );
  }
}

class HorizontalStepper extends StatelessWidget {
  final int currentStep;
  final Function(int) onStepTap;

  const HorizontalStepper({
    required this.currentStep,
    required this.onStepTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () => onStepTap(index),
          child: Row(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: const Color(0xff0F3CC9),
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor:
                      currentStep >= index ? Colors.white : Colors.white,
                  child: Icon(
                    currentStep > index ? Icons.check : Icons.circle,
                    color: const Color(0xff0F3CC9),
                    size: 10,
                  ),
                ),
              ),
              if (index != 3)
                Container(
                  width: 30,
                  height: 2,
                  color: currentStep > index ? const Color(0xff0F3CC9) : Colors.grey,
                ),
            ],
          ),
        );
      }),
    );
  }
}
