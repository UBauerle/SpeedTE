unit STEConfigurar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons;
  Procedure ConfigSistema;
  Procedure Configuracao;

type
  TFSTEConfigurar = class(TForm)
    pgControle: TPageControl;
    TSUsuario: TTabSheet;
    TSConfiguracao: TTabSheet;
    TSPedido: TTabSheet;
    TSDados: TTabSheet;
    PanUsuario: TPanel;
    Label1: TLabel;
    edUsuario: TEdit;
    Label2: TLabel;
    edLograd: TEdit;
    Label3: TLabel;
    edNro: TEdit;
    edCompl: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    edCidade: TEdit;
    edBairro: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    edUF: TEdit;
    edFone: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edWhats: TEdit;
    Panel1: TPanel;
    PanConfig: TPanel;
    cbTelas: TCheckBox;
    edPathTelas: TEdit;
    Label14: TLabel;
    edLogoIni: TEdit;
    Label15: TLabel;
    edLogoPrint: TEdit;
    cbMeses: TComboBox;
    Label18: TLabel;
    cbConsPed: TCheckBox;
    cbPgto: TComboBox;
    Label17: TLabel;
    cbPixel: TComboBox;
    Label16: TLabel;
    cbIniNoite: TComboBox;
    Label13: TLabel;
    cbPrItem: TCheckBox;
    cbCPF: TCheckBox;
    cbEntrega: TCheckBox;
    cbValida: TCheckBox;
    Label12: TLabel;
    PanPedidos: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    cbPrev: TCheckBox;
    cbDialog: TCheckBox;
    cbPrCons: TCheckBox;
    cbIntern: TCheckBox;
    edPrinter: TEdit;
    edTamMax: TEdit;
    edMEsq: TEdit;
    edMDir: TEdit;
    edMTop: TEdit;
    edMRod: TEdit;
    edExtra: TEdit;
    edCopias: TEdit;
    edInterno: TEdit;
    edCopIntern: TEdit;
    edIntervalo: TEdit;
    PanDados: TPanel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    cbCarga: TCheckBox;
    edPathDados: TEdit;
    edArqClie: TEdit;
    edArqOld: TEdit;
    edArqProd: TEdit;
    cbInic: TComboBox;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    gbCtle: TGroupBox;
    Label10: TLabel;
    edChave: TEdit;
    Label11: TLabel;
    cbDias: TComboBox;
    cbDesenv: TCheckBox;
    Label35: TLabel;
    edTxtIncluir: TEdit;
    GroupBox1: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    cbLOPedido: TComboBox;
    cbLOInterno: TComboBox;
    cbAltFixaPed: TCheckBox;
    cbAltFixaInt: TCheckBox;
    cbVlrUnit: TCheckBox;
    cbLctSV: TCheckBox;
    cbExCarga: TCheckBox;
    Label39: TLabel;
    cbDataHora: TComboBox;
    cbImpTN: TCheckBox;
    Label40: TLabel;
    edImgCancel: TEdit;
    Label41: TLabel;
    edImgNormal: TEdit;
    cbSolCPF: TCheckBox;
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbCtleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEConfigurar: TFSTEConfigurar;
  wIniFile: TIniFile;
  sysIniFile: String;
  Hr,Mi,Se,Ms: Word;
  lGravar: Boolean;

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas;

Procedure ConfigSistema;
begin
  sysIniFile := ChangeFileExt(ParamStr(0), '.ini');
  wIniFile := TIniFile.Create(sysIniFile);
  with FSTEConfigurar do
  begin
    edUsuario.Text  := wIniFile.ReadString('Usuario', 'Usuario',     'Lanches & Lanches');
    edLograd.Text   := wIniFile.ReadString('Usuario', 'Logradouro',  'R.Exemplo');
    edNro.Text      := wIniFile.ReadString('Usuario', 'Numero',      '1234');
    edCompl.Text    := wIniFile.ReadString('Usuario', 'Complemento', 'Cjto 1');
    edBairro.Text   := wIniFile.ReadString('Usuario', 'Bairro',      'Centro');
    edCidade.Text   := wIniFile.ReadString('Usuario', 'Cidade',      'Nome da cidade');
    edUF.Text       := wIniFile.ReadString('Usuario', 'UF',          'RS');
    edFone.Text     := wIniFile.ReadString('Usuario', 'Fone',        '(xx)99234-5678');
    edWhats.Text    := wIniFile.ReadString('Usuario', 'Whats',       '(xx)9234-5678');
    //
    cbTelas.Checked  := wIniFile.ReadBool   ('Config', 'SalvaTelas',      False);
    edPathTelas.Text := wIniFile.ReadString ('Config', 'PathSalvaTelas',  'C:\NAO_EXISTE_MESMO');
    edLogoIni.Text   := wIniFile.ReadString ('Config', 'LogoInicial',     '');
    edLogoPrint.Text := wIniFile.ReadString ('Config', 'LogoImpressao',   '');
    edImgCancel.Text := wIniFile.ReadString ('Config', 'ImgCancelado',    '');
    edImgNormal.Text := wIniFile.ReadString ('Config', 'ImgNormal',       '');
    cbIniNoite.Text  := wIniFile.ReadString ('Config', 'HrInicioNoite',   '17');
    cbPixel.Text     := wIniFile.ReadString ('Config', 'PixelHorizontal', '4');
    cbPgto.ItemIndex := wIniFile.ReadInteger('Config', 'MeioPagtoPadrao', 1);
    cbConsPed.Checked := wIniFile.ReadBool  ('Config', 'ConsultaPedidos', True);
    cbMeses.Text     := wIniFile.ReadString ('Config', 'MesesConsulta',   '12');
    edTxtIncluir.Text := wIniFile.ReadString('Config', 'TextoIncluir',    'Incluir lançamento?');
    cbLctSV.Checked  := wIniFile.ReadBool   ('Config', 'LctoSemValor',    False);
    cbExCarga.Checked := wIniFile.ReadBool  ('Config', 'ExibeCarga',      False);
    cbSolCPF.Checked := wIniFile.ReadBool   ('Config', 'SolicitaCPF',     False);
    cbPrItem.Checked := wIniFile.ReadBool   ('Config', 'PrimeiroItem',    False);
    cbCPF.Checked    := wIniFile.ReadBool   ('Config', 'CPFCliente',      False);
    cbEntrega.Checked := wIniFile.ReadBool  ('Config', 'Entrega',         False);
    cbValida.Checked := wIniFile.ReadBool   ('Config', 'ValidaEntrega',   False);
    edChave.Text     := wIniFile.ReadString ('Config', 'ChaveUsuario',    'Aa');
    cbDias.Text      := wIniFile.ReadString ('Config', 'CheckDias',       '15');
    cbDesenv.Checked := wIniFile.ReadBool   ('Config', 'Desenv',          False);
    //
    edPrinter.Text   := wIniFile.ReadString('Pedidos', 'Impressora',      'Elgin');
    edTamMax.Text    := wIniFile.ReadString('Pedidos', 'TamanhoMax',      '300');
    edMEsq.Text      := wIniFile.ReadString('Pedidos', 'MargEsquerda',    '8');
    edMDir.Text      := wIniFile.ReadString('Pedidos', 'MargDireita',     '7');
    edMTop.Text      := wIniFile.ReadString('Pedidos', 'MargTopo',        '5');
    edMRod.Text      := wIniFile.ReadString('Pedidos', 'MargRodape',      '5');
    edCopias.Text    := wIniFile.ReadString('Pedidos', 'Copias',          '1');
    cbPrev.Checked   := wIniFile.ReadBool  ('Pedidos', 'Preview',         False);
    cbDialog.Checked := wIniFile.ReadBool  ('Pedidos', 'Dialogo',         False);
    edExtra.Text     := wIniFile.ReadString('Pedidos', 'AlturaExtra',     '64');
    cbPrCons.Checked := wIniFile.ReadBool  ('Pedidos', 'PreviewConsulta', False);
    cbIntern.Checked := wIniFile.ReadBool  ('Pedidos', 'ImprimeInterno',  True);
    edInterno.Text   := wIniFile.ReadString('Pedidos', 'IdInterno',       'Cozinha');
    edCopIntern.Text := wIniFile.ReadString('Pedidos', 'CopiasInterno',   '1');
    edIntervalo.Text := wIniFile.ReadString('Pedidos', 'Intervalo',       '2');
    cbLOPedido.ItemIndex  := wIniFile.ReadInteger('Pedidos', 'LayOutPedido',  0);     // 0-Topo  <>0-Rodape
    cbLOInterno.ItemIndex := wIniFile.ReadInteger('Pedidos', 'LayOutInterno', 0);     // 0-Topo  <>0-Rodape
    cbAltFixaPed.Checked  := wIniFile.ReadBool   ('Pedidos', 'AlturaFixaPed', True);
    cbAltFixaInt.Checked  := wIniFile.ReadBool   ('Pedidos', 'AlturaFixaInt', True);
    cbVlrUnit.Checked     := wIniFile.ReadBool   ('Pedidos', 'ImprimeVlrUnitario', True);
    cbDataHora.ItemIndex  := wIniFile.ReadInteger('Pedidos', 'FormatoDataHora', 0);   // 0-DD/MM/AAAA hr:Mi  1-DD/MM/AA hr:mi
    cbImpTN.Checked       := wIniFile.ReadBool   ('Pedidos', 'ImprimeTurnoNro', True);
    //
    edPathDados.Text := wIniFile.ReadString ('Dados',  'PathDados',      'C:\SpeedTE\Dados');
    edArqClie.Text   := wIniFile.ReadString ('Dados',  'Clientes',       'Clientes.DAT');
    edArqOld.Text    := wIniFile.ReadString ('Dados',  'OldClientes',    'OldClientes.DAT');
    edArqProd.Text   := wIniFile.ReadString ('Dados',  'Produtos',       'Produtos.DAT');
    cbCarga.Checked  := wIniFile.ReadBool   ('Dados',  'CargaXML',       False);
    cbInic.ItemIndex := wIniFile.ReadInteger('Dados',  'OrdemPesquisa',  2);
    //
    wIniFile.Free;
  end;

  lGravar := False;
  FSTEConfigurar.ShowModal;
  if not lGravar then
    Exit;

  wIniFile := TIniFile.Create(sysIniFile);
  with FSTEConfigurar do
  begin
    wIniFile.WriteString('Usuario', 'Usuario',        edUsuario.Text);
    wIniFile.WriteString('Usuario', 'Logradouro',     edLograd.Text);
    wIniFile.WriteString('Usuario', 'Numero',         edNro.Text);
    wIniFile.WriteString('Usuario', 'Complemento',    edCompl.Text);
    wIniFile.WriteString('Usuario', 'Bairro',         edBairro.Text);
    wIniFile.WriteString('Usuario', 'Cidade',         edCidade.Text);
    wIniFile.WriteString('Usuario', 'UF',             edUF.Text);
    wIniFile.WriteString('Usuario', 'Fone',           edFone.Text);
    wIniFile.WriteString('Usuario', 'Whats',          edWhats.Text);
    //
    wIniFile.WriteString ('Config', 'ChaveUsuario',   edChave.Text);
    wIniFile.WriteInteger('Config', 'CheckDias',      StrToIntDef(cbDias.Text,15));
    wIniFile.WriteBool   ('Config', 'SalvaTelas',     cbTelas.Checked);
    wIniFile.WriteString ('Config', 'PathSalvaTelas', edPathTelas.Text);
    wIniFile.WriteInteger('Config', 'HrInicioNoite',  StrToIntDef(cbIniNoite.Text,17));
    wIniFile.WriteString ('Config', 'LogoInicial',    edLogoIni.Text);
    wIniFile.WriteString ('Config', 'LogoImpressao',  edLogoPrint.Text);
    wIniFile.WriteString ('Config', 'ImgCancelado',   edImgCancel.Text);
    wIniFile.WriteString ('Config', 'ImgNormal',      edImgNormal.Text);
    wIniFile.WriteBool   ('Config', 'Desenv',         cbDesenv.Checked);
    wIniFile.WriteInteger('Config', 'PixelHorizontal',StrToIntDef(cbPixel.Text,4));
    wIniFile.WriteBool   ('Config', 'PrimeiroItem',   cbPrItem.Checked);
    wIniFile.WriteInteger('Config', 'MeioPagtoPadrao',cbPgto.ItemIndex);
    wIniFile.WriteBool   ('Config', 'ConsultaPedidos',cbConsPed.Checked);
    wIniFile.WriteInteger('Config', 'MesesConsulta',  StrToIntDef(cbMeses.Text,12));
    wIniFile.WriteString ('Config', 'TextoIncluir',   edTxtIncluir.Text);
    wIniFile.WriteBool   ('Config', 'LctoSemValor',   cbLctSV.Checked);
    wIniFile.WriteBool   ('Config', 'ExibeCarga',     cbExCarga.Checked);
    wIniFile.WriteBool   ('Config', 'SolicitaCPF',    cbSolCPF.Checked);
    wIniFile.WriteBool   ('Config', 'CPFCliente',     cbCPF.Checked);
    wIniFile.WriteBool   ('Config', 'Entrega',        cbEntrega.Checked);
    wIniFile.WriteBool   ('Config', 'ValidaEntrega',  cbValida.Checked);
    //
    wIniFile.WriteString ('Pedidos','Impressora',     edPrinter.Text);
    wIniFile.writeInteger('Pedidos','TamanhoMax',     StrToIntDef(edTamMax.text,300));
    wIniFile.WriteInteger('Pedidos','MargEsquerda',   StrToIntDef(edMEsq.Text,8));
    wIniFile.WriteInteger('Pedidos','MargDireita',    StrToIntDef(edMDir.Text,7));
    wIniFile.WriteInteger('Pedidos','MargTopo',       StrToIntDef(edMTop.Text,5));
    wIniFile.WriteInteger('Pedidos','MargRodape',     StrToIntDef(edMRod.Text,5));
    wIniFile.WriteInteger('Pedidos','Copias',         StrToIntDef(edCopias.Text,1));
    wIniFile.WriteBool   ('Pedidos','Preview',        cbPrev.Checked);
    wIniFile.WriteBool   ('Pedidos','Dialogo',        cbDialog.Checked);
    wIniFile.WriteInteger('Pedidos','AlturaExtra',    StrToIntDef(edExtra.Text,64));
    wIniFile.WriteBool   ('Pedidos','PreviewConsulta',cbPrCons.Checked);
    wIniFile.WriteBool   ('Pedidos','ImprimeInterno', cbIntern.Checked);
    wIniFile.WriteString ('Pedidos','IdInterno',      edInterno.Text);
    wIniFile.WriteInteger('Pedidos','CopiasInterno',  StrToIntDef(edCopIntern.Text,1));
    wIniFile.WriteInteger('Pedidos','Intervalo',      StrToIntDef(edIntervalo.Text,2));
    wIniFile.WriteInteger('Pedidos','LayOutPedido',   cbLOPedido.ItemIndex);
    wIniFile.WriteInteger('Pedidos', 'LayOutInterno', cbLOInterno.ItemIndex);
    wIniFile.WriteBool   ('Pedidos', 'AlturaFixaPed', cbAltFixaPed.Checked);
    wIniFile.WriteBool   ('Pedidos', 'AlturaFixaInt', cbAltFixaInt.Checked);
    wIniFile.WriteBool   ('Pedidos', 'ImprimeVlrUnitario', cbVlrUnit.Checked);
    wIniFile.WriteInteger('Pedidos', 'FormatoDataHora', cbDataHora.ItemIndex);
    wIniFile.WriteBool   ('Pedidos', 'ImprimeTurnoNro', cbImpTN.Checked);
    //
    wIniFile.WriteString ('Dados', 'PathDados',       edPathDados.Text);
    wIniFile.WriteString ('Dados', 'Clientes',        edArqClie.Text);
    wIniFile.WriteString ('Dados', 'OldClientes',     edArqOld.Text);
    wIniFile.WriteString ('Dados', 'Produtos',        edArqProd.Text);
    wIniFile.WriteBool   ('Dados', 'CargaXML',        cbCarga.Checked);
    wIniFile.WriteInteger('Dados', 'OrdemPesquisa',   cbInic.ItemIndex);
  end;

end;


Procedure Configuracao;
begin
  sysIniFile := ChangeFileExt(ParamStr(0), '.ini');
  FSTEPrincipal.dtAtual := DataString(Date,6);

  if not FileExists(sysIniFile) then
    ConfigSistema;

  with FSTEPrincipal do
  begin
    wIniFile := TIniFile.Create(sysIniFile);

    idUsuario := wIniFile.ReadString('Usuario', 'Usuario',     'Lanches & Lanches');
    idLograd  := wIniFile.ReadString('Usuario', 'Logradouro',  'R.Exemplo');
    idNro     := wIniFile.ReadString('Usuario', 'Numero',      '1234');
    idCompl   := wIniFile.ReadString('Usuario', 'Complemento', 'Cjto 1');
    idBairro  := wIniFile.ReadString('Usuario', 'Bairro',      'Centro');
    idCidade  := wIniFile.ReadString('Usuario', 'Cidade',      'Nome da cidade');
    idUF      := wIniFile.ReadString('Usuario', 'UF',          'RS');
    idFone    := wIniFile.ReadString('Usuario', 'Fone',        '(xx)99234-5678');
    idWhats   := wIniFile.ReadString('Usuario', 'Whats',       '(xx)9234-5678');

    keyUsuar      := wIniFile.ReadString ('Config', 'ChaveUsuario',   'Aa');
    ddCheck       := wIniFile.ReadInteger('Config', 'CheckDias',      15);
    lSalvaForm    := wIniFile.ReadBool   ('Config', 'SalvaTelas',     False);
    pathSalvaForm := wIniFile.ReadString ('Config', 'PathSalvaTelas','C:\NAO_EXISTE_MESMO');
    hrIniNoite    := wIniFile.ReadInteger('Config', 'HrInicioNoite',  17);
    LogoInit      := wIniFile.ReadString ('Config', 'LogoInicial',    'C:\SpeedTE\Dados\LogoInicio.BMP');
    LogoImpres    := wIniFile.ReadString ('Config', 'LogoImpressao',  'C:\SpeedTE\Dados\LogoImpressao.BMP');
    ImgCancel     := wIniFile.ReadString ('Config', 'ImgCancelado',   'C:\SpeedTE\Dados\ImgCancelado.BMP');
    ImgNormal     := wIniFile.ReadString ('Config', 'ImgNormal',      'C:\SpeedTE\Dados\ImgNormal.BMP');
    lDesenv       := wIniFile.ReadBool   ('Config', 'Desenv',         False);
    pixelHor      := wIniFile.ReadInteger('Config', 'PixelHorizontal',4);
    lPrItemSN     := wIniFile.ReadBool   ('Config', 'PrimeiroItem',   False);
    mpPadrao      := wIniFile.ReadInteger('Config', 'MeioPagtoPadrao',1);
    lConsTurno    := wIniFile.ReadBool   ('Config', 'ConsultaPedidos', True);
    mesesConsulta := wIniFile.ReadInteger('Config', 'MesesConsulta',  12);
    txtIncluir    := wIniFile.ReadString ('Config', 'TextoIncluir',   'Incluir lançamento?');
    lLctSemValor  := wIniFile.ReadBool   ('Config', 'LctoSemValor',   False);
    lExCarga      := wIniFile.ReadBool   ('Config', 'ExibeCarga',     False);
    lSolCPF       := wIniFile.ReadBool   ('Config', 'SolicitaCPF',    False);
    lInfCPF       := wIniFile.ReadBool   ('Config', 'CPFCliente',     False);
    lMdEntrega    := wIniFile.ReadBool   ('Config', 'Entrega',        False);
    lValEntrega   := wIniFile.ReadBool   ('Config', 'ValidaEntrega',  False);
    if not lMdEntrega then
      lValEntrega := False;

    idPrinter     := wIniFile.ReadString ('Pedidos', 'Impressora',     'Elgin');
    tmMax         := wIniFile.ReadInteger('Pedidos', 'TamanhoMax',     300);
    margEsq       := wIniFile.ReadInteger('Pedidos', 'MargEsquerda',   8);
    margDir       := wIniFile.ReadInteger('Pedidos', 'MargDireita',    7);
    margTop       := wIniFile.ReadInteger('Pedidos', 'MargTopo',       5);
    margBot       := wIniFile.ReadInteger('Pedidos', 'MargRodape',     5);
    copias        := wIniFile.ReadInteger('Pedidos', 'Copias',         1);
    lPreview      := wIniFile.ReadBool   ('Pedidos', 'Preview',        False);
    lDialog       := wIniFile.ReadBool   ('Pedidos', 'Dialogo',        False);
    altExtra      := wIniFile.ReadInteger('Pedidos', 'AlturaExtra',    64);
    lPrevCons     := wIniFile.ReadBool   ('Pedidos', 'PreviewConsulta', False);
    lImpInterno   := wIniFile.ReadBool   ('Pedidos', 'ImprimeInterno', True);
    idInterno     := wIniFile.ReadString ('Pedidos', 'IdInterno',      'Cozinha');
    copInterno    := wIniFile.ReadInteger('Pedidos', 'CopiasInterno',  1);
    tempEspera    := wIniFile.ReadInteger('Pedidos', 'Intervalo',      2);
    loPedido      := wIniFile.ReadInteger('Pedidos', 'LayOutPedido',   0);     // 0-Topo  <>0-Rodape
    loInterno     := wIniFile.ReadInteger('Pedidos', 'LayOutInterno',  0);     // 0-Topo  <>0-Rodape
    linPedFixa    := wIniFile.ReadBool   ('Pedidos', 'AlturaFixaPed', True);
    linIntFixa    := wIniFile.ReadBool   ('Pedidos', 'AlturaFixaInt', True);
    lValorUnit    := wIniFile.ReadBool   ('Pedidos', 'ImprimeVlrUnitario', True);
    mdDtHr        := wIniFile.ReadInteger('Pedidos', 'FormatoDataHora', 0);   // 0-DD/MM/AAAA hr:Mi  1-DD/MM/AA hr:mi
    lImpTurno     := wIniFile.ReadBool   ('Pedidos', 'ImprimeTurnoNro', True);

    if (tempEspera = 0) or (tempEspera > 5) then
      tempEspera := 2;
    tempEspera := tempEspera * 1000;
    if (margEsq + margDir) > 15 then
    begin
      margEsq := 8;
      margDir := 7;
    end;
    pathDados := wIniFile.ReadString('Dados',   'PathDados',    'C:\SpeedTE\Dados');
    pathDados := IncludeTrailingPathDelimiter(pathDados);
    tbClie    := pathDados + wIniFile.ReadString('Dados','Clientes','Clientes.DAT');
    tbOldClie := pathDados + wIniFile.ReadString('Dados','OldClientes','OldClientes.DAT');
    tbProd    := pathDados + wIniFile.ReadString('Dados','Produtos','Produtos.DAT');
    lCargaXML := wIniFile.ReadBool('Dados','CargaXML',False);
    nIndexConsClie := wIniFile.ReadInteger('Dados',   'OrdemPesquisa', 2);  // 0-Seq 1-Fone 2-Nome 3-Ender 4-Nome/Ender

    tmpProds  := pathDados + 'Tmp_Prods.XML';
    DecodeTime(Time,Hr,Mi,Se,Ms);
    if ((Hr * 60) + Mi) < (hrIniNoite * 60) then
    begin
      tbPeds := pathDados + 'Ped_' + FSTEPrincipal.dtAtual + 'D.DAT';
      tbLcts := pathDados + 'Ped_' + FSTEPrincipal.dtAtual + 'D_Lct.DAT';
      FSTEPrincipal.rgTurno.ItemIndex := 0;
    end
    else begin
      tbPeds := pathDados + 'Ped_' + FSTEPrincipal.dtAtual + 'N.DAT';
      tbLcts := pathDados + 'Ped_' + FSTEPrincipal.dtAtual + 'N_Lct.DAT';
      FSTEPrincipal.rgTurno.ItemIndex := 1;
    end;

    cadClientes := ChangeFileExt(tbClie,'.XML');
    cadProdutos := ChangeFileExt(tbProd,'.XML');

    wIniFile.Free;

  end;

end;



procedure TFSTEConfigurar.btCancelarClick(Sender: TObject);
begin
  lGravar := False;
  Close;

end;

procedure TFSTEConfigurar.btSalvarClick(Sender: TObject);
begin
  lGravar := True;
  Close;

end;

procedure TFSTEConfigurar.FormActivate(Sender: TObject);
begin
  Form_Define(FSTEConfigurar);

end;

procedure TFSTEConfigurar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FSTEConfigurar);

end;

procedure TFSTEConfigurar.FormShow(Sender: TObject);
begin
  PgControle.ActivePage := TSUsuario;

end;

procedure TFSTEConfigurar.gbCtleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    ShowMessage('Chave' + #13 +
                '1.pos em "ABC...YZ" + 2020 = Ano' + #13 +
                '2.pos em "abc...kl" = Mes' + #13 +
                'Dias aviso');

end;

end.
