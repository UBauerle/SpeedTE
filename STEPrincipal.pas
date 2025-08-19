unit STEPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.ExtCtrls, Vcl.StdCtrls, DateUtils,
  Data.DB, Datasnap.DBClient, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Samples.Gauges,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, MidasLib, System.UITypes;
  Function CarregaPedidos(pmtPeds:String; pmtLcts:String; pmtDiaAtual:Boolean; pmtExibe:Boolean=True): Boolean;
  Procedure ObtemCamposArqTexto(pmtLinha:String; pmtResult:TStringList; pmtMinimo:Integer);

type
  TFSTEPrincipal = class(TForm)
    PanTopo: TPanel;
    LabIdent: TLabel;
    GroupBox1: TGroupBox;
    rgTurno: TRadioGroup;
    Timer1: TTimer;
    LabDataHora: TLabel;
    PanRodape: TPanel;
    btFinalizar: TBitBtn;
    btProdutos: TBitBtn;
    GroupBox2: TGroupBox;
    DBText1: TDBText;
    btClientes: TBitBtn;
    gbCargaSalva: TGroupBox;
    Gauge1: TGauge;
    btAbrirPedido: TBitBtn;
    Clientes: TClientDataSet;
    ClientesSeq: TIntegerField;
    ClientesChave: TStringField;
    ClientesNome: TStringField;
    ClientesEndereco: TStringField;
    ClientesBairro: TStringField;
    ClientesRefer: TStringField;
    DSClientes: TDataSource;
    DSProdutos: TDataSource;
    Produtos: TClientDataSet;
    ProdutosSeq: TIntegerField;
    ProdutosDescr: TStringField;
    ProdutosValor: TCurrencyField;
    Pedidos: TClientDataSet;
    PedidosNro: TIntegerField;
    PedidosFone: TStringField;
    PedidosNome: TStringField;
    PedidosEndereco: TStringField;
    PedidosBairro: TStringField;
    PedidosRefer: TStringField;
    PedidosTotal: TCurrencyField;
    DSPedidos: TDataSource;
    PedLctos: TClientDataSet;
    PedLctosPedNro: TIntegerField;
    PedLctosLcto: TIntegerField;
    PedLctosQuant: TIntegerField;
    PedLctosProduto: TStringField;
    PedLctosValor: TCurrencyField;
    PedLctosTotal: TCurrencyField;
    DSPedLcto: TDataSource;
    PanPedido: TPanel;
    gbCliente: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbFone: TDBEdit;
    dbNome: TDBEdit;
    dbEnder: TDBEdit;
    dbBairro: TDBEdit;
    dbProx: TDBEdit;
    gbLanctos: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    PedWrk: TClientDataSet;
    PedWrkNro: TIntegerField;
    PedWrkFone: TStringField;
    PedWrkNome: TStringField;
    PedWrkEndereco: TStringField;
    PedWrkBairro: TStringField;
    PedWrkRefer: TStringField;
    PedWrkTotal: TCurrencyField;
    LctWrk: TClientDataSet;
    LctWrkPedNro: TIntegerField;
    LctWrkLcto: TIntegerField;
    LctWrkQuant: TIntegerField;
    LctWrkProduto: TStringField;
    LctWrkValor: TCurrencyField;
    LctWrkTotal: TCurrencyField;
    DSPedWrk: TDataSource;
    DSLctWrk: TDataSource;
    gbTotaliz: TGroupBox;
    btFinaliza: TBitBtn;
    btCancela: TBitBtn;
    Label7: TLabel;
    LabTele: TLabel;
    Label9: TLabel;
    PedidosVlrTele: TCurrencyField;
    PedidosMeioPgto: TSmallintField;
    PedidosVlrPago: TCurrencyField;
    PedWrkVlrTele: TCurrencyField;
    PedWrkMeioPgto: TSmallintField;
    PedWrkVlrPago: TCurrencyField;
    dbQtd: TDBEdit;
    dbUnit: TDBEdit;
    dbObs1: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    btConfirmaProd: TBitBtn;
    RETexto: TRichEdit;
    LabAbort: TLabel;
    edValorTele: TDBEdit;
    DBEdit1: TDBEdit;
    dbSubTotal: TDBEdit;
    PedWrkZC_Total: TCurrencyField;
    dbVlrPago: TDBEdit;
    dbTroco: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    PedWrkZC_Troco: TCurrencyField;
    dbTotal: TDBEdit;
    Label6: TLabel;
    PedidosTurno: TStringField;
    PedidosData: TDateField;
    PedWrkTurno: TStringField;
    PedWrkData: TDateField;
    dbProdCombo: TDBComboBox;
    SDSMeiosPgto: TDataSource;
    DSMeiosPgto: TClientDataSet;
    DSMeiosPgtoCodMP: TIntegerField;
    DSMeiosPgtoDescrMP: TStringField;
    dbLkMeioPgto: TDBLookupComboBox;
    Label15: TLabel;
    ProdutosTipo: TSmallintField;
    ClientesDtCompra: TDateField;
    SDSTipos: TDataSource;
    DSTipos: TClientDataSet;
    DSTiposCodTp: TSmallintField;
    DSTiposDescrTp: TStringField;
    ProdutosZL_Tipo: TStringField;
    PedLctosObs1: TStringField;
    PedLctosObs2: TStringField;
    LctWrkObs1: TStringField;
    LctWrkObs2: TStringField;
    dbObs2: TDBEdit;
    MemLcto: TMemo;
    LabAltExc: TLabel;
    PanNovoLcto: TPanel;
    Label14: TLabel;
    btSim: TBitBtn;
    btNao: TBitBtn;
    btAcrescenta: TBitBtn;
    PanAlteraExclue: TPanel;
    Label8: TLabel;
    btAlteraLcto: TBitBtn;
    btExclueLcto: TBitBtn;
    btIgnora: TBitBtn;
    btConsultar: TBitBtn;
    PedidosZC_Total: TCurrencyField;
    PedidosZC_MPgto: TStringField;
    dbMeioPagto: TDBText;
    PedWrkZC_Turno: TStringField;
    PedWrkZC_MPagto: TStringField;
    PedidosZC_FoneNome: TStringField;
    ClientesCPF_CNPJ: TStringField;
    PedidosEntrega: TSmallintField;
    PedWrkEntrega: TSmallintField;
    PedWrkCPF_CNPJ: TStringField;
    PedidosCPF_CNPJ: TStringField;
    LabCPF_CNPJ: TLabel;
    dbCPF_CNPJ: TDBEdit;
    DSEntrega: TClientDataSet;
    SDSEntrega: TDataSource;
    DSEntregaCod: TSmallintField;
    DSEntregaDescr: TStringField;
    LabEntrega: TLabel;
    dbLkEntrega: TDBLookupComboBox;
    PedidosZC_Entrega: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFinalizarClick(Sender: TObject);
    procedure btProdutosClick(Sender: TObject);
    procedure btClientesClick(Sender: TObject);
    procedure rgTurnoExit(Sender: TObject);
    procedure dbFoneExit(Sender: TObject);
    procedure btAbrirPedidoClick(Sender: TObject);
    procedure ProdutosBeforePost(DataSet: TDataSet);
    procedure btCancelaClick(Sender: TObject);
    procedure btFinalizaClick(Sender: TObject);
    procedure gbClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabAbortClick(Sender: TObject);
    procedure dbQtdExit(Sender: TObject);
    procedure dbUnitExit(Sender: TObject);
    procedure btConfirmaProdClick(Sender: TObject);
    procedure PedWrkCalcFields(DataSet: TDataSet);
    procedure btSimClick(Sender: TObject);
    procedure btNaoClick(Sender: TObject);
    procedure edValorTeleEnter(Sender: TObject);
    procedure edValorTeleExit(Sender: TObject);
    procedure dbProdComboExit(Sender: TObject);
    procedure dbLkMeioPgtoExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RETextoDblClick(Sender: TObject);
    procedure dbFoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbFoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbEnderKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbBairroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbProxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbEnderKeyPress(Sender: TObject; var Key: Char);
    procedure dbBairroKeyPress(Sender: TObject; var Key: Char);
    procedure dbProxKeyPress(Sender: TObject; var Key: Char);
    procedure dbProdComboKeyPress(Sender: TObject; var Key: Char);
    procedure dbQtdKeyPress(Sender: TObject; var Key: Char);
    procedure dbObs1KeyPress(Sender: TObject; var Key: Char);
    procedure dbObs2KeyPress(Sender: TObject; var Key: Char);
    procedure dbUnitKeyPress(Sender: TObject; var Key: Char);
    procedure edValorTeleKeyPress(Sender: TObject; var Key: Char);
    procedure dbLkMeioPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure dbVlrPagoKeyPress(Sender: TObject; var Key: Char);
    procedure dbProdComboKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbObs1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbObs2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbUnitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edValorTeleKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbLkMeioPgtoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbVlrPagoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbObs1Change(Sender: TObject);
    procedure dbObs2Change(Sender: TObject);
    procedure gbTotalizEnter(Sender: TObject);
    procedure gbTotalizExit(Sender: TObject);
    procedure btAcrescentaClick(Sender: TObject);
    procedure btAlteraLctoClick(Sender: TObject);
    procedure btExclueLctoClick(Sender: TObject);
    procedure btIgnoraClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure PedidosCalcFields(DataSet: TDataSet);
    procedure dbCPF_CNPJExit(Sender: TObject);
    procedure dbCPF_CNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure dbLkEntregaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbLkEntregaKeyPress(Sender: TObject; var Key: Char);
    procedure dbLkEntregaExit(Sender: TObject);
    procedure dbFoneDblClick(Sender: TObject);
    procedure dbObs1Exit(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    ultCliente,ultProduto,ultPedido: Integer;
    idUsuario,idLograd,idNro,idCompl,idBairro,idCidade,idUF,idInterno: String;
    idFone,idWhats: String;
    lSalvaForm,lCargaXML,lDesenv,lPrItemSN,lInfCPF,lSemNome,lSemEnder: Boolean;
    lManutClientes,lConsTurno,lMdEntrega,lValEntrega: Boolean;
    mesesConsulta: Integer;
    pathSalvaForm,pathDados: String;
    hrIniNoite,mpPadrao,nConsClie: Integer;
    dtAtual: String;
    tbClie,tbOldClie,tbProd,tbPeds,tbLcts: String;
    tbAllPeds,tbAllLcts: String;
    cadClientes,cadProdutos: String;
    LogoInit,LogoImpres: String;
    tmpProds: String;
    idPrinter: String;
    tmMax,margEsq,margDir,margTop,margBot,copias,copInterno,tempEspera: Integer;
    lPreview,lDialog,lPrevCons,lImpInterno: Boolean;
    pixelHor,altExtra: Integer;
    keyUsuar: String;
    ddCheck: Integer;

  end;

var
  FSTEPrincipal: TFSTEPrincipal;
  wMsg: String;
  lCadastrado,lLancando,lExclusao: Boolean;
  lTeclaDown: Boolean;
  fTime: Boolean;
  nroPed: Integer;
  //xInfo: array[0..19] of String;
  qtdLctos: Integer;
  lUtilizar: Boolean;


implementation

{$R *.dfm}

uses uGenericas, STEProdutos, STEClientes, STEImpressao, STEConsTurno,
  STEConsCliente, STEConfigurar;

Procedure ObtemCamposArqTexto(pmtLinha:String; pmtResult:TStringList; pmtMinimo:Integer);
var xLinha: String;
    nP,nOcorr: Integer;
begin
  xLinha := pmtLinha + '|';
  nP := Pos('|',xLinha);
  while nP > 0 do
  begin
    pmtResult.Add(Copy(xLinha,1,nP-1));
    xLinha := Copy(xLinha,np+1,Length(xLinha)-nP);
    nP := Pos('|',xLinha);
  end;
  while pmtResult.Count < pmtMinimo do
    pmtResult.Add('0');

end;

Function DefineVerificaValidade(pmtKey:String): Boolean;
var AA,MM,DD: word;
    x1,x2: String;
    nP1,nP2,nDias: Integer;
    wDt: TDate;
begin
  Result := False;
  x1 := AnsiUpperCase(Copy(pmtKey,1,1));
  x2 := AnsiLowerCase(Copy(pmtKey,2,1));
  //
  nP1 := Pos(x1,'ABCDEFGHIJKLMNOPQRSTUVWXYZ');     // 1-26
  if (nP1 < 1) or (nP1 > 26) then
    nP1 := 1;
  nP2 := Pos(x2,'abcdefghijkl');                   // 1-12
  if (nP2 < 1) or (nP2 > 12) then
    nP2 := 1;
  AA := 2020 + nP1;
  MM := nP2;
  wDt := EncodeDate(AA,MM,1);
  DD := DaysInMonth(wDt);
  wDt := EncodeDate(AA,MM,DD);
  nDias := DaysBetween(wDt,DateOf(Date));
  if wDt < DateOf(Date) then
  begin
    MessageDlg('Sistema fora da validade      *2020*  key=' + pmtKey + #13#13 +
               'Validade: ' + DateToStr(wDt) + #13 +
               'Dt.Atual: ' + DateToStr(Date) + #13 +
               'Vencido a ' + IntToStr(nDias) + ' dias', mtError, [mbOk], 0);
    Exit;
  end;
  if nDias <= FSTEPrincipal.ddCheck then
    MessageDlg('Validade do sistema expira em ' + IntToStr(nDias) + ' dias' + #13#13 +
              'Informe ao suporte', mtInformation, [mbOk],0);
  Result := True;

end;


Function CriaDataSets: Integer;
begin
  with FSTEPrincipal do
  begin
    Result := 0;
    wMsg := '';
    //
    DSMeiosPgto.Active := False;
    DSMeiosPgto.FieldDefs.Clear;
    DSMeiosPgto.FieldDefs.Add('CodMP',   ftSmallint);
    DSMeiosPgto.FieldDefs.Add('DescrMP', ftString, 15);
    DSMeiosPgto.IndexDefs.Clear;
    DSMeiosPgto.IndexDefs.Add('','CodMP',[ixPrimary,ixUnique]);
    DSMeiosPgto.CreateDataSet;
    Try
      DSMeiosPgto.Active := True;
      DSMeiosPgto.Active := False;
    Except
      wMsg := wMsg + '"DSMeiosPgto"' + #13;
      Result := Result + 1;
    End;
    //
    Clientes.Active := False;
    Clientes.FieldDefs.Clear;
    Clientes.FieldDefs.Add('Seq',      ftInteger);
    Clientes.FieldDefs.Add('Chave',    ftString, 15);
    Clientes.FieldDefs.Add('Nome',     ftString, 30);
    Clientes.FieldDefs.Add('Endereco', ftString, 40);
    Clientes.FieldDefs.Add('Bairro',   ftString, 20);
    Clientes.FieldDefs.Add('Refer',    ftString, 40);
    Clientes.FieldDefs.Add('DtCompra', ftDate);
    Clientes.FieldDefs.Add('CPF_CNPJ', ftString, 14);
    Clientes.IndexDefs.Clear;
    Clientes.IndexDefs.Add('','Seq',[ixPrimary,ixUnique]);
    Clientes.IndexDefs.Add('Fone','Chave;Seq',[]);
    Clientes.IndexDefs.Add('Alfabetica','Nome;Chave',[]);
    Clientes.IndexDefs.Add('Address','Endereco;Chave',[]);
    Clientes.IndexDefs.Add('AlfaEnder','Nome;Endereco',[]);
    Clientes.IndexDefs.Add('UltCompra','DtCompra;Nome',[ixDescending]);
    Clientes.CreateDataSet;
    Try
      Clientes.Active := True;
      Clientes.Active := False;
    Except
      wMsg := wMsg + '"Clientes"' + #13;
      Result := Result + 1;
    End;
    // .... Tipos de produtos
    DSTipos.Active := False;
    DSTipos.FieldDefs.Clear;
    DSTipos.FieldDefs.Add('CodTp',   ftSmallint);
    DSTipos.FieldDefs.Add('DescrTp', ftString, 15);
    DSTipos.IndexDefs.Clear;
    DSTipos.IndexDefs.Add('','CodTp',[ixPrimary,ixUnique]);
    DSTipos.CreateDataSet;
    Try
      DSTipos.Active := True;
      DSTipos.Active := False;
    Except
      wMsg := wMsg + '"DSTipos"' + #13;
      Result := Result + 1;
    End;
    // .... Produtos
    Produtos.Active := False;
    Produtos.FieldDefs.Clear;
    Produtos.FieldDefs.Add('Seq',      ftInteger);
    Produtos.FieldDefs.Add('Descr',    ftString, 40);
    Produtos.FieldDEfs.Add('Tipo',     ftSmallint);      // 1-Lanches/Refeições 2-Bebidas 3-Diversos
    Produtos.FieldDefs.Add('Valor',    ftCurrency);
    Produtos.IndexDefs.Add('','Seq',[ixPrimary,ixUnique]);
    Produtos.IndexDefs.Add('Alfabetica','Descr',[]);
    Produtos.CreateDataSet;
    Try
      Produtos.Active := True;
      Produtos.Active := False;
    Except
      wMsg := wMsg + '"Produtos"' + #13;
      Result := Result + 1;
    End;
    //
    // .... Pedidos do dia
    Pedidos.Active := False;
    Pedidos.FieldDefs.Clear;
    Pedidos.FieldDefs.Add('Nro',      ftInteger);
    Pedidos.FieldDefs.Add('Fone',     ftString, 15);
    Pedidos.FieldDefs.Add('Nome',     ftString, 30);
    Pedidos.FieldDefs.Add('Endereco', ftString, 40);
    Pedidos.FieldDefs.Add('Bairro',   ftString, 20);
    Pedidos.FieldDefs.Add('Refer',    ftString, 40);
    Pedidos.FieldDefs.Add('Total',    ftCurrency);
    Pedidos.FieldDefs.Add('VlrTele',  ftCurrency);
    Pedidos.FieldDefs.Add('MeioPgto', ftSmallInt);
    Pedidos.FieldDefs.Add('VlrPago',  ftCurrency);
    Pedidos.FieldDefs.Add('Turno',    ftString, 1);
    Pedidos.FieldDefs.Add('Data',     ftDate);
    Pedidos.FieldDefs.Add('CPF_CNPJ', ftString, 14);
    Pedidos.FieldDefs.Add('Entrega',  ftSmallint);
    Pedidos.IndexDefs.Add('','Nro',[ixPrimary,ixUnique]);
    Pedidos.CreateDataSet;
    Try
      Pedidos.Active := True;
      Pedidos.Active := False;
    Except
      wMsg := wMsg + '"Pedidos"' + #13;
      Result := Result + 1;
    End;
    //
    // .... Lançamentos dos pedidos do dia
    PedLctos.Active := False;
    PedLctos.FieldDefs.Clear;
    PedLctos.FieldDefs.Add('PedNro',   ftInteger);
    PedLctos.FieldDefs.Add('Lcto',     ftInteger);
    PedLctos.FieldDefs.Add('Quant',    ftInteger);
    PedLctos.FieldDefs.Add('Produto',  ftString, 40);
    PedLctos.FieldDefs.Add('Obs1',     ftString, 50);
    PedLctos.FieldDefs.Add('Obs2',     ftString, 50);
    PedLctos.FieldDefs.Add('Valor',    ftCurrency);
    PedLctos.FieldDefs.Add('Total',    ftCurrency);
    PedLctos.IndexDefs.Add('','PedNro;Lcto',[ixPrimary,ixUnique]);
    PedLctos.CreateDataSet;
    Try
      PedLctos.Active := True;
      PedLctos.Active := False;
    Except
      wMsg := wMsg + '"PedLctos"' + #13;
      Result := Result + 1;
    End;
    //
    // .... Pedido corrente
    PedWrk.Active := False;
    PedWrk.FieldDefs.Clear;
    PedWrk.FieldDefs.Add('Nro',      ftInteger);
    PedWrk.FieldDefs.Add('Fone',     ftString, 15);
    PedWrk.FieldDefs.Add('Nome',     ftString, 30);
    PedWrk.FieldDefs.Add('Endereco', ftString, 40);
    PedWrk.FieldDefs.Add('Bairro',   ftString, 20);
    PedWrk.FieldDefs.Add('Refer',    ftString, 40);
    PedWrk.FieldDefs.Add('Total',    ftCurrency);
    PedWrk.FieldDefs.Add('VlrTele',  ftCurrency);
    PedWrk.FieldDefs.Add('MeioPgto', ftSmallInt);
    PedWrk.FieldDefs.Add('VlrPago',  ftCurrency);
    PedWrk.FieldDefs.Add('Turno',    ftString, 1);
    PedWrk.FieldDefs.Add('Data',     ftDate);
    PedWrk.FieldDefs.Add('CPF_CNPJ', ftString, 14);
    PedWrk.FieldDefs.Add('Entrega',  ftSmallint);
    PedWrk.CreateDataSet;
    Try
      PedWrk.Active := True;
      PedWrk.Active := False;
    Except
      wMsg := wMsg + '"PedWrk"' + #13;
      Result := Result + 1;
    End;
    //
    // .... Lançamentos do pedido corrente
    LctWrk.Active := False;
    LctWrk.FieldDefs.Clear;
    LctWrk.FieldDefs.Add('PedNro',   ftInteger);
    LctWrk.FieldDefs.Add('Lcto',     ftInteger);
    LctWrk.FieldDefs.Add('Quant',    ftInteger);
    LctWrk.FieldDefs.Add('Produto',  ftString, 40);
    LctWrk.FieldDefs.Add('Obs1',     ftString, 50);
    LctWrk.FieldDefs.Add('Obs2',     ftString, 50);
    LctWrk.FieldDefs.Add('Valor',    ftCurrency);
    LctWrk.FieldDefs.Add('Total',    ftCurrency);
    LctWrk.IndexDefs.Add('','PedNro;Lcto',[ixPrimary,ixUnique]);
    LctWrk.CreateDataSet;
    Try
      LctWrk.Active := True;
      LctWrk.Active := False;
    Except
      wMsg := wMsg + '"LctWrk"' + #13;
      Result := Result + 1;
    End;
    //
    DSEntrega.Active := False;
    DSEntrega.FieldDefs.Clear;
    DSEntrega.FieldDefs.Add('Cod',   ftSmallint);
    DSEntrega.FieldDefs.Add('Descr', ftString, 15);
    DSEntrega.IndexDefs.Clear;
    DSEntrega.IndexDefs.Add('','Cod',[ixPrimary,ixUnique]);
    DSEntrega.CreateDataSet;
    Try
      DSEntrega.Active := True;
      DSEntrega.Active := False;
    Except
      wMsg := wMsg + '"DSEntrega"' + #13;
      Result := Result + 1;
    End;
    //
    if wMsg <> '' then
      wMsg := 'Falha na criação de' + #13 + wMsg + #13;

  end;

end;

Function ValidaRegistro(var pmtChave:String; pmtNome,pmtEnder:String): Boolean;
var kNumerica: Integer;
begin
  Result := False;
  if pmtChave = '' then
    Exit;
  //
  pmtChave := Numerico(Trim(pmtChave));
  kNumerica := StrToIntDef(pmtChave,0);
  if (kNumerica = 0) or
     (Length(Trim(pmtChave)) < 8) then
     Exit;
  //
  Result := True;

end;


Function CarregaPedidos(pmtPeds:String; pmtLcts:String; pmtDiaAtual:Boolean; pmtExibe:Boolean=True): Boolean;
var wMsg: String;
    lstWork: TStringList;
    xInfo: TStringList;
    i: Integer;
begin
  Result := False;
  wMsg := '';
  if not FileExists(pmtPeds) then
    wMsg := wMsg + pmtPeds + #13;
  if not FileExists(pmtLcts) then
    wMsg := wMsg + pmtLcts + #13;
  if wMsg <> '' then
    if not pmtDiaAtual then
      begin
        MessageDlg('Arquivo(s) não encontrado(s)' + #13 + wMsg,mtError,[mbOk],0);
        Exit;
      end;
  //
  lstWork := TStringList.Create;
  if FileExists(pmtPeds) then
  begin
    lstWork.LoadFromFile(pmtPeds);
    if pmtExibe then
    begin
      FSTEPrincipal.gbCargaSalva.Visible := True;
      FSTEPrincipal.gbCargaSalva.Caption := 'Carga: Pedidos';
      FSTEPrincipal.Gauge1.Progress := 0;
      FSTEPrincipal.Gauge1.MaxValue := lstWork.Count;
      Application.ProcessMessages;
    end;
    FSTEPrincipal.Pedidos.Active := True;
    FSTEPrincipal.Pedidos.EmptyDataSet;
    for i := 0 to lstWork.Count-1 do
    begin
      xInfo:= TStringList.Create;
      ObtemCamposArqTexto(lstWork[i], xInfo, 14);     // Retorno em xInfo
      FSTEPrincipal.Pedidos.Append;
      FSTEPrincipal.PedidosNro.AsInteger := StrToIntDef(xInfo[0],1);
      FSTEPrincipal.PedidosFone.AsString := xInfo[1];
      FSTEPrincipal.PedidosNome.AsString := xInfo[2];
      FSTEPrincipal.PedidosEndereco.AsString := xInfo[3];
      FSTEPrincipal.PedidosBairro.AsString := xInfo[4];
      FSTEPrincipal.PedidosRefer.AsString := xInfo[5];
      FSTEPrincipal.PedidosTotal.AsCurrency := StrToFloatDef(xInfo[6],0);
      FSTEPrincipal.PedidosVlrTele.AsCurrency := StrToFloatDef(xInfo[7],0);
      FSTEPrincipal.PedidosMeioPgto.AsInteger := StrToIntDef(xInfo[8],0);
      FSTEPrincipal.PedidosVlrPago.AsCurrency := StrToFloatDef(xInfo[9],0);
      FSTEPrincipal.PedidosTurno.AsString := xInfo[10];
      FSTEPrincipal.PedidosData.AsString := xInfo[11];
      FSTEPrincipal.PedidosCPF_CNPJ.AsString := xInfo[12];
      FSTEPrincipal.PedidosEntrega.AsInteger := StrToIntDef(xInfo[13],0);
      Try
        FSTEPrincipal.Pedidos.Post;
      Except
        FSTEPrincipal.Pedidos.Cancel;
      End;
      xInfo.Free;
      if pmtExibe then
        FSTEPrincipal.Gauge1.Progress := FSTEPrincipal.Gauge1.Progress + 1;
    end;
  end;
  // Pedidos lanctos
  lstWork.Clear;
  if FileExists(pmtLcts) then
  begin
    lstWork.LoadFromFile(pmtLcts);
    if pmtExibe then
    begin
      FSTEPrincipal.gbCargaSalva.Caption := 'Carga: Lançamentos';
      FSTEPrincipal.Gauge1.Progress := 0;
      FSTEPrincipal.Gauge1.MaxValue := lstWork.Count;
      Application.ProcessMessages;
    end;
    FSTEPrincipal.PedLctos.Active := True;
    FSTEPrincipal.PedLctos.EmptyDataSet;
    for i := 0 to lstWork.count-1 do
    begin
      xInfo := TStringList.Create;
      ObtemCamposArqTexto(lstWork[i],xInfo, 10);     // Retorno em xInfo
      FSTEPrincipal.PedLctos.Append;
      FSTEPrincipal.PedLctosPedNro.AsInteger := StrToIntDef(xInfo[0],0);
      FSTEPrincipal.PedLctosLcto.AsInteger := StrToIntDef(xInfo[1],0);
      FSTEPrincipal.PedLctosQuant.AsInteger := StrToIntDef(xInfo[2],0);
      FSTEPrincipal.PedLctosProduto.AsString := xInfo[3];
      FSTEPrincipal.PedLctosObs1.AsString := xInfo[4];
      FSTEPrincipal.PedLctosObs2.AsString := xInfo[5];
      FSTEPrincipal.PedLctosValor.AsCurrency := StrToFloatDef(xInfo[6],0);
      FSTEPrincipal.PedLctosTotal.AsCurrency := strToFloatDef(xInfo[7],0);
      Try
        FSTEPrincipal.PedLctos.Post;
      Except
        FSTEPrincipal.PedLctos.Cancel;
      End;
      xInfo.Free;
      if pmtExibe then
        FSTEPrincipal.Gauge1.Progress := FSTEPrincipal.Gauge1.Progress + 1;
    end;
  end;
  Result := True;

end;


Function CarregaDados: Boolean;
var lstWork,lstAuxil: TStringList;
    i: Integer;
    xValor,xTipo,xLine: String;
    xKey,xNome,xEnder,xBair,xRefer,xCPF: String;
    wData: TDateTime;
const xErro: String = #13 + 'Aplicação não pode ser iniciada' + #13;
      codMP: array [0..4] of integer = (1,3,4,17,99);
      descrMP: array [0..4] of String = ('Dinheiro','C.Crédito','C.Débito','PIX','Outros');
      descrTp: array[0..7] of String = ('Indefinido',
                                        'Lanches',
                                        'Refeições',
                                        'Refrigerantes',
                                        'Águas',
                                        'Sucos',
                                        'Cervejas',
                                        'Beb c/alcool');
      descrEntr: array[0..2] of String = ('Tele-entrega','Retira','Cons.local');

begin
  Result := False;
  if CriaDataSets > 0 then
  begin
    MessageDlg(wMsg + xErro,mtError,[mbOk],0);
    Exit;
  end;
  //
  wMsg := '';
  if not FileExists(FSTEPrincipal.tbClie) then
    wMsg := wMsg + '[ ' + FSTEPrincipal.tbClie + ' ] Inexistente' + #13;
  if not FileExists(FSTEPrincipal.tbProd) then
    wMsg := wMsg + '[ ' + FSTEPrincipal.tbProd + ' ] Inexistente' + #13;
  if wMsg <> '' then
    begin
      MessageDlg(wMsg + xErro,mtError,[mbOk],0);
      Exit;
    end;
  //
  with FSTEPrincipal do
  begin
    DSMeiosPgto.Active := True;
    for i:= 0 to Length(descrMP)-1 do
    begin
      DSMeiosPgto.Append;
      DSMeiosPgtoCodMP.AsInteger := codMP[i];
      DSMeiosPgtoDescrMP.AsString := descrMP[i];
      DSMeiosPgto.Post;
    end;
    //
    DSTipos.Active := True;
    for i := 0 to Length(descrTp)-1 do
    begin
      DSTipos.Append;
      DSTiposCodTp.AsInteger := i;
      DSTiposDescrTp.AsString := descrTp[i];
      DSTipos.Post;
    end;
    //
    DSEntrega.Active := True;
    for i := 0 to Length(descrEntr)-1 do
    begin
      DSEntrega.Append;
      DSEntregaCod.AsInteger := i;
      DSEntregaDescr.AsString := descrEntr[i];
      DSEntrega.Post;
    end;
    //
    gbCargaSalva.Visible := True;
    Application.ProcessMessages;
    // Clientes
    if FSTEPrincipal.lCargaXML and FileExists(FSTEPrincipal.cadClientes) then
      FSTEPrincipal.Clientes.LoadFromFile(FSTEPrincipal.cadClientes)
    else begin
      lstAuxil := TStringList.Create;
      if FileExists(FSTEPrincipal.tbOldClie) then
        lstAuxil.LoadFromFile(FSTEPrincipal.tbOldClie);
      // OldClie=clientes excluidos no processo de carga
      //
      if FileExists(FSTEPrincipal.cadClientes) then
        DeleteFile(FSTEPrincipal.cadClientes);
      lstWork := TStringList.Create;
      lstWork.LoadFromFile(FSTEPrincipal.tbClie);
      gbCargaSalva.Caption := 'Carga: Clientes';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := lstWork.Count;
      Application.ProcessMessages;
      FSTEPrincipal.Clientes.Active := True;
      FSTEPrincipal.ultCliente := 0;
      for i := 0 to lstWork.Count-1 do
      begin
        xLine := Trim(lstWork[i]);
        if xLine <> '' then
        begin
          if Length(xLine) < 116 then
          begin        // Carrega pelo layout original
            xKey := Trim(Copy(xLine,1,15));
            xNome := Trim(Copy(xLine,16,20));
            xEnder := Trim(Copy(xLine,36,30));
            xBair := Trim(Copy(xLine,66,20));
            xRefer := Trim(Copy(xLine,86,30));
            wData := DateOf(Date);
            xCPF := '';
          end
          else begin   // Carrega pelo novo layout
            xKey := Trim(Copy(xLine,1,15));
            xNome := Trim(Copy(xLine,16,30));
            xEnder := Trim(Copy(xLine,46,40));
            xBair := Trim(Copy(xLine,86,20));
            xRefer := Trim(Copy(xLine,106,40));
            if Length(xLine) > 145 then
            begin
              wData := StrToDate(Copy(xLine,146,10));
              if Length(xLine) > 155 then
                xCPF := Copy(xLine,156,14)
              else
                xCPF := '';
            end
            else begin
              wData := DateOf(Date);
              xCPF := '';
            end

          end;
          if ValidaRegistro(xKey,xNome,xEnder) then
          begin
            FSTEPrincipal.ultCliente := FSTEPrincipal.ultCliente + 1;
            FSTEPrincipal.Clientes.Append;
            FSTEPrincipal.ClientesSeq.AsInteger       := FSTEPrincipal.ultCliente;
            FSTEPrincipal.ClientesChave.AsString      := xKey;
            FSTEPrincipal.ClientesNome.AsString       := xNome;
            FSTEPrincipal.ClientesEndereco.AsString   := xEnder;
            FSTEPrincipal.ClientesBairro.AsString     := xBair;
            FSTEPrincipal.ClientesRefer.AsString      := xRefer;
            FSTEPrincipal.ClientesDtCompra.AsDateTime := wData;
            FSTEPrincipal.ClientesCPF_CNPJ.AsString   := xCPF;
            Try
              FSTEPrincipal.Clientes.Post;
            Except
              FSTEPrincipal.Clientes.Cancel;
            End;
            Gauge1.Progress := Gauge1.Progress + 1;
          end
          else
            lstAuxil.Add(lstWork[i]);   //Acrescenta clientes excluídos, não válidos
        end;
      end;
      FSTEPrincipal.Clientes.SaveToFile(FSTEPrincipal.cadClientes,dfXMLUTF8);
      FSTEPrincipal.Clientes.FileName := FSTEPrincipal.cadClientes;

      lstWork.Free;
      lstAuxil.SaveToFile(FSTEPrincipal.tbOldClie);
      lstAuxil.Free;
    end;
    // Produtos
    if FSTEPrincipal.lCargaXML and FileExists(FSTEPrincipal.cadProdutos) then
      FSTEPrincipal.Produtos.LoadFromFile(FSTEPrincipal.cadProdutos)
    else begin
      if FileExists(FSTEPrincipal.cadProdutos) then
        DeleteFile(FSTEPrincipal.cadProdutos);
      lstWork := TStringList.Create;
      lstWork.LoadFromFile(FSTEPrincipal.tbProd);
      gbCargaSalva.Caption := 'Carga: Produtos';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := lstWork.Count;
      Application.ProcessMessages;
      FSTEPrincipal.Produtos.Active := True;
      FSTEPrincipal.ultProduto := 0;
      for i := 0 to lstWork.Count-1 do
      begin
        FSTEPrincipal.ultProduto := FSTEPrincipal.ultProduto + 1;
        FSTEPrincipal.Produtos.Append;
        FSTEPrincipal.ProdutosSeq.AsInteger := FSTEPrincipal.ultProduto;
        xLine := lstWork[i];
        if Length(xLine) < 40 then  // Carrega pelo layout original
        begin
          xNome := Copy(xLine,1,30);
          xTipo := '0';
          xValor := Copy(xLine,31,Length(xLine)-30);
        end
        else begin
          xNome := Copy(xLine,1,40);
          xTipo := Copy(xLine,41,1);
          xValor := Copy(xLine,42,Length(xLine)-41);
        end;
        FSTEPrincipal.ProdutosDescr.AsString := xNome;
        FSTEPrincipal.ProdutosTipo.AsInteger := StrToIntDef(xTipo,0);
        FSTEPrincipal.ProdutosValor.AsCurrency := StrToFloat(xValor);
        Try
          FSTEPrincipal.Produtos.Post;
        Except
          FSTEPrincipal.Produtos.Cancel;
        End;
        Gauge1.Progress := Gauge1.Progress + 1;
      end;
      lstWork.Free;
    end;
    //
    // Pedidos e lançamentos do dia
    if not CarregaPedidos(FSTEPrincipal.tbPeds,FSTEPrincipal.tbLcts,True,True) then
      MessageDlg('Falha na carga dos pedidos do dia',mtError,[mbOk],0)
    else begin
      FSTEPrincipal.Pedidos.Active := True;
      FSTEPrincipal.PedLctos.Active := True;
    end;

    gbCargaSalva.visible := False;
  end;
  Result := True;

end;


Function SalvaDados(pmtInfo:Integer; pmtFecha:Boolean): Boolean;
var lstWork: TStringList;
    xLinha: String;
    wDataLimite: TDate;
    nMeses: Integer;
    lSalva: Boolean;
begin
  // pmtInfo: 1-Clientes  2-Produtos  4-Pedidos e lanctos
  Result := False;
  with FSTEPrincipal do
  begin
    gbCargaSalva.Visible := True;
    lstWork := TStringList.Create;
    if pmtInfo in [1,3,5,7] then
    begin     // Clientes
      nMeses := mesesConsulta * -1;
      wDataLimite := IncMonth(Date, nMeses);
      gbCargaSalva.Caption := 'Salvar: Clientes';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := Clientes.RecordCount;
      Application.ProcessMessages;
      Clientes.SaveToFile(FSTEPrincipal.cadClientes,dfXMLUTF8);
      Clientes.IndexName := '';
      Clientes.First;
      while not Clientes.Eof do
      begin
        lSalva := False;
        if (ClientesChave.AsString <> '') and
           (ClientesNome.AsString <> '') and
           (ClientesEndereco.AsString <> '') and
           (ClientesDtCompra.AsDateTime >= wDataLimite) then
          lSalva := True
        else begin
          if ((ClientesNome.AsString = '') and lSemNome) and
             ((ClientesEndereco.AsString = '') and lSemEnder) then
            lSalva := True;
        end;
        if lSalva then
        begin
          xLinha := stringCompleta(ClientesChave.AsString,'D',' ',15) +
                    stringCompleta(ClientesNome.AsString,'D',' ',30) +
                    stringCompleta(ClientesEndereco.AsString,'D',' ',40) +
                    stringCompleta(ClientesBairro.AsString,'D',' ',20) +
                    stringCompleta(ClientesRefer.AsString,'D',' ',40) +
                    DateToStr(ClientesDtCompra.AsDateTime) +
                    stringCompleta(ClientesCPF_CNPJ.AsString,'E',' ',14);
          lstWork.Add(xLinha);
        end;
        Clientes.Next;
        Gauge1.Progress := Gauge1.Progress + 1;
      end;
      lstWork.SaveToFile(tbClie);
      if pmtFecha then
        Clientes.Active := False;
    end;
    if pmtInfo in [2,3,6,7] then
    begin     // Produtos
      gbCargaSalva.Caption := 'Salvar: Produtos';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := Produtos.RecordCount;
      Application.ProcessMessages;
      Produtos.SaveToFile(FSTEPrincipal.cadProdutos,dfXMLUTF8);
      lstWork.Clear;
      Produtos.IndexName := '';
      Produtos.First;
      while not Produtos.Eof do
      begin
        xLinha := stringCompleta(ProdutosDescr.AsString,'D',' ',40) +
                  ProdutosTipo.AsString +
                  ProdutosValor.AsString;
        lstWork.Add(xLinha);
        Produtos.Next;
        Gauge1.Progress := Gauge1.Progress + 1;
      end;
      lstWork.SaveToFile(tbProd);
      if pmtFecha then
        Produtos.Active := False;
    end;
    if pmtInfo in [4,5,6,7] then
    begin    // Pedidos & Lançamentos
      gbCargaSalva.Caption := 'Salvar: Pedidos';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := Pedidos.RecordCount;
      Application.ProcessMessages;
      lstWork.Clear;
      Pedidos.First;
      while not Pedidos.Eof do
      begin
        xLinha := PedidosNro.AsString   + '|' +
                  PedidosFone.AsString  + '|' +
                  PedidosNome.AsString  + '|' +
                  PedidosEndereco.AsString + '|' +
                  PedidosBairro.AsString  + '|' +
                  PedidosRefer.AsString + '|' +
                  PedidosTotal.AsString + '|' +
                  PedidosVlrTele.AsString + '|' +
                  PedidosMeioPgto.AsString + '|' +
                  PedidosVlrPago.AsString + '|' +
                  PedidosTurno.AsString + '|' +
                  PedidosData.AsString + '|' +
                  PedidosCPF_CNPJ.AsString + '|' +
                  PedidosEntrega.AsString + '|';
        lstWork.Add(xLinha);
        Pedidos.Next;
        Gauge1.Progress := Gauge1.Progress + 1;
      end;
      lstWork.SaveToFile(tbPeds);
      if pmtFecha then
        Pedidos.Active := False;
      //Lancamentos
      gbCargaSalva.Caption := 'Salvar: Lançamentos';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := PedLctos.RecordCount;
      Application.ProcessMessages;
      lstWork.Clear;
      PedLctos.First;
      while not PedLctos.eof do
      begin
        xLinha := PedLctosPedNro.AsString + '|' +
                  PedLctosLcto.AsString + '|' +
                  PedLctosQuant.AsString + '|' +
                  PedLctosProduto.AsString + '|' +
                  PedLctosObs1.AsString + '|' +
                  PedLctosObs2.AsString + '|' +
                  PedLctosValor.AsString + '|' +
                  PedLctosTotal.AsString + '|';
        lstWork.Add(xLinha);
        PedLctos.Next;
        Gauge1.Progress := Gauge1.Progress + 1;
      end;
      lstWork.SaveToFile(tbLcts);
      if pmtFecha then
        PedLctos.Active := False;
    end;
    //
    lstWork.Free;
    gbCargaSalva.Visible := False;
  end;
  Result := True;

end;


Procedure CarregaProdsCombo;
begin
  with FSTEPrincipal do
  begin
    dbProdCombo.Items.Clear;
    Produtos.IndexName := 'Alfabetica';
    Produtos.First;
    while not Produtos.Eof do
    begin
      dbProdCombo.Items.Add(ProdutosDescr.AsString);
      Produtos.Next;
    end;

  end;

end;

Procedure SolicitaInclusao(pVisual:Boolean);
begin
  with FSTEPrincipal do
  begin
    if pVisual then
    begin
      PanNovoLcto.Top := gbLanctos.Height - (PanNovoLcto.Height + 36);
      PanNovoLcto.Left := 350;
      PanNovoLcto.Visible := True;
      btSim.SetFocus;
    end
    else
      btSimClick(nil);
  end;
end;


Procedure InclueLancamento;
var nSeq: Integer;
begin
  with FSTEPrincipal do
  begin
    LctWrk.Last;
    nSeq := LctWrkLcto.AsInteger + 1;
    LctWrk.Append;
    LctWrkPedNro.AsInteger := PedWrkNro.AsInteger;
    LctWrkLcto.AsInteger := nSeq;
    LctWrkQuant.AsInteger := 1;
    LctWrkProduto.Clear;
    LctWrkObs1.Clear;
    LctWrkObs2.Clear;
    LctWrkValor.Clear;
    LctWrkTotal.Clear;
    lLancando := True;                    // lançando
    lExclusao := False;                   // Não excluindo
    dbProdCombo.SetFocus;
  end;

end;


Procedure AtualizaCliente;
begin
  with FSTEPrincipal do
  begin
    if (PedWrkFone.AsString = '') or
       (PedWrkNome.AsString = '') then
      Exit;
    //
    if not lCadastrado then
    begin
      ultCliente := ultCliente + 1;
      Clientes.Append;
      ClientesSeq.AsInteger := ultCLiente;
      ClientesChave.AsString := PedWrkFone.AsString;
      ClientesNome.AsString := PedWrkNome.AsString;
      ClientesEndereco.AsString := PedWrkEndereco.AsString;
      ClientesBairro.AsString := PedWrkBairro.AsString;
      ClientesRefer.asString := PedWrkRefer.AsString;
      ClientesCPF_CNPJ.AsString := PedWrkCPF_CNPJ.AsString;
      Clientes.Post;
      btClientes.Caption := 'Clientes' + #13 + '(' + IntToStr(FSTEPrincipal.Clientes.RecordCount) + ')';
      Exit;
    end;
    //
    if Clientes.State <> dsEdit then
      Try
        Clientes.Edit;
      Except
        Exit;
      End;
    if ClientesNome.AsString <> PedWrkNome.AsString then
      ClientesNome.AsString := PedWrkNome.AsString;
    if ClientesEndereco.AsString <> PedWrkEndereco.AsString then
      ClientesEndereco.AsString := PedWrkEndereco.AsString;
    if ClientesBairro.AsString <> PedWrkBairro.AsString then
      ClientesBairro.AsString := PedWrkBairro.AsString;
    if ClientesRefer.AsString <> PedWrkRefer.AsString then
      ClientesRefer.AsString := PedWrkRefer.AsString;
    if ClientesCPF_CNPJ.AsString <> PedWrkCPF_CNPJ.AsString then
      ClientesCPF_CNPJ.AsString := PedWrkCPF_CNPJ.AsString;
    ClientesDtCompra.AsDateTime := DateOf(Date);
    Clientes.Post;

  end;

end;


Function ValidaEntrega: Boolean;
var wMsg: String;
begin
  if not FSTEPrincipal.lValEntrega then
  begin
    Result := True;
    Exit;
  end;
  //
  Result := False;
  wMsg := '';
  if FSTEPrincipal.PedWrkEntrega.AsInteger = 0 then
  begin
     if FSTEPrincipal.PedWrkVlrTele.AsCurrency = 0 then
        wMsg := 'Valor tele-entrega não informado' + #13;
  end
  else if FSTEPrincipal.PedWrkVlrTele.AsCurrency > 0 then
         wMsg := wMsg + 'Valor tele-entrega informado para' + #13 +
                        'retirada ou consumo no local' + #13;
  if wMsg <> '' then
  begin
    wMsg := wMsg + #13 + 'Indique';
    if MessageDlg(wMsg,mtConfirmation,[mbYes,mbNo],0,mbYes,['Reinformar','Prosseguir']) = mrYes
      then Exit;
  end;
  Result := True;

end;

procedure TFSTEPrincipal.btAbrirPedidoClick(Sender: TObject);
begin
  Pedidos.Last;
  nroPed := PedidosNro.AsInteger + 1;
  //
  PanPedido.Align := alClient;
  PanPedido.Visible := True;
  btAbrirPedido.Enabled := False;
  btProdutos.Enabled := False;
  btClientes.Enabled := False;
  btConsultar.Enabled := False;
  PedWrk.Active := True;
  PedWrk.EmptyDataSet;
  PedWrk.Append;
  PedWrkNro.AsInteger := nroPed;
  PedWrkFone.AsString := '';
  case mpPadrao of               // Index
    0:PedWrkMeioPgto.AsInteger := 1;     // Reais
    1:PedWrkMeioPgto.AsInteger := 3;     // C.Crédito
    2:PedWrkMeioPgto.AsInteger := 4;     // C.Débito
    3:PedWrkMeioPgto.AsInteger := 17;    // PIX
    4:PedWrkMeioPgto.AsInteger := 99;    // Outros
  end;
  PedWrkEntrega.AsInteger := 0;              //0-Tele 1-Retira 2-Cons.local
  if rgTurno.ItemIndex = 0 then
    PedWrkTurno.AsString := 'D'
  else
    PedWrkTurno.AsString := 'N';
  PedWrkData.AsDateTime := DateOf(Date);
  LctWrk.Active := True;
  LctWrk.EmptyDataSet;
  RETexto.Lines.Clear;
  MemLcto.Lines.Clear;
  LabAltExc.Visible := False;
  btAcrescenta.Visible := False;

  CarregaProdsCombo;
  FSTEPrincipal.FormResize(nil);
  qtdLctos := 0;
  dbFone.SetFocus;

end;

procedure TFSTEPrincipal.btAcrescentaClick(Sender: TObject);
begin
  btSimClick(nil);

end;

procedure TFSTEPrincipal.btAlteraLctoClick(Sender: TObject);
begin
  Try
    LctWrk.Edit;
    dbProdCombo.SetFocus;
  Except
    MessageDlg('Não foi possível editar o lançamento',mtError,[mbOk],0);
  End;
  PanAlteraExclue.Visible := False;

end;

procedure TFSTEPrincipal.btIgnoraClick(Sender: TObject);
begin
  PanAlteraExclue.Visible := False;

end;

procedure TFSTEPrincipal.btCancelaClick(Sender: TObject);
begin
  btAbrirPedido.Enabled := True;
  btProdutos.Enabled := True;
  btClientes.Enabled := True;
  btConsultar.Enabled := True;

  PedWrk.EmptyDataSet;
  LctWrk.EmptyDataSet;

  btAbrirPedido.SetFocus;
  PanPedido.Visible := False;

end;

procedure TFSTEPrincipal.btClientesClick(Sender: TObject);
begin
  FSTEPrincipal.lManutClientes := False;
  FSTEPrincipal.Hide;
  FSTEClientes.ShowModal;
  FSTEPrincipal.Visible := True;
  btClientes.Caption := 'Clientes' + #13 + '(' + IntToStr(FSTEPrincipal.Clientes.RecordCount) + ')';
  if FSTEPrincipal.lManutClientes then
  begin
    SalvaDados(1,False);
    //gbCargaSalva.Visible := False;
  end;

end;

procedure TFSTEPrincipal.btFinalizaClick(Sender: TObject);
var sqLct: Integer;
begin
  if PedWrkZC_Troco.AsCurrency < 0 then
  begin
    MessageDlg('Valor pago insuficiente' + #13#13 +
               'Verifique "Pagamento" e/ou o "Vlr.pago" e reinforme',
               mtError,[mbOk],0);
    dbLkMeioPgto.SetFocus;
    Exit;
  end;
  //

  if PedWrkZC_Total.AsCurrency > 0 then
  begin
    Pedidos.Append;
    PedidosNro.AsInteger := PedWrkNro.AsInteger;
    PedidosFone.AsString := PedWrkFone.AsString;
    PedidosNome.AsString := PedWrkNome.AsString;
    PedidosEndereco.AsString := PedWrkEndereco.AsString;
    PedidosBairro.AsString := PedWrkBairro.AsString;
    PedidosRefer.AsString := PedWrkRefer.AsString;
    PedidosTotal.AsCurrency := PedWrkTotal.AsCurrency;
    PedidosVlrTele.AsCurrency := PedWrkVlrTele.AsCurrency;
    PedidosMeioPgto.AsInteger := PedWrkMeioPgto.AsInteger;
    PedidosVlrPago.AsCurrency := PedWrkVlrPago.AsCurrency;
    PedidosTurno.AsString := PedWrkTurno.AsString;
    PedidosData.AsDateTime := PedWrkData.AsDateTime;
    PedidosCPF_CNPJ.AsString := PedWrkCPF_CNPJ.AsString;
    PedidosEntrega.AsInteger := PedWrkEntrega.AsInteger;
    Pedidos.Post;
    //
    sqLct := 0;
    LctWrk.First;
    while not LctWrk.Eof do
    begin
      if LctWrkTotal.AsCurrency > 0 then
      begin
        sqLct := sqLct + 1;
        LctWrk.Edit;
        LctWrkPedNro.AsInteger := PedWrkNro.AsInteger;
        LctWrkLcto.AsInteger := sqLct;
        LctWrk.Post;
      end
      else
        LctWrk.Delete;
      LctWrk.Next;
    end;
    //
    LctWrk.First;
    while not LctWrk.Eof do
    begin
      PedLctos.Append;
      PedLctosPedNro.AsInteger := LctWrkPedNro.AsInteger;
      PedLctosLcto.AsInteger := LctWrkLcto.AsInteger;
      PedLctosQuant.AsInteger := LctWrkQuant.AsInteger;
      PedLctosProduto.AsString := LctWrkProduto.AsString;
      PedLctosObs1.AsString := LctWrkObs1.AsString;
      PedLctosObs2.AsString := LctWrkObs2.AsString;
      PedLctosValor.AsCurrency := LctWrkValor.AsCurrency;
      PedLctosTotal.AsCurrency := LctWrkTotal.AsCurrency;
      PedLctos.Post;
      LctWrk.Next;
    end;
    AtualizaCliente;
    ImprimePedido(FSTEPrincipal.lPreview, FSTEPrincipal.copias);
    if FSTEPrincipal.lImpInterno then
      ImprimeInterno(FSTEPrincipal.lPreview, FSTEPrincipal.copInterno);
    SalvaDados(4,False);
  end;
  btCancelaClick(nil);

end;

procedure TFSTEPrincipal.btConfirmaProdClick(Sender: TObject);
var wValor: Currency;
    xDescr,xQtd,xUnit,xTotal: String;
begin
  lLancando := False;
  if not lExclusao then
  begin
    if LctWrkObs1.AsString = '' then
      if LctWrkObs2.AsString <> '' then
      begin
        LctWrkObs1.AsString := LctWrkObs2.AsString;
        LctWrkObs2.Clear;
      end;
    LctWrk.Post;
  end;
//   Linha de 60 caracteres
// Qt Descrição                                   Unit    Total
// 123456789.123456789.123456789.123456789.1234567    1234
// 00 123456789.123456789.123456789.123456789. 1234567 12345678
// 123456789.123456789.123456789.123456789.123456789.123456789.
// 1234.123456789.123456789.123456789.123456789.123456789.12345
  RETexto.Lines.Clear;
  RETexto.SelAttributes.Color := clNavy;
  RETexto.SelAttributes.Underline := True;
  RETexto.SelAttributes.Bold := True;
  RETexto.Lines.Add(stringCompleta('Qtd Descrição','D',' ',47) + 'Unit    Total.');
  MemLcto.Lines.Clear;
  MemLcto.Lines.Add('0');
  //
  LctWrk.First;
  wValor := 0;
  while not LctWrk.Eof do
  begin
    wValor := wValor + LctWrkTotal.AsCurrency;
    //
    xQtd := stringCompleta(LctWrkQuant.AsString,'E',' ',2);
    xDescr := stringCompleta(LctWrkProduto.AsString,'D',' ',40);
    xUnit := stringCompleta(FloatToStrF(LctWrkValor.AsCurrency,ffNumber,15,2),'E',' ',7);
    xTotal := stringCompleta(FloatToStrF(LctWrkTotal.AsCurrency,ffNumber,15,2),'E',' ',8);
    if (LctWrkObs1.AsString = '') and (LctWrkObs2.AsString = '') then
      RETexto.SelAttributes.Underline := True;
    RETexto.Lines.Add(xQtd + ' ' + xDescr + ' ' + xUnit + ' ' + xTotal + '.');
    MemLcto.Lines.Add(LctWrkLcto.AsString);
    if LctWrkObs1.AsString <> '' then
    begin
      RETexto.SelAttributes.Color := clBlue;
      if LctWrkObs2.AsString = '' then
        RETexto.SelAttributes.Underline := True;
      RETexto.lines.Add('     ' + StringCompleta(LctWrkObs1.AsString,'D',' ',55) + '.');
      MemLcto.Lines.Add(LctWrkLcto.AsString);
      if LctWrkObs2.AsString <> '' then
      begin
        RETexto.SelAttributes.Color := clBlue;
        RETexto.SelAttributes.Underline := True;
        RETexto.lines.Add('     ' + StringCompleta(LctWrkObs2.AsString,'D',' ',55) + '.');
        MemLcto.Lines.Add(LctWrkLcto.AsString);
      end;
    end;
    LctWrk.Next;
  end;
  PedWrkTotal.AsCurrency := wValor;
  LabALtExc.Visible := False;
  if LctWrk.RecordCount > 0 then
    LabAltExc.Visible := True;
  Application.ProcessMessages;
  if not lExclusao then
    SolicitaInclusao(True);

end;

procedure TFSTEPrincipal.btExclueLctoClick(Sender: TObject);
begin
  Try
    LctWrk.Delete;
  Except
    MessageDlg('Não foi possível excluir o lançamento',mtError,[mbOk],0);
  End;
  PanAlteraExclue.Visible := False;
  btConfirmaProdClick(nil);

end;

procedure TFSTEPrincipal.btFinalizarClick(Sender: TObject);
begin
  if lUtilizar then
  begin
    if Pedidos.State = dsEdit then
      Pedidos.Cancel;
    FSTEPrincipal.Close;
  end
  else Application.Terminate;

end;

procedure TFSTEPrincipal.btNaoClick(Sender: TObject);
begin
  PanNovoLcto.Visible := False;
  if LctWrk.RecordCount = 0 then
  begin
    btCancelaClick(nil);
    Exit;
  end;
  edValorTele.SetFocus;

end;

procedure TFSTEPrincipal.btConsultarClick(Sender: TObject);
var wPedsTurno,wLctsTurno: String;
    wMsg: String;
begin
  wPedsTurno := FSTEPrincipal.pathDados + 'PedidosTurno.XML';
  wLctsTurno := FSTEPrincipal.pathDados + 'LanctosTurno.XML';
  FSTEPrincipal.Pedidos.SaveToFile(wPedsTurno,dfXMLUTF8);
  FSTEPrincipal.PedLctos.SaveToFile(wLctsTurno,dfXMLUTF8);
  //
  wMsg := 'Pedidos ';
  if Pedidos.Active then
    wMsg := wMsg + 'ABERTO ' + IntToStr(Pedidos.RecordCount) + ' pedidos' + #13
  else
    wMsg := wMsg + 'Fechado' + #13;
  wMsg := wMsg + 'Lanctos ';
  if PedLctos.Active then
    wMsg := wMsg + 'ABERTO ' + IntToStr(PedLctos.RecordCount) + ' lanctos'+ #13
  else
    wMsg := wMsg + 'Fechado' + #13;
  //
  SalvaDados(4,True);
  ConsultaPedidos;
  //
  Pedidos.Active := False;
  PedLctos.Active := False;
  Pedidos.LoadFromFile(wPedsTurno);
  PedLctos.LoadFromFile(wLctsTurno);
  //
  Pedidos.Active := True;
  PedLctos.Active := True;

end;

procedure TFSTEPrincipal.btProdutosClick(Sender: TObject);
begin
  FSTEPrincipal.Hide;
  FSTEProdutos.ShowModal;
  FSTEPrincipal.Visible := True;
  btProdutos.Caption := 'Produtos' + #13 + '(' + IntToStr(FSTEPrincipal.Produtos.RecordCount) + ')';
  SalvaDados(2,False);

end;

procedure TFSTEPrincipal.btSimClick(Sender: TObject);
begin
  PanNovoLcto.Visible := False;
  InclueLancamento;

end;

procedure TFSTEPrincipal.dbBairroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbCPF_CNPJExit(Sender: TObject);
begin
  if not ValidaCNPJ_CPF(FSTEPrincipal.PedWrkCPF_CNPJ.AsString) then
  begin
    MessageDlg('CPF / CNPJ inválido, reinforme',mtError,[mbOk],0);
    dbCPF_CNPJ.SetFocus;
  end;
  if PedWrkCPF_CNPJ.AsString = '' then
      PedWrkCPF_CNPJ.EditMask := ''
  else if Length(Trim(PedWrkCPF_CNPJ.AsString)) > 11 then
          PedWrkCPF_CNPJ.EditMask := '00\.000\.000/0000-00;0; '
       else
          PedwrkCPF_CNPJ.EditMask := '000\.000\.000-00;0; ';

end;

procedure TFSTEPrincipal.dbCPF_CNPJKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbEnderKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbEnderKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbFoneDblClick(Sender: TObject);
var xFone: String;
begin
  if PesquisaClientes(xFone) then
  begin
    PedWrkFone.AsString := xFone;
    //dbFone.Text := xFone;
    dbFoneExit(nil);
  end
  else dbFone.Text := '';

end;

procedure TFSTEPrincipal.dbFoneExit(Sender: TObject);
var xFone: String;
begin
  lCadastrado := False;
  xFone := dbFone.Text;
  if xFone = '' then
  begin
    // Forçando a saída do pedido
    PedWrkFone.AsString := '11111';
    dbNome.SetFocus;
    dbProdCombo.SetFocus;
    PanNovoLcto.Visible := False;
    btCancelaClick(nil);
    qtdLctos := 1;
    Exit;
  end;

  if Clientes.IndexName <> 'Fone' then
  begin
    Clientes.IndexName := 'Fone';
    Clientes.First;
  end;
  if Clientes.FindKey([xFone]) then
  begin
    PedWrkNome.AsString := ClientesNome.AsString;
    PedWrkEndereco.AsString := ClientesEndereco.AsString;
    PedWrkBairro.AsString := ClientesBairro.AsString;
    PedWrkRefer.AsString := ClientesRefer.AsString;
    PedWrkCPF_CNPJ.AsString := Trim(ClientesCPF_CNPJ.AsString);
    if Length(Trim(PedWrkCPF_CNPJ.AsString)) > 11 then
      PedWrkCPF_CNPJ.EditMask := '00\.000\.000/0000-00;0; '
    else
      PedwrkCPF_CNPJ.EditMask := '000\.000\.000-00;0; ';
    lCadastrado := True;
    dbProdCombo.SetFocus;
  end
  else dbNome.SetFocus;

end;

procedure TFSTEPrincipal.dbFoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vK_F2 then
  begin
    dbFoneDblClick(nil);
    Exit;
  end;
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbFoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;


procedure TFSTEPrincipal.dbLkEntregaExit(Sender: TObject);
begin
  if not ValidaEntrega then
    edValorTele.SetFocus;

end;

procedure TFSTEPrincipal.dbLkEntregaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbLkEntregaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbLkMeioPgtoExit(Sender: TObject);
begin
  if PedWrkMeioPgto.AsInteger = 1 then        // Dinheiro
    dbVlrPago.SetFocus
  else
    PedWrkVlrPago.AsCurrency := PedWrkZC_Total.AsCurrency;
  //  btFinaliza.SetFocus;

end;

procedure TFSTEPrincipal.dbLkMeioPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbLkMeioPgtoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbObs1Change(Sender: TObject);
begin
  if Length(Trim(dbObs1.Text)) = 50 then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbObs1Exit(Sender: TObject);
begin
  if dbObs1.Text = '' then
    dbUnit.SetFocus;

end;

procedure TFSTEPrincipal.dbObs1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbObs1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbObs2Change(Sender: TObject);
begin
  if Length(Trim(dbObs2.Text)) = 50 then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbObs2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbObs2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbProdComboExit(Sender: TObject);
var xKey: String;
begin
  if dbProdCombo.Text = '' then
  begin
    edValorTele.SetFocus;
    Exit;
  end;
  xKey := LctWrkProduto.AsString;
  Produtos.FindNearest([xKey]);
  if Pos(xKey,ProdutosDescr.AsString) > 0 then
  begin
    LctWrkValor.AsCurrency := ProdutosValor.AsCurrency;
    dbQtd.SetFocus;
    Exit;
  end;
  MessageDlg('Produto não localizado, reinforme',mtError,[mbOk],0);
  dbProdCombo.SetFocus;

end;

procedure TFSTEPrincipal.dbProdComboKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbProdComboKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbProxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbProxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbQtdExit(Sender: TObject);
begin
  if LctWrkQuant.AsInteger < 1 then
  begin
    MessageDlg('Quantidade não pode ser menor que 1, reinforme',mtError,[mbOk],0);
    dbQtd.SetFocus;
  end;
  LctWrkTotal.AsCurrency := LctWrkValor.AsCurrency * LctWrkQuant.AsInteger;

end;

procedure TFSTEPrincipal.dbQtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbUnitExit(Sender: TObject);
begin
  LctWrkTotal.AsCurrency := LctWrkValor.AsCurrency * LctWrkQuant.AsInteger;
  btConfirmaProd.SetFocus;

end;

procedure TFSTEPrincipal.dbUnitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbUnitKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.dbVlrPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.dbVlrPagoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.edValorTeleEnter(Sender: TObject);
begin
  if FSTEPrincipal.PedWrkTotal.AsCurrency = 0 then
  begin
    btCancelaClick(nil);
    Exit;
  end;
  LabTele.Caption := '---> Tele:';
  LabTele.Font.Style := [fsBold];


end;


procedure TFSTEPrincipal.edValorTeleExit(Sender: TObject);
begin
  LabTele.Caption := 'Tele:';
  LabTele.Font.Style := [];
  //  dbLkMeioPgto.SetFocus;

end;

procedure TFSTEPrincipal.edValorTeleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEPrincipal.edValorTeleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEPrincipal.FormActivate(Sender: TObject);
begin
  if not fTime then
    Exit;
  fTime := False;
//
  btAbrirPedido.Enabled := False;
  btConsultar.Enabled := False;
  btProdutos.Enabled := False;
  btClientes.Enabled := False;
  btFinalizar.Enabled := False;
//
  Configuracao;
  gbCargaSalva.Visible := True;
  LabIdent.Caption := FSTEPrincipal.idUsuario;
  Timer1Timer(nil);
  Timer1.Enabled := True;
  FGen.lSalvaForm := FSTEPrincipal.lSalvaForm;
  FGen.pathSalvaForm := FSTEPrincipal.pathSalvaForm;
  if FileExists(LogoInit) then
    Image1.Picture.LoadFromFile(LogoInit);
  if FileExists(LogoImpres) then
    Image2.Picture.LoadFromFile(LogoImpres);
  Form_Define(FSTEPrincipal);
  PanPedido.Visible := False;

  lUtilizar := True;
  if not DefineVerificaValidade(keyUsuar) then
    lUtilizar := False        // Halt(0);
  else if not CarregaDados then
       begin
         MessageDlg('Falha na carga de dados',mtError,[mbOk],0);
         lUtilizar := False;
       end;

  gbLanctos.Align := alLeft;
  gbTotaliz.Align := alClient;
  LabCPF_CNPJ.Visible := FSTEPrincipal.lInfCPF;
  dbCPF_CNPJ.Visible := FSTEPrincipal.lInfCPF;
  LabEntrega.Visible := FSTEPrincipal.lMdEntrega;
  dbLkEntrega.Visible := FSTEPrincipal.lMdEntrega;
  LabAbort.Visible := FSTEPrincipal.lDesenv;
  dbMeioPagto.Visible := FSTEPrincipal.lDesenv;
  btConsultar.Visible := FSTEPrincipal.lConsTurno;
  if lUtilizar then
  begin
    btProdutos.Caption := 'Produtos' + #13 + '(' + IntToStr(FSTEPrincipal.Produtos.RecordCount) + ')';
    btClientes.Caption := 'Clientes' + #13 + '(' + IntToStr(FSTEPrincipal.Clientes.RecordCount) + ')';
  end
  else begin
    btProdutos.Caption := 'Produtos' + #13 + '(..)';
    btClientes.Caption := 'Clientes' + #13 + '(..)';
  end;
  btAbrirPedido.Enabled := lUtilizar;   // True;
  btConsultar.Enabled := lUtilizar;     // True;
  btProdutos.Enabled := lUtilizar;      // True;
  btClientes.Enabled := lUtilizar;      // True;
  btFinalizar.Enabled := True;

end;


procedure TFSTEPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaDados(7,True);
  Form_Salva(FSTEPrincipal);

end;

procedure TFSTEPrincipal.FormCreate(Sender: TObject);
begin
  fTime := True;
  FSTEPrincipal.Width := 1240;
  FSTEPrincipal.Height := 640;

end;

procedure TFSTEPrincipal.FormResize(Sender: TObject);
begin
  if FSTEPrincipal.Width < 1240 then
    FSTEPrincipal.Width := 1240;
  if FSTEPrincipal.Height < 640 then
    FSTEPrincipal.Height := 640;
  btFinaliza.Left := btCancela.Left - 40;
  btFinaliza.Top := btCancela.Top - (btFinaliza.Height + 6);
  btAcrescenta.Left := btFinaliza.Left - 40;
  btAcrescenta.Top := btCancela.Top - (btFinaliza.Height + btAcrescenta.Height + 12);

end;

procedure TFSTEPrincipal.gbClienteExit(Sender: TObject);
begin
  if qtdLctos = 0 then
    SolicitaInclusao(lPrItemSN)
  else
    SolicitaInclusao(False);

end;

procedure TFSTEPrincipal.gbTotalizEnter(Sender: TObject);
begin
  btAcrescenta.Visible := True;

end;

procedure TFSTEPrincipal.gbTotalizExit(Sender: TObject);
begin
  btAcrescenta.Visible := False;

end;

procedure TFSTEPrincipal.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    ConfigSistema;
  Configuracao;
  LabIdent.Caption := FSTEPrincipal.idUsuario;
  Timer1Timer(nil);
  Timer1.Enabled := True;
  FGen.lSalvaForm := FSTEPrincipal.lSalvaForm;
  FGen.pathSalvaForm := FSTEPrincipal.pathSalvaForm;
  if FileExists(LogoInit) then
    Image1.Picture.LoadFromFile(LogoInit);
  if FileExists(LogoImpres) then
    Image2.Picture.LoadFromFile(LogoImpres);

end;

procedure TFSTEPrincipal.LabAbortClick(Sender: TObject);
begin
  Application.Terminate;

end;

procedure TFSTEPrincipal.PedidosCalcFields(DataSet: TDataSet);
begin
  PedidosZC_Total.AsCurrency := PedidosTotal.AsCurrency + PedidosVlrTele.AsCurrency;
  case PedidosMeioPgto.AsInteger of
    0:PedidosZC_MPgto.AsString := '';        // '* R$ *';
    1:PedidosZC_MPgto.AsString := 'R$';      // Dinheiro';
    3:PedidosZC_MPgto.AsString := 'CCr';     // C.Crédito';
    4:PedidosZC_MPgto.AsString := 'CDb';     // C.Débito';
    17:PedidosZC_MPgto.AsString := 'PIX';
    else PedidosZC_MPgto.AsString := 'Out';  // Outros';
  end;
  PedidosZC_FoneNome.AsString := Trim(PedidosFone.AsString) + ' ' + Trim(PedidosNome.AsString);
  case PedidosEntrega.AsInteger of
    0:PedidosZC_Entrega.AsString := 'Tele';
    1:PedidosZC_Entrega.AsString := 'Retira';
    2:PedidosZC_Entrega.AsString := 'Cons';
    else PedidosZC_Entrega.AsString := '*';
  end;

end;

procedure TFSTEPrincipal.PedWrkCalcFields(DataSet: TDataSet);
begin
  PedWrkZC_Total.AsCurrency := PedWrkTotal.AsCurrency + PedWrkVlrTele.AsCurrency;
  PedWrkZC_Troco.AsCurrency := PedWrkVlrPago.AsCurrency - PedWrkZC_Total.AsCurrency;
  if FSTEPrincipal.PedWrkTurno.AsString = 'D' then
    PedWrkZC_Turno.AsString := 'DIA'
  else if PedWrkTurno.AsString = 'N' then
         PedWrkZC_Turno.AsString := 'NOITE'
       else
         PedWrkZC_Turno.AsString := '***';
  case PedWrkMeioPgto.AsInteger of
    0:PedWrkZC_MPagto.AsString := '* R$ *';
    1:PedWrkZC_MPagto.AsString := 'Dinheiro';
    3:PedWrkZC_MPagto.AsString := 'C.Crédito';
    4:PedWrkZC_MPagto.AsString := 'C.Débito';
    17:PedWrkZC_MPagto.AsString := 'PIX';
    99:PedWrkZC_MPagto.AsString := 'Outros';
    else PedWrkZC_MPagto.AsString := '< ' + FSTEPrincipal.PedWrkMeioPgto.AsString + ' >';
  end;

end;

procedure TFSTEPrincipal.ProdutosBeforePost(DataSet: TDataSet);
begin
  ProdutosDescr.AsString := AnsiUpperCase(ProdutosDescr.AsString);

end;

procedure TFSTEPrincipal.RETextoDblClick(Sender: TObject);
var nLin,nLcto: Integer;
begin
  nLin := RE_ObterLinhaAtual(RETexto);
  nLcto := StrToIntDef(Trim(MemLcto.Lines[nlin]),0);
  //ShowMessage('DBlClick na linha:' + IntToStr(nLin) + '   Lcto='+ IntToStr(nLcto));
  if nLcto = 0 then
    Exit;
  if not LctWrk.FindKey([PedWrkNro.AsInteger,nLcto]) then
  begin
    MessageDlg('Lançamento não encontrado',mtError,[mbOk],0);
    Exit;
  end;
  PanAlteraExclue.Top := gbLanctos.Height - (PanNovoLcto.Height + 36);
  PanAlteraExclue.Left := 290;
  PanAlteraExclue.Visible := True;
  btIgnora.SetFocus;

end;

procedure TFSTEPrincipal.rgTurnoExit(Sender: TObject);
begin
  if rgTurno.ItemIndex < 0 then
  begin
    MessageDlg('Informe o turno de trabalho (Dia ou Noite)',mtError,[mbOk],0);
    rgTurno.SetFocus;
  end;

end;

procedure TFSTEPrincipal.Timer1Timer(Sender: TObject);
begin
  LabDataHora.Caption := DataHoraString(Now, 2, 7);   // DD/MM/AA Hr:Mi

end;

end.
