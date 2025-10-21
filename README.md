

# Design System - wTech Desenvolvimentos

Um **Design System em Flutter** desenvolvido para padronizar e acelerar o desenvolvimento de interfaces, oferecendo componentes reutilizáveis, consistentes e fáceis de manter.

---

## 🚀 Visão Geral

O **WTech Design System** centraliza estilos, temas e componentes visuais utilizados em aplicações Flutter, permitindo criar interfaces modernas e coerentes com menos código repetitivo.

A biblioteca inclui:
- Botões e campos customizados
- Dialogs e modais padronizados
- Snackbars e barras de navegação
- Sistema de temas e cores
- Tipografia e estilos de texto consistentes

---

## 📁 Estrutura do Projeto

```
lib/
├── main.dart
├── design_system/
│   ├── design_system.dart
│   ├── components/
│   │   ├── wtech_button.dart
│   │   ├── wtech_mobile_button.dart
│   │   ├── navigation_drawer.dart
│   │   ├── password_field.dart
│   │   ├── body_card.dart
│   │   ├── body_card_enterprise.dart
│   │   ├── wtech_snackbar.dart
│   │   ├── blocking_modal.dart
│   │   ├── inner_shadow.dart
│   │   ├── wtech_icon.dart
│   │   ├── wtech_appbar.dart
│   │   └── dialogs/
│   │       ├── wtech_dialogs.dart
│   │       ├── wtech_change_password_dialog.dart
│   │       ├── wtech_confirm_dialog.dart
│   │       ├── wtech_dialog_base.dart
│   │       └── wtech_loading_dialog.dart
│   ├── theme/
│   │   ├── wtech_theme.dart
│   │   ├── wtech_colors.dart
│   │   └── wtech_text_styles.dart

````

---

## ⚙️ Instalação

Adicione o pacote no seu `pubspec.yaml`:

```yaml
dependencies:
  wtech_design_system:
    git:
      url: https://github.com/seu-usuario/wtech_design_system.git
````

Em seguida, rode:

```bash
flutter pub get
```

---

## 🧱 Como Usar

Importe o design system no seu arquivo principal:

```dart
import 'package:wtech_design_system/design_system.dart';
```

Agora você pode utilizar os componentes prontos:

```dart
WTechButton(
  label: "Entrar",
  onPressed: () => print("Login clicado!"),
);
```

Ou aplicar o tema global:

```dart
MaterialApp(
  theme: WTechTheme.light,
  darkTheme: WTechTheme.dark,
  home: HomePage(),
);
```

---

## 🧩 Exemplos de Componentes

### Botão

```dart
WTechButton(
  label: 'Salvar',
  onPressed: () {},
  type: ButtonType.primary,
);
```

### Snackbar

```dart
WTechSnackbar.show(
  context,
  message: 'Operação realizada com sucesso!',
  type: SnackbarType.success,
);
```

### Dialog de Confirmação

```dart
WTechDialogs.confirm(
  context,
  title: 'Excluir item?',
  message: 'Essa ação não poderá ser desfeita.',
  onConfirm: () => print('Confirmado!'),
);
```

---

## 🎨 Personalização de Tema

O design system utiliza uma camada de temas centralizada:

* **Cores:** `wtech_colors.dart`
* **Tipografia:** `wtech_text_styles.dart`
* **Tema global:** `wtech_theme.dart`

Exemplo:

```dart
final theme = WTechTheme.light.copyWith(
  colorScheme: WTechColors.customPrimary,
);
```
---

### 👩‍💻 Autora

Desenvolvido por **Ana Carolina Nesso Guedes**
```Desenvolvedora Flutter Mid, UI/UX```
