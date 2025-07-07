program SpeedTE;

uses
  Vcl.Forms,
  STEPrincipal in 'STEPrincipal.pas' {FSTEPrincipal},
  uGenericas in '..\UsoGeral\uGenericas.pas' {FGen},
  STEProdutos in 'STEProdutos.pas' {FSTEProdutos},
  STEClientes in 'STEClientes.pas' {FSTEClientes},
  STEImpressao in 'STEImpressao.pas' {FSTEImpressao},
  FortesReportCtle in '..\uFortesReport\FortesReportCtle.pas' {FFRCtle},
  uSysPrinters in '..\UsoGeral\uSysPrinters.pas' {FuSysPrinters},
  STEConsTurno in 'STEConsTurno.pas' {FSTEConsTurno};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFSTEPrincipal, FSTEPrincipal);
  Application.CreateForm(TFGen, FGen);
  Application.CreateForm(TFSTEProdutos, FSTEProdutos);
  Application.CreateForm(TFSTEClientes, FSTEClientes);
  Application.CreateForm(TFSTEImpressao, FSTEImpressao);
  Application.CreateForm(TFFRCtle, FFRCtle);
  Application.CreateForm(TFuSysPrinters, FuSysPrinters);
  Application.CreateForm(TFSTEConsTurno, FSTEConsTurno);
  Application.Run;

end.
