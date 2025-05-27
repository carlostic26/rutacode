import 'package:flutter/material.dart';
import 'package:rutacode/core/app_config.dart';
import 'package:rutacode/features/exam/presentation/screens/start_exam_screen.dart';
import 'package:rutacode/features/modules/presentation/screens/app_support.dart';
import 'package:rutacode/features/modules/presentation/screens/delete_progress.dart';
import 'package:rutacode/features/modules/presentation/screens/usability_screen.dart';
import 'package:rutacode/features/progress/presentation/screens/progres_score_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawer extends StatelessWidget {
  final BuildContext? context;
  HomeDrawer({super.key, required this.context});

  final AppConfig infoApp = AppConfig();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF2962FF),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/icons/logo.jpg',
                  height: heightScreen * 0.08,
                  width: widthScreen * 0.18,
                ),
                const SizedBox(height: 2),
                Text(
                  infoApp.nameApp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  infoApp.versionApp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Módulos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Mis puntajes'),
            onTap: () {
              /*      Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProgressScoreScreen()),
              ); */
            },
          ),
          ListTile(
            leading: const Icon(Icons.volunteer_activism),
            title: const Text('Apoya la app'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AppSupport()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rtl),
            title: const Text('Examen Flutter Jr'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StartExamScreen(
                          moduleId: 'Jr',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rtl),
            title: const Text('Examen Flutter Mid'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StartExamScreen(
                          moduleId: 'Mid',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rtl),
            title: const Text('Examen Flutter Sr'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const StartExamScreen(
                          moduleId: 'Sr',
                        )),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete_sweep),
            title: const Text('Eliminar progresos'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const DeleteProgressWidget(),
              );
            },
          ),
          SizedBox(
            height: heightScreen * 0.02,
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Información',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.psychology_alt),
            title: const Text('Usabilidad'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UsabilityScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Info de la app'),
            onTap: () {
              dialogVersion(context, 'Información',
                  '${infoApp.nameApp} es una guía definitiva para dominar el framework Flutter de manera estructurada. La app organiza el aprendizaje en niveles progresivos (Jr, Mid, Sr), con contenido práctico y evaluaciones que miden tu dominio real del desarrollo multiplataforma.\n\n Desarrollada por el grupo de estudio "Creciendo con Flutter" liderado por el Ing. Carlos Peñaranda. \n\nVersión: ${infoApp.versionApp}');
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Política de Privacidad'),
            onTap: () {
              _launchUrlPolicyPrivacy();
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> dialogVersion(BuildContext context, title, description) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: Colors.black87,
          title: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 25),
                  child: Text(textAlign: TextAlign.center, description),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.black12),
                      ),
                      child: const Text(
                        'Ok',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _launchUrlPolicyPrivacy() async {
    final Uri url = Uri.parse(
        'https://www.termsfeed.com/live/00b5994d-ba57-4b14-b52e-a048f4b25c39');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'No se pudo lanzar la URL $url';
    }
  }
}
