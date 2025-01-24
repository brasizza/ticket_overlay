# Biblioteca Ticket Overlay

[Read in English](README-en.md)

Uma biblioteca Flutter para criar animações de ticket saindo de um aparelho POS, oferecendo uma integração fácil com sua aplicação. Baseada em `OverlayEntry`, permite exibir widgets personalizados com efeitos animados.

## Recursos

- **Shimmer Receipt Placeholder**: Um widget padrão com efeito shimmer para simular um recibo.
- **Animação de Overlay**: API simples para exibir e animar widgets sobrepostos.
- **Personalização**: Configure o alinhamento, duração e posição inicial da animação.

## Instalação

Adicione a biblioteca ao seu projeto incluindo-a no arquivo `pubspec.yaml`:

```yaml
dependencies:
  ticket_overlay: ^latest_version
```

Substitua `latest_version` pela versão mais recente disponível no [pub.dev](https://pub.dev/packages/ticket_overlay).

Execute o comando abaixo para baixar a dependência:

```bash
flutter pub get
```

## Uso

### Exibindo uma Animação de Ticket

Para exibir um widget como uma animação de ticket:

```dart
import 'package:ticket_overlay/ticket_overlay.dart';

TicketAnimation.show(
  context: context,
  duration: const Duration(seconds: 3),
  alignment: Alignment.center,
  startAt: 0.5,
  child: SeuWidgetPersonalizado(),
);
```

### Placeholder Padrão

Use o widget padrão de efeito shimmer para recibos:

```dart
Widget placeholderPadrao = TicketAnimation.ticketDefault;
```

## Referência da API

### `TicketAnimation.show`

Exibe um widget personalizado como um ticket animado.

#### Parâmetros:

- `context` (obrigatório): O `BuildContext` onde o overlay será inserido.
- `duration` (obrigatório): Duração da animação.
- `child` (obrigatório): O widget a ser exibido no overlay.
- `alignment` (opcional): Alinhamento do widget no overlay. O padrão é `Alignment.center`.
- `startAt` (opcional): Posição vertical inicial (como fração da altura da tela). O padrão é `0.5`.

### `TicketAnimation.ticketDefault`

Fornece um widget padrão com efeito shimmer para recibos.

## Licença

Este projeto é licenciado sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.
