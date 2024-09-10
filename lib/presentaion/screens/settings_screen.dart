import 'package:app_localiz_cubit/Helper/app_localization.dart';
import 'package:app_localiz_cubit/Logic%20Business/cubit/cubit/translation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          title: Text(AppLocalization.of(context)!.translate('settings')),
        ),
        body: Center(
          child: BlocConsumer<TranslationCubit, TranslationState>(
              listener: (context, state) {
            if (state is ChangeTranslationState) {
              Navigator.of(context).pop();
            }
          }, builder: (context, state) {
            if (state is ChangeTranslationState) {
              return DropdownButton<String>(
                  value: state.locale.languageCode,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem<String>(
                      child: Text(items),
                      value: items,
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      BlocProvider.of<TranslationCubit>(context)
                          .changeLanguageCode(newValue);
                    }
                  });
            }
            ;
            return SizedBox();
          }),
        ));
  }
}
