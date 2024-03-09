part of com.curi.app.profileuser.pages;

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white[0],
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFF3962E),
            ),
            onPressed: Get.back,
          ),
          title: const Text(
            'Perfil',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: UILayout.medium,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111007),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.sunset[50]!.withOpacity(0.3),
                    ),
                    child: Column(
                      children: <Widget>[
                        Spacing.spacingV24,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: UILayout.medium,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.ocean[40],
                            radius: UILayout.large,
                            child: const CircleAvatar(
                              radius: UILayout.xlarge,
                              backgroundImage: NetworkImage(
                                'https://picsum.photos/id/237/200/300',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Juan',
                          style: TextStyle(
                            fontSize: UILayout.large,
                            color: Colors.gray[90],
                          ),
                        ),
                        Spacing.spacingV24,
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Tipo de usuario',
                          style: TextStyle(
                            fontSize: UILayout.medium,
                            color: Colors.gray[90],
                          ),
                        ),
                        Text(
                          'Estudiante - Monitor',
                          style:
                              TextStyle(fontSize: 14, color: Colors.sunset[50]),
                        ),
                        const SizedBox(
                          height: UILayout.small,
                        ),
                        Text(
                          'Contacto',
                          style: TextStyle(
                            fontSize: UILayout.medium,
                            color: Colors.gray[90],
                          ),
                        ),
                        Text(
                          '+57 3187517662',
                          style:
                              TextStyle(fontSize: 14, color: Colors.sunset[50]),
                        ),
                        const SizedBox(
                          height: UILayout.small,
                        ),
                        Text(
                          'Carrera',
                          style: TextStyle(
                            fontSize: UILayout.medium,
                            color: Colors.gray[90],
                          ),
                        ),
                        Text(
                          'Ingeniería mmecánica',
                          style:
                              TextStyle(fontSize: 14, color: Colors.sunset[50]),
                        ),
                        const SizedBox(
                          height: UILayout.small,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: UILayout.large,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: UILayout.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: UILayout.medium,
                    ),
                    child: Column(
                      children: <Widget>[
                        SunsetButton(
                          text: 'Agendar monitoría'.tr,
                          backgroundColor: Colors.jelly[40],
                        ),
                      ],
                    ),
                  ),
                  Spacing.spacingV12,
                  Text(
                    'reviews',
                    style: TextStyle(
                      color: Colors.gray[90],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacing.spacingV12,
                  Center(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/pana.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                        Spacing.spacingV12,
                        Text(
                          'No hay reviews aún'.tr,
                          style: TextStyle(
                            color: Colors.gray[90],
                            fontSize: UILayout.medium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '''Aún no hay ninguna review, pero, puedes dar monitorías para que veas tus reviews y tus estadisticas''',
                          style: TextStyle(color: Colors.gray[70]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}