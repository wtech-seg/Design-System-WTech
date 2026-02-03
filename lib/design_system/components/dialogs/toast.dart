import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wtech_design_system/design_system/design_system.dart';

/// Tipos de toast disponíveis no sistema
enum WtechToastType { info, warning, error, success, }

/// Configuração visual para cada tipo de toast
class _WtechToastConfig {
  final Color backgroundColor;
  final Color highlitghtColor;
  final String iconPath;

  const _WtechToastConfig({
    required this.backgroundColor,
    required this.highlitghtColor,
    required this.iconPath,
  });

  /// Obtém configuração visual baseada no tipo
  factory _WtechToastConfig.fromType(WtechToastType type) {
    switch(type) {
      case WtechToastType.success:
        return _WtechToastConfig(
          backgroundColor: WtechColors.backgroundSuccess,
          highlitghtColor: WtechColors.highlightSuccess,
          iconPath: 'assets/svgs/toasts/icon_toast_success.svg',
        );
      case WtechToastType.error:
        return _WtechToastConfig(
          backgroundColor: WtechColors.backgroundError,
          highlitghtColor: WtechColors.highlightError,
          iconPath: 'assets/svgs/toasts/icon_toast_error.svg',
        );
      case WtechToastType.warning:
        return _WtechToastConfig(
          backgroundColor: WtechColors.backgroundWarning,
          highlitghtColor: WtechColors.highlightWarning,
          iconPath: 'assets/svgs/toasts/icon_toast_warning.svg',
        );
      case WtechToastType.info:
        return _WtechToastConfig(
          backgroundColor: WtechColors.backgroundInfo,
          highlitghtColor: WtechColors.highlightInfo,
          iconPath: 'assets/svgs/toasts/icon_toast_info.svg',
        );
    }
  }
}

/// Gerenciador singleton para controlar toasts ativos
class _WtechToastManager {
  static OverlayEntry? _currentEntry;
  static _WtechToastWidgetState? _currentState;

  /// Remove o toast atual com animação de saída
  static Future<void> dismiss() async {
    if (_currentState != null && _currentEntry != null) {
      await _currentState!._animateOut();
      _currentEntry?.remove();
      _currentEntry = null;
      _currentState = null;
    }
  }

  /// Define o novo toast ativo
  static void setCurrent(OverlayEntry entry, _WtechToastWidgetState state) {
    _currentEntry = entry;
    _currentState = state;
  }

  /// Limpa referências quando o toast é removido
  static void clear(OverlayEntry entry) {
    if (_currentEntry == entry) {
      _currentEntry = null;
      _currentState = null;
    }
  }
}

/// Exibe um toast na parte inferior central da tela
///
/// [context] - BuildContext para acessar o Overlay
/// [message] - Mensagem a ser exibida (suporta **negrito**)
/// [type] - Tipo do toast (success, error, warning, info)
///
/// Exemplo:
/// ```dart
/// showWtechToast(
///   context,
///   message: "Face enviada com **sucesso** ao dispositivo",
///   type: WtechToastType.success,
/// );
/// ```
Future<void> showWtechToast(
    BuildContext context, {
      required String message,
      required WtechToastType type,
    }) async {
  // Captura overlay antes do await para evitar uso de context após async gap
  final overlay = Overlay.of(context);

  // Dispensa toast existente com animação
  await _WtechToastManager.dismiss();

  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => _WtechToastWidget(
      message: message,
      type: type,
      onDismiss: () {
        entry.remove();
        _WtechToastManager.clear(entry);
      },
      onStateCreated: (state) {
        _WtechToastManager.setCurrent(entry, state);
      },
    ),
  );

  overlay.insert(entry);
}

/// Widget interno do toast com animação
class _WtechToastWidget extends StatefulWidget {
  final String message;
  final WtechToastType type;
  final VoidCallback onDismiss;
  final void Function(_WtechToastWidgetState state) onStateCreated;

  const _WtechToastWidget({
    required this.message,
    required this.type,
    required this.onDismiss,
    required this.onStateCreated,
  });

  @override
  State<_WtechToastWidget> createState() => _WtechToastWidgetState();
}

class _WtechToastWidgetState extends State<_WtechToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _isAnimatingOut = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    // Registra estado no manager
    widget.onStateCreated(this);

    // Inicia animação de entrada
    _controller.forward();
  }

  /// Executa animação de saída e retorna quando completar
  Future<void> _animateOut() async {
    if (_isAnimatingOut) return;
    _isAnimatingOut = true;
    await _controller.reverse();
  }

  /// Dispensa o toast com animação
  Future<void> _dismiss() async {
    if (_isAnimatingOut) return;
    await _animateOut();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Converte texto com marcadores **negrito** para TextSpan
  List<TextSpan> _parseBoldText(String message, Color textColor, Color highlightColor) {
    final List<TextSpan> spans = [];
    final RegExp boldPattern = RegExp(r'\*\*(.*?)\*\*');

    final textStyle = TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: 'Lao Muang Don',
    );
    final textStyleBold = TextStyle(
      color: highlightColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lao Muang Don',
    );

    int lastEnd = 0;

    for (final match in boldPattern.allMatches(message)) {
      // Texto antes do negrito
      if (match.start > lastEnd) {
        spans.add(TextSpan(
          text: message.substring(lastEnd, match.start),
          style: textStyle,
        ));
      }

      // Texto em negrito
      spans.add(TextSpan(
        text: match.group(1),
        style: textStyleBold,
      ));

      lastEnd = match.end;
    }

    // Texto restante após o último negrito
    if (lastEnd < message.length) {
      spans.add(TextSpan(
        text: message.substring(lastEnd),
        style: textStyle,
      ));
    }

    // Se não houver marcadores, retorna texto normal
    if (spans.isEmpty) {
      spans.add(TextSpan(
        text: message,
        style: textStyle,
      ));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    final config = _WtechToastConfig.fromType(widget.type);

    return GestureDetector(
      // Tap fora do toast para dispensar
      onTap: _dismiss,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SlideTransition(
              position: _slideAnimation,
              child: GestureDetector(
                // Absorve taps no toast para não dispensar
                onTap: () {},
                child: _buildToastContent(config),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToastContent(_WtechToastConfig config) {
    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 600,
          minWidth: 200,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: config.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ícone à esquerda
            SvgPicture.asset(
              config.iconPath,
              width:  18,
              height: 18,
              package: 'wtech_design_system',
            ),
            const SizedBox(width: 10),

            // Texto com suporte a negrito
            Flexible(
              child: RichText(
                text: TextSpan(
                  children: _parseBoldText(widget.message, Colors.black, config.highlitghtColor),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Botão X para fechar
            Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: _dismiss,
                hoverColor: Colors.black.withValues(alpha: 0.1),
                splashColor: Colors.black.withValues(alpha: 0.2),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}