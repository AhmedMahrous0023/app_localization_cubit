import 'package:app_localiz_cubit/Helper/app_localization.dart';
import 'package:app_localiz_cubit/Logic%20Business/cubit/cubit/translation_cubit.dart';
import 'package:app_localiz_cubit/presentaion/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>TranslationCubit()..getSavedLanguage(),
    child: BlocBuilder<TranslationCubit,TranslationState>(builder: ((context, state) {
      if(state is ChangeTranslationState){
        return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const  HomeScreen(),
      locale: state.locale,
      supportedLocales:const [
        Locale('en'),
        Locale('ar')
      ],localizationsDelegates:const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      // localeResolutionCallback: (deviceLocale, supportedLocales) {
      //   for (var locale in supportedLocales ){
      //     if (deviceLocale!=null && deviceLocale.languageCode==locale.languageCode){
      //       return deviceLocale ;
      //     }
      //     return supportedLocales.first ;
      //   }
      //   return null ;
        
      // },
    );
      }return SizedBox();
    })),);
  }
}