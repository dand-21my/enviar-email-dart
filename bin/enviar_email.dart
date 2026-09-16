import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import '../lib/config.dart';

Future<void> main() async {
  final smtpServer = gmail(emailRemetente, senhaApp);

  final message = Message()
    ..from = Address(emailRemetente, 'dandara')
    ..recipients.add('dandara.vic.flower@gmail.com')
    ..subject = 'Teste de envio de email do dart'
    ..text = 'Este é um email teste para PDMII.'
    ..html = '<h1>Teste</h1><p>Email teste atividade PDMII.</p>';

  try {
    final sendReport = await send(message, smtpServer);
    print('Email enviado com sucesso: $sendReport');
  } on MailerException catch (e) {
    print('Erro ao enviar email: $e');
    for (var p in e.problems) {
      print('Problema: ${p.code}: ${p.msg}');
    }
  }
}