import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/injection_container.dart';
import 'core/theme/app_theme.dart';
import 'routing/app_router.dart';

/// Root application widget for Banco Ademi
/// 
/// ⚠️ DEMO MODE: All data is mocked from JSON files
class BancoAdemiApp extends StatelessWidget {
  const BancoAdemiApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Wrap with MultiBlocProvider when global BLoCs are implemented
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => getIt<AuthBloc>()),
    //     BlocProvider(create: (_) => getIt<ThemeBloc>()),
    //   ],
    //   child: MaterialApp.router(...),
    // );
    
    return MaterialApp.router(
        title: 'Banco ADEMI - Demo',
        debugShowCheckedModeBanner: false,
        
        // Theme Configuration
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        
        // Localization Configuration
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es', 'DO'), // Spanish (Dominican Republic)
          Locale('en', 'US'), // English (United States)
        ],
        locale: const Locale('es', 'DO'),
        
        // Routing Configuration
        routerConfig: AppRouter.router,
        
        // Builder for custom configurations
        builder: (context, child) {
          // TODO: Add global error handling, connectivity checks, etc.
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      );
  }
}
