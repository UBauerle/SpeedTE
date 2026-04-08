program SpeedTE;

uses
  Vcl.Forms,
  SysUtils,
  Dialogs,
  STEPrincipal in 'STEPrincipal.pas' {FSTEPrincipal},
  uGenericas in '..\UsoGeral\uGenericas.pas' {FGen},
  STEProdutos in 'STEProdutos.pas' {FSTEProdutos},
  STEClientes in 'STEClientes.pas' {FSTEClientes},
  STEImpressao in 'STEImpressao.pas' {FSTEImpressao},
  FortesReportCtle in '..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  uSysPrinters in '..\UsoGeral\uSysPrinters.pas' {FuSysPrinters},
  STEConsTurno in 'STEConsTurno.pas' {FSTEConsTurno},
  STEConsCliente in 'STEConsCliente.pas' {FSTEConsCliente},
  STEConfigurar in 'STEConfigurar.pas' {FSTEConfigurar},
  uProcessos in '..\UsoGeral\uProcessos.pas',
  STECancelaReativa in 'STECancelaReativa.pas' {FSTECancelaReativa},
  uEdicaoTexto in '..\UsoGeral\uEdicaoTexto.pas' {FuEdicaoTexto},
  STELctoPedido in 'STELctoPedido.pas' {FSTELctoPedido},
  uVersaoPgm in '..\UsoGeral\uVersaoPgm.pas';

var
  wExePath,wExeName: String;

{$R *.res}

begin
  wExePath := ExtractFilePath(Application.ExeName);
  wExeName := ExtractFileName(Application.ExeName);
  if ProcessoAtivo(wExeName) then
  begin
    MessageDlg('Aplicação [' + wExeName + '] já está ativa' + #13#13 +
               'Não é possível criar nova instância !',
                mtError,[mbOk],0,mbOk,['Finalizar']);
    Halt(0);
  end;
  //
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFSTEPrincipal, FSTEPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFSTEProdutos, FSTEProdutos);
  Application.CreateForm(TFSTEClientes, FSTEClientes);
  Application.CreateForm(TFSTEImpressao, FSTEImpressao);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFuSysPrinters, FuSysPrinters);
  Application.CreateForm(TFSTEConsTurno, FSTEConsTurno);
  Application.CreateForm(TFSTEConsCliente, FSTEConsCliente);
  Application.CreateForm(TFSTEConfigurar, FSTEConfigurar);
  Application.CreateForm(TFSTECancelaReativa, FSTECancelaReativa);
  Application.CreateForm(TFuEdicaoTexto, FuEdicaoTexto);
  Application.CreateForm(TFSTELctoPedido, FSTELctoPedido);
  Application.Run;

end.
