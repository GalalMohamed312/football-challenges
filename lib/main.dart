
import 'package:flutter/material.dart';
import 'package:foot/core/routing/app_router.dart';
import 'package:foot/football_challenge_app.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/dependency_injection.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://tcpoaobudskxipipuhtm.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRjcG9hb2J1ZHNreGlwaXB1aHRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIxMTM5NDMsImV4cCI6MjA0NzY4OTk0M30.W0jSUFAjunCDtvLi_RmygrQtxeKoDRZTxdlt8CcGZPo",
  );
  setupDI();
  runApp( FootBallChallengeApp(appRouter: AppRouter(),));
}

