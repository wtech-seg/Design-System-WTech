import 'package:flutter/material.dart';

class NavigationDrawerWtech extends StatefulWidget {
  const NavigationDrawerWtech({super.key});

  @override
  NavigationDrawerWtechState createState() => NavigationDrawerWtechState();
}

class NavigationDrawerWtechState extends State<NavigationDrawerWtech> {
  String? _expandedSection;
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_isCollapsed) {
              setState(() {
                _isCollapsed = false;
              });
            }
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _isCollapsed ? 100 : 300,
            color: Color(0xFF001727),
            child: Drawer(
              backgroundColor: Color(0xFF001727),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'lib/design_system/assets/pngs/dark_w.png',
                      width: 120,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: _isCollapsed
                          ? _buildCollapsedIcons()
                          : _buildExpandedDrawer(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 3,
                      color: Color(0xFF18273C),
                    ),
                  ),
                  SizedBox(height: 10),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Saindo...')),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!_isCollapsed) ...[
                              Text(
                                'Sair',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(width: 10),
                            ],
                            Icon(Icons.logout, color: Color(0xFFD01B02)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 120,
          width: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/design_system/assets/pngs/menu.png'),
              fit: BoxFit.scaleDown,
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 30, 
                height: 35,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: AnimatedRotation(
                    duration: Duration(milliseconds: 300),
                    turns: _isCollapsed ? 0.5 : 0,
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCollapsedIcons() {
    return [
      _buildCollapsedIcon(Icons.notifications_none),
      _buildCollapsedIcon(Icons.people_outline_outlined),
      _buildCollapsedIcon(Icons.drive_eta_outlined),
      _buildCollapsedIcon(Icons.search_outlined),
      _buildCollapsedIcon(Icons.build_outlined),
      _buildCollapsedIcon(Icons.security_outlined),
    ];
  }

  List<Widget> _buildExpandedDrawer() {
    return [
      _buildExpansionTile('Recepção', [
        _buildDrawerItem(context, 'Recepção Facial'),
        _buildDrawerItem(context, 'Visitantes QR-Code'),
        _buildDrawerItem(context, 'Manutenção QR-Code'),
      ]),
      _buildExpansionTile('Gerenciamento de Pessoas', [
        _buildDrawerItem(context, 'Cadastrar Pessoa'),
        _buildDrawerItem(context, 'Cadastrar Unidades'),
      ]),
      _buildExpansionTile('Gerenciamento de Veículos', [
        _buildDrawerItem(context, 'Cadastramento de veículos'),
      ]),
      _buildExpansionTile('Consultas', [
        _buildDrawerItem(context, 'Movimentação'),
      ]),
      _buildExpansionTile('Ferramentas', [
        _buildDrawerItem(context, 'Dispositivos'),
      ]),
      _buildExpansionTile('Segurança', [
        _buildDrawerItem(context, 'Usuários'),
      ]),
    ];
  }

  Widget _buildCollapsedIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container( // Contenedor externo sin fondo, solo limita el ancho
        width: 59,
        alignment: Alignment.center, // Centra el contenido dentro del contenedor externo
        child: Container( // Contenedor interno con fondo y sombra
          width: 59,
          height: 59,
          decoration: BoxDecoration(
            color: Color(0xFF001727),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 0.3),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
            borderRadius: BorderRadius.circular(15),
          ),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  Color(0xFF12304A),
                  Color(0xFF1F4A68),
                  Color(0xFF2B637F),
                  Color(0xFF397999),
                  Color(0xFF4A8BB0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Icon(icon, color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }



  Widget _buildExpansionTile(String title, List<Widget> children) {
    bool isExpanded = _expandedSection == title;

    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStyle(color: Colors.white, fontSize: 20)),
          leading: AnimatedRotation(
            duration: Duration(milliseconds: 300),
            turns: isExpanded ? 0.25 : 0,
            child: isExpanded
                ? Icon(Icons.chevron_right, color: Colors.white, size: 30)
                : ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        colors: [
                          Color(0xFF12304A),
                          Color(0xFF1F4A68),
                          Color(0xFF2B637F),
                          Color(0xFF397999),
                          Color(0xFF4A8BB0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds);
                    },
                    child: Icon(Icons.chevron_right, color: Colors.white, size: 25),
                  ),
          ),
          onTap: () {
            setState(() {
              _expandedSection = isExpanded ? null : title;
            });
          },
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: isExpanded
              ? Column(children: children)
              : SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: ListTile(
        title: Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
        onTap: () {
          _showAlert(context, title);
        },
      ),
    );
  }

  void _showAlert(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1F4A68),
          title: Text(
            'Click',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Fechar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
