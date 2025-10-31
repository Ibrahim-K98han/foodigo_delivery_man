import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/register/cubit/register_cubit.dart';
import 'package:foodigo_delivery_man/features/register/cubit/register_state.dart';
import 'package:foodigo_delivery_man/features/register/model/register_state_model.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/components/document_info.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/components/personal_info.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/components/vehicle_info.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_appbar.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';
import 'package:foodigo_delivery_man/widget/primary_button.dart';

class DeliverymanRegistrationScreen extends StatefulWidget {
  const DeliverymanRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<DeliverymanRegistrationScreen> createState() =>
      _DeliverymanRegistrationScreenState();
}

class _DeliverymanRegistrationScreenState
    extends State<DeliverymanRegistrationScreen> {
  int currentStep = 0;

  late RegisterCubit rCubit;
  @override
  void initState() {
    super.initState();
    rCubit = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(
        title: 'Become a Deliveryman',
        visibleLeading: true,
      ),

      body: Column(
        children: [
          _buildStepIndicator(),
          Expanded(
            child: SingleChildScrollView(
              padding: Utils.all(value: 4),
              child: _buildCurrentStep(),
            ),
          ),
          Padding(
            padding: Utils.symmetric(h: 20.0, v: 10.0),
            child: BlocConsumer<RegisterCubit, RegisterStateModel>(
              // listener: (context, state) {
              //   final register = state.registerState;
              //   if (register is RegisterStateOneLoading) {
              //     Utils.loadingDialog(context);
              //   } else {
              //     Utils.closeDialog(context);
              //     if (register is RegisterStateOneError) {
              //       Utils.failureSnackBar(context, register.message);
              //     } else if (register is RegisterStateOneSuccess) {
              //       Utils.successSnackBar(context, register.message);
              //       setState(() {
              //         if (currentStep == 0) {
              //           currentStep = 1;
              //         } else if (currentStep == 1) {
              //           currentStep = 2;
              //         }
              //       });
              //     }
              //   }
              // },
              listener: (context, state) {
                final register = state.registerState;

                // Loading states
                if (register is RegisterStateOneLoading ||
                    register is RegisterStateTwoLoading ||
                    register is RegisterStateThreeLoading) {
                  Utils.loadingDialog(context);
                  return;
                }

                // Close any loading dialog if not loading
                Utils.closeDialog(context);

                // Error states
                if (register is RegisterStateOneError) {
                  Utils.failureSnackBar(context, register.message);
                  return;
                }
                if (register is RegisterStateTwoError) {
                  Utils.failureSnackBar(context, register.message);
                  return;
                }
                if (register is RegisterStateThreeError) {
                  Utils.failureSnackBar(context, register.message);
                  return;
                }

                // Success states
                if (register is RegisterStateOneSuccess) {
                  Utils.successSnackBar(context, register.message);
                  setState(() => currentStep = 1);
                  return;
                }
                if (register is RegisterStateTwoSuccess) {
                  Utils.successSnackBar(context, register.message);
                  setState(() => currentStep = 2);
                  return;
                }
                if (register is RegisterStateThreeSuccess) {
                  Utils.successSnackBar(context, register.message);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.registrationOtpVerifyScreen,
                    (route) => false,
                  );
                }
              },

              builder: (context, state) {
                return PrimaryButton(
                  text: currentStep < 2 ? 'Save & Next' : 'Submit',
                  onPressed: () {
                    if (currentStep == 0) {
                      rCubit.registerStepOne();
                    } else if (currentStep == 1) {
                      rCubit.registerStepTwo();
                    } else if (currentStep == 2) {
                      rCubit.registerStepThree();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      color: Colors.white,
      padding: Utils.symmetric(),
      child: Row(
        children: [
          _buildStep(1, 'Step 1', 'Personal Info', currentStep >= 0),
          _buildStepConnector(currentStep >= 1),
          _buildStep(2, 'Step 2', 'Document', currentStep >= 1),
          _buildStepConnector(currentStep >= 2),
          _buildStep(3, 'Step 3', 'Vehicle Info', currentStep >= 2),
        ],
      ),
    );
  }

  Widget _buildStep(int stepNum, String title, String subtitle, bool isActive) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isActive ? Colors.amber : Colors.white,
            border: Border.all(
              color: isActive ? Colors.amber : Colors.grey[300]!,
              width: 2,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child:
                isActive && currentStep > stepNum - 1
                    ? Icon(Icons.check, color: Colors.white, size: 16)
                    : Text(
                      '$stepNum',
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
          ),
        ),
        Utils.verticalSpace(4),
        CustomText(text: title, fontSize: 12, fontWeight: FontWeight.w500),
        CustomText(text: subtitle, fontSize: 11, color: sTxtColor),
      ],
    );
  }

  Widget _buildStepConnector(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 30),
        color: isActive ? Colors.amber : Colors.grey[300],
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return PersonalInfoStep();
      case 1:
        return DocumentInfoStep();
      case 2:
        return VehicleInfoStep();
      default:
        return PersonalInfoStep();
    }
  }
}
