import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ijandula/provider/alumnado_provider.dart';
import 'package:ijandula/provider/centro_provider.dart';
import 'package:ijandula/provider/dace_provider.dart';
import 'package:ijandula/provider/expulsados_provider.dart';
import 'package:ijandula/provider/mayores_provider.dart';
import 'package:ijandula/screens/alumnado_screen.dart';
import 'package:ijandula/screens/alumnos_screen.dart';
import 'package:ijandula/screens/convivencia_screen.dart';
import 'package:ijandula/screens/dace_screen.dart';
import 'package:ijandula/screens/datos_alumno_screen.dart';
import 'package:ijandula/screens/expulsados_screen.dart';
import 'package:ijandula/screens/contacto_screen.dart';
import 'package:ijandula/screens/horario_personal_screen.dart';
import 'package:ijandula/screens/horario_prof_screen.dart';
import 'package:ijandula/screens/horarios_cursos.dart';
import 'package:ijandula/screens/horarios_screen.dart';
import 'package:ijandula/screens/listado_profesores.dart';
import 'package:ijandula/screens/mail_telefono_screen.dart';
import 'package:ijandula/screens/mayores_screen.dart';
import 'package:ijandula/screens/personal_screen.dart';
import 'package:provider/provider.dart';
import 'package:ijandula/provider/email_provider.dart';
import 'package:ijandula/screens/home_screen.dart';
import 'package:ijandula/screens/loginFireBase_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AlumnadoProvider(), lazy: false),
        ChangeNotifierProvider(
            create: (context) => CentroProvider(), lazy: false),
        ChangeNotifierProvider(
          create: (context) => EmailProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => DaceProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => ProviderMayoresResponse(),
          lazy: false,
          ),
          ChangeNotifierProvider(
          create: (_) => ProviderExpulsadosResponse(),
          lazy: false,
          ),

      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "loginFireBase_screen",
      routes: {
        "loginFireBase_screen": (_) => LoginFireBaseScreen(),
        "home_screen": (_) => HomeScreen(),
        "dace_screen": (_) => DaceScreen(),
        "alumnado": (_) => AlumnadoScreen(),
        "alumnos": (_) => AlumnosScreen(),
        'contact': (_) => MailPhoneScreen(),
        'datos_alumnos': (_) => DatosAlumnoScreen(),
        'horario': (_) => HorarioScreen(),
        'cursos_horario': (_) => HorariosCursosScreen(),
        'convivencia' : ( _ ) => Convivencia(),
        'mayores' : ( _ ) => MayoresScreen(),
        'expulsados' : ( _ ) => ExpulsadosScreen(),
        "personal_screen": (_) => PersonalScreen(),
        "listado_screen": (_) => ListadoProfesores(),
        "horario_screen": (_) => HorarioPersonalScreen(),
        "horario_prof_screen": (_) => HorarioProfScreen(),
        "contacto_screen": (_) => ContactoScreen(),
      },
    );
  }
}
