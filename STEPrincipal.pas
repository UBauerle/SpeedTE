unit STEPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.ExtCtrls, Vcl.StdCtrls, DateUtils,
  Data.DB, Datasnap.DBClient, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.Samples.Gauges,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Datasnap.Provider, MidasLib, System.UITypes;
  Function CarregaPedidos(pmtPeds:String; pmtLcts:String; pmtDiaAtual:Boolean; pmtExibe:Boolean=True): Boolean;
  Procedure ObtemCamposArqTexto(pmtLinha:String; pmtResult:TStringList; pmtMinimo:Integer);
  Function ValidaEntrega: Boolean;
  Procedure AtualizaCliente(pmtCadastrado:Boolean);
  Function SalvaDados(pmtInfo:Integer; pmtFecha:Boolean): Boolean;

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
    btPedidos: TBitBtn;
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
    PedidosVlrTele: TCurrencyField;
    PedidosMeioPgto: TSmallintField;
    PedidosVlrPago: TCurrencyField;
    PedWrkVlrTele: TCurrencyField;
    PedWrkMeioPgto: TSmallintField;
    PedWrkVlrPago: TCurrencyField;
    LabAbort: TLabel;
    PedWrkZC_Total: TCurrencyField;
    PedWrkZC_Troco: TCurrencyField;
    PedidosTurno: TStringField;
    PedWrkTurno: TStringField;
    SDSMeiosPgto: TDataSource;
    DSMeiosPgto: TClientDataSet;
    DSMeiosPgtoCodMP: TIntegerField;
    DSMeiosPgtoDescrMP: TStringField;
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
    btConsultar: TBitBtn;
    PedidosZC_Total: TCurrencyField;
    PedidosZC_MPgto: TStringField;
    PedWrkZC_Turno: TStringField;
    PedWrkZC_MPagto: TStringField;
    PedidosZC_FoneNome: TStringField;
    ClientesCPF_CNPJ: TStringField;
    PedidosEntrega: TSmallintField;
    PedWrkEntrega: TSmallintField;
    PedWrkCPF_CNPJ: TStringField;
    PedidosCPF_CNPJ: TStringField;
    DSEntrega: TClientDataSet;
    SDSEntrega: TDataSource;
    DSEntregaCod: TSmallintField;
    DSEntregaDescr: TStringField;
    PedidosZC_Entrega: TStringField;
    PedidosData: TDateTimeField;
    PedWrkData: TDateTimeField;
    PedWrkZC_TurnoNro: TStringField;
    PedWrkZC_DataHora: TStringField;
    PedidosZC_MPLst: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFinalizarClick(Sender: TObject);
    procedure btProdutosClick(Sender: TObject);
    procedure btClientesClick(Sender: TObject);
    procedure rgTurnoExit(Sender: TObject);
    procedure btPedidosClick(Sender: TObject);
    procedure ProdutosBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure LabAbortClick(Sender: TObject);
    procedure PedWrkCalcFields(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
    procedure PedidosCalcFields(DataSet: TDataSet);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    ultCliente,ultProduto,ultPedido: Integer;
    idUsuario,idLograd,idNro,idCompl,idBairro,idCidade,idUF,idInterno: String;
    idFone,idWhats: String;
    lSalvaForm,lCargaXML,lDesenv,lPrItemSN,lInfCPF: Boolean;
    lManutClientes,lConsTurno,lMdEntrega,lValEntrega: Boolean;
    mesesConsulta: Integer;
    pathSalvaForm,pathDados: String;
    hrIniNoite,mpPadrao,nIndexConsClie: Integer;
    dtAtual: String;
    tbClie,tbOldClie,tbProd,tbPeds,tbLcts: String;
    tbAllPeds,tbAllLcts: String;
    cadClientes,cadProdutos: String;
    LogoInit,LogoImpres,ImgCancel,ImgNormal: String;
    tmpProds: String;
    idPrinter: String;
    tmMax,margEsq,margDir,margTop,margBot,copias,copInterno,tempEspera: Integer;
    mdDtHr: Integer;
    loPedido,loInterno,finalPedido: Integer;
    linPedFixa,linIntFixa,lValorUnit: Boolean;
    lPreview,lDialog,lPrevCons,lImpInterno,lLctSemValor,lExCarga,lImpTurno,lSolCPF: Boolean;
    pixelHor,altExtra: Integer;
    keyUsuar: String;
    ddCheck: Integer;
    txtIncluir: String;
    wLogFile: String;

  end;

var
  FSTEPrincipal: TFSTEPrincipal;
  wMsg: String;
  lLancando,lExclusao: Boolean;
  fTime: Boolean;
  nroPed: Integer;
  qtdLctos: Integer;
  lSysValido: Boolean;

implementation

{$R *.dfm}

uses uGenericas, uVersaoPgm, STEProdutos, STEClientes, STEImpressao, STEConsTurno,
     STEConsCliente, STEConfigurar, STELctoPedido;


Procedure ObtemCamposArqTexto(pmtLinha:String; pmtResult:TStringList; pmtMinimo:Integer);
var xLinha: String;
    nP: Integer;
begin
  xLinha := pmtLinha + '|';
  nP := Pos('|',xLinha);
  while nP > 0 do
  begin
    pmtResult.Add(Copy(xLinha,1,nP-1));
    xLinha := Copy(xLinha,np+1,Length(xLinha)-nP);
    nP := Pos('|',xLinha);
  end;
  if pmtMinimo < 16 then
    pmtMinimo := 16;
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
    // Meios de pagamento
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
    // Tipos de produtos
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
    // Tipos de entrega
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
    // Clientes
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
    // Produtos
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
    // Pedidos do dia
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
    Pedidos.FieldDefs.Add('Data',     ftDateTime);
    Pedidos.FieldDefs.Add('CPF_CNPJ', ftString, 14);
    Pedidos.FieldDefs.Add('Entrega',  ftSmallint);
    Pedidos.FieldDefs.Add('Hora',     ftTime);
    Pedidos.IndexDefs.Add('','Nro',[ixPrimary,ixUnique]);
    Pedidos.CreateDataSet;
    Try
      Pedidos.Active := True;
      Pedidos.Active := False;
    Except
      wMsg := wMsg + '"Pedidos"' + #13;
      Result := Result + 1;
    End;
    // Lançamentos dos pedidos do dia
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
    // Pedido corrente
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
    PedWrk.FieldDefs.Add('Data',     ftDateTime);
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
    // Lançamentos do pedido corrente
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
//    if wMsg <> '' then
//      wMsg := 'Falha na criação de' + #13 + wMsg + #13;

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
  if (pmtNome = '') and (pmtEnder = '') then
    Exit;
  //
  Result := True;

end;


Function CarregaClientes: Boolean;
var lstWork: TStringList;
    i,gravs,descons,brancos: Integer;
    xLine,xKey,xNome,xEnder,xBair,xRefer,xCPF: String;
    wData: TDate;
begin
  Result := False;
  with FSTEPrincipal do
  begin
    if lCargaXML and                           // Carregar do XML e
       FileExists(cadClientes) then            // Existe o arquivo XML de clientes
    begin
       Clientes.LoadFromFile(cadClientes);     // Carrega do XML
       Clientes.FileName := cadClientes;
       if Clientes.RecordCount > 0 then
       begin
         Result := True;
         Exit;
       end;
    end;
    // Carga arquivo .DAT
    if not FileExists(tbClie) then
      if not FileExists(tbOldClie) then
      begin
        wMsg := wMsg + tbClie + #13 + tbOldClie + ' não encontrados' + #13;
        Exit;
      end;
    //
    lstWork := TStringList.Create;
    if FileExists(tbClie) then
      lstWork.LoadFromFile(tbClie)       // Carrega de clientes "atuais"
    else
      lstWork.LoadFromFile(tbOldClie);   // Carrega de clientes "iniciais"
    //
    if FileExists(cadClientes) then
      DeleteFile(cadClientes);
    //
    gbCargaSalva.Visible := True;
    gbCargaSalva.Caption := 'Carga: Clientes';
    Gauge1.Progress := 0;
    Gauge1.MaxValue := lstWork.Count;
    Application.ProcessMessages;
    Clientes.Active := True;
    ultCliente := 0;
    gravs := 0;
    descons := 0;
    brancos := 0;
    for i := 0 to lstWork.Count-1 do
    begin
      xLine := Trim(lstWork[i]);
      if xLine <> '' then
      begin
        wData  := DateOf(Date);
        xCPF   := '';
        if Length(xLine) < 116 then
        begin        // Carrega pelo layout original
          xKey   := Trim(Copy(xLine,1,15));
          xNome  := Trim(Copy(xLine,16,20));
          xEnder := Trim(Copy(xLine,36,30));
          xBair  := Trim(Copy(xLine,66,20));
          xRefer := Trim(Copy(xLine,86,30));
        end
        else begin   // Carrega pelo novo layout
          xKey   := Trim(Copy(xLine,1,15));
          xNome  := Trim(Copy(xLine,16,30));
          xEnder := Trim(Copy(xLine,46,40));
          xBair  := Trim(Copy(xLine,86,20));
          xRefer := Trim(Copy(xLine,106,40));
          if Length(xLine) > 145 then
          begin
            wData := StrToDate(Copy(xLine,146,10));
            if Length(xLine) > 155 then
              xCPF := Copy(xLine,156,14)
            else
              xCPF := '';
          end;
        end;
        if ValidaRegistro(xKey,xNome,xEnder) then
        begin
          ultCliente := ultCliente + 1;
          Clientes.Append;
          ClientesSeq.AsInteger := ultCliente;
          ClientesChave.AsString := xKey;
          ClientesNome.AsString := xNome;
          ClientesEndereco.AsString := xEnder;
          ClientesBairro.AsString := xBair;
          ClientesRefer.AsString := xRefer;
          ClientesDtCompra.AsDateTime := wData;
          ClientesCPF_CNPJ.AsString := xCPF;
          Try
            Clientes.Post;
            gravs := gravs + 1;
          Except
           Clientes.Cancel;
           descons := descons + 1;
          End;
        end
        else descons := descons + 1;
      end
      else brancos := brancos + 1;
      Gauge1.Progress := Gauge1.Progress + 1;
    end;
    Clientes.SaveToFile(cadClientes,dfXMLUTF8);
    Clientes.FileName := cadClientes;
    lstWork.Free;
    if lExCarga then
      MessageDlg('Clientes' + #13 +
                 'Lidos: ' + IntToStr(lstWork.Count) + #13 +
                 'Gravados: ' + IntToStr(gravs) + #13 +
                 'Desconsiderados: ' + IntToStr(descons) + #13 +
                 'Brancos: ' + IntToStr(brancos),mtInformation,[mbOk],0);
  end;
  Result := True;

end;


Function CarregaProdutos: Boolean;
var lstWork: TStringList;
    lidos,gravs,i: Integer;
    xLine,xNome,xTipo,xValor: String;
begin
  Result := False;
  with FSTEPrincipal do
  begin
    if lCargaXML and
       FileExists(cadProdutos) then
    begin
      Produtos.LoadFromFile(cadProdutos);
      Produtos.FileName := cadProdutos;
      ultProduto := 0;
      Produtos.Active := True;
      Produtos.First;
      while not Produtos.Eof do
      begin
        if ProdutosSeq.AsInteger > ultProduto  then
          ultProduto := ProdutosSeq.AsInteger;
        Produtos.Next;
      end;
      Result := True;
      Exit;
    end;
    //
    if not FileExists(tbProd) then
    begin
      wMsg := wMsg + tbProd + ' não encontrado' + #13;
       Exit;
    end;
    if FileExists(FSTEPrincipal.cadProdutos) then
      DeleteFile(FSTEPrincipal.cadProdutos);
    //
    lstWork := TStringList.Create;
    lstWork.LoadFromFile(tbProd);
    gbCargaSalva.Caption := 'Carga: Produtos';
    Gauge1.Progress := 0;
    Gauge1.MaxValue := lstWork.Count;
    Application.ProcessMessages;
    Produtos.Active := True;
    ultProduto := 0;
    lidos := 0;
    gravs := 0;
    for i := 0 to lstWork.Count-1 do
    begin
      xLine := lstWork[i];
      lidos := lidos + 1;
      if xLine <> '' then
      begin
        ultProduto := ultProduto + 1;
        Produtos.Append;
        ProdutosSeq.AsInteger := ultProduto;
        xLine := lstWork[i];
        if Length(xLine) < 40 then    // Carrega pelo layout original
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
        ProdutosDescr.AsString := xNome;
        ProdutosTipo.AsInteger := StrToIntDef(xTipo,0);
        ProdutosValor.AsCurrency := StrToFloat(xValor);
        Try
          Produtos.Post;
          gravs := gravs + 1;
        Except
          Produtos.Cancel;
        End;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
    end;
    Produtos.SaveToFile(cadProdutos,dfXMLUTF8);
    Produtos.FileName := cadProdutos;
    lstWork.Free;
    if lExCarga then
      MessageDlg('Produtos' + #13 +
                 'Lidos: ' + IntToStr(lidos) + #13 +
                 'Gravados: ' + IntToStr(gravs),mtInformation,[mbOk],0);
  end;
  Result := True;

end;

Function CarregaPedidos(pmtPeds:String; pmtLcts:String; pmtDiaAtual:Boolean; pmtExibe:Boolean=True): Boolean;
var wMsgLocal: String;
    lstWork: TStringList;
    xInfo: TStringList;
    i: Integer;
begin
  Result := False;
  wMsgLocal := '';
  if not FileExists(pmtPeds) then
    wMsgLocal := wMsgLocal + pmtPeds + ' não encontrado' + #13;
  if not FileExists(pmtLcts) then
    wMsgLocal := wMsgLocal + pmtLcts + ' não encontrado' + #13;
  if wMsgLocal <> '' then
    if not pmtDiaAtual then
      begin
        wMsg := wMsg + wMsgLocal;
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
var i: Integer;
//var lstWork,lstAuxil: TStringList;
//    i: Integer;
//    xValor,xTipo,xLine: String;
//    wData: TDateTime;
const codMP: array [0..4] of integer = (1,3,4,17,99);              // Meios de pagamento
      descrMP: array [0..4] of String = ('Dinheiro','C.Crédito','C.Débito','PIX','Outros');
      descrTp: array[0..7] of String = ('Indefinido',              // Tipos de produtos
                                        'Lanches',
                                        'Refeições',
                                        'Refrigerantes',
                                        'Águas',
                                        'Sucos',
                                        'Cervejas',
                                        'Beb c/alcool');
      descrEntr: array[0..2] of String = ('Tele-entrega','Retira','Consumo local');  // Forma de entrega
      xErro: String = #13 + 'Aplicação não pode ser iniciada' + #13;

begin
  Result := False;
  wMsg := '';
  if CriaDataSets > 0 then
  begin
    MessageDlg(wMsg + xErro,mtError,[mbOk],0);
    Exit;
  end;
  //
  with FSTEPrincipal do
  begin
    if not CarregaClientes then
      wMsg := wMsg + 'Carga clientes' + #13;
    if not CarregaProdutos then
      wMsg := wMsg + 'Carga Produtos' + #13;
    if not CarregaPedidos(tbPeds,tbLcts,True,True) then
      wMsg := wMsg + 'Carga Pedidos && Lançamentos' + #13;

    if wMsg <> '' then
    begin
      MessageDlg('Falha na carga dos pedidos do dia' + #13 + wMsg,mtError,[mbOk],0);
      Exit;
    end;
    //
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
    Clientes.Active := True;
    Clientes.IndexName := '';
    Clientes.Last;
    ultCliente := ClientesSeq.AsInteger;
    //
    Produtos.Active := True;
    //
    // Pedidos e lançamentos do dia
    if not CarregaPedidos(tbPeds,tbLcts,True,True) then
      MessageDlg('Falha na carga dos pedidos do dia',mtError,[mbOk],0)
    else begin
      Pedidos.Active := True;
      PedLctos.Active := True;
    end;
    gbCargaSalva.visible := False;
  end;
  Result := True;

end;


Function SalvaDados(pmtInfo:Integer; pmtFecha:Boolean): Boolean;
var lstWork: TStringList;
    xLinha,xValor,xDescr,xTipo: String;
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
    if (pmtInfo = 1) or
       (pmtInfo = 3) or
       (pmtInfo = 5) or
       (pmtInfo = 7) then
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
        lSalva := True;
        if ClientesChave.AsString = '' then
          lSalva := False
        else if (ClientesNome.AsString = '') and
                (ClientesEndereco.AsString = '') then
               lSalva := False
              else if ClientesDtCompra.AsDateTime < wDataLimite then
                lSalva := False;
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
    if (pmtInfo = 2) or
       (pmtInfo = 3) or
       (pmtInfo = 6) or
       (pmtInfo = 7) then
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
        if ProdutosDescr.AsString <> '' then
        begin
          xDescr := stringCompleta(ProdutosDescr.AsString,'D',' ',40);
          xTipo := ProdutosTipo.AsString;
          if xTipo = '' then
            xTipo := '0';
          xValor := ProdutosValor.AsString;
          if xValor = '' then
            xValor := '00';
          xLinha := xDescr + xTipo + xValor;
          lstWork.Add(xLinha);
        end;
        Produtos.Next;
        Gauge1.Progress := Gauge1.Progress + 1;
      end;
      lstWork.SaveToFile(tbProd);
      if pmtFecha then
        Produtos.Active := False;
    end;
    if (pmtInfo = 4) or
       (pmtInfo = 5) or
       (pmtInfo = 6) or
       (pmtInfo = 7) then
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
      while not PedLctos.Eof do
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


Procedure AtualizaCliente(pmtCadastrado:Boolean);
var xLinha: String;
    txtClientes: TextFile;
    naL: Integer;
begin
  with FSTEPrincipal do
  begin
    if (PedWrkFone.AsString = '') or
       (PedWrkNome.AsString = '') then
      Exit;
    //
    if not pmtCadastrado then
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
      ClientesDtCompra.AsDateTime := DateOf(Date);
      Clientes.Post;
      btClientes.Caption := 'Clientes' + #13 + '(' + IntToStr(FSTEPrincipal.Clientes.RecordCount) + ')';
      //
      xLinha := stringCompleta(ClientesChave.AsString,'D',' ',15) +
                stringCompleta(ClientesNome.AsString,'D',' ',30) +
                stringCompleta(ClientesEndereco.AsString,'D',' ',40) +
                stringCompleta(ClientesBairro.AsString,'D',' ',20) +
                stringCompleta(ClientesRefer.AsString,'D',' ',40) +
                DateToStr(ClientesDtCompra.AsDateTime) +
                stringCompleta(ClientesCPF_CNPJ.AsString,'E',' ',14);
      AppendDAT(FSTEPrincipal.tbCLie, xLinha);
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
    //

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

procedure TFSTEPrincipal.btPedidosClick(Sender: TObject);
begin
  FSTEPrincipal.Hide;
  if not LctWrk.Active then
    LctWrk.Active := True;
  if not PedWrk.Active then
    PedWrk.Active := True;
  FSTELctoPedido.ShowModal;
  FSTEPrincipal.Visible := True;

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

procedure TFSTEPrincipal.btFinalizarClick(Sender: TObject);
begin
  if lSysValido then
  begin
    if Pedidos.State = dsEdit then
      Pedidos.Cancel;
    FSTEPrincipal.Close;
  end
  else Application.Terminate;

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
  FSTEConsTurno.lAtivo := False;
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

procedure TFSTEPrincipal.FormActivate(Sender: TObject);
begin
  if not fTime then
    Exit;
  fTime := False;
  btPedidos.Enabled := False;
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

  lSysValido := True;
  if not DefineVerificaValidade(keyUsuar) then
    lSysValido := False
  else if not CarregaDados then
       begin
         MessageDlg('Falha na carga de dados',mtError,[mbOk],0);
         lSysValido := False;
       end;

  LabAbort.Visible := FSTEPrincipal.lDesenv;
  btConsultar.Visible := FSTEPrincipal.lConsTurno;
  if lSysValido then
  begin
    btProdutos.Caption := 'Produtos' + #13 + '(' + IntToStr(FSTEPrincipal.Produtos.RecordCount) + ')';
    btClientes.Caption := 'Clientes' + #13 + '(' + IntToStr(FSTEPrincipal.Clientes.RecordCount) + ')';
  end
  else begin
    btProdutos.Caption := 'Produtos' + #13 + '(..)';
    btClientes.Caption := 'Clientes' + #13 + '(..)';
  end;
  btPedidos.Enabled := lSysValido;
  btConsultar.Enabled := lSysValido;
  btProdutos.Enabled := lSysValido;
  btClientes.Enabled := lSysValido;
  btFinalizar.Enabled := True;
  if lSysValido then
    btPedidos.SetFocus
  else
    btFinalizar.SetFocus;

end;


procedure TFSTEPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SalvaDados(7,True);
  Form_Salva(FSTEPrincipal);

end;

procedure TFSTEPrincipal.FormCreate(Sender: TObject);
begin
  fTime := True;
  Self.Caption := 'SpeedTE - ' + GetApplicationVersion;
  Width := 1240;
  Height := 640;
  wLogFile := ChangeFileExt(Application.ExeName,'.Log');

end;

procedure TFSTEPrincipal.FormResize(Sender: TObject);
begin
  if FSTEPrincipal.Width < 1240 then
    FSTEPrincipal.Width := 1240;
  if FSTEPrincipal.Height < 640 then
    FSTEPrincipal.Height := 640;

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
  PedidosZC_MPLst.AsString := PedidosZC_MPgto.AsString;
  if PedidosEntrega.AsInteger >= 10 then
    PedidosZC_MPLst.AsString := 'CAN';
  PedidosZC_FoneNome.AsString := Trim(PedidosFone.AsString) + ' ' + Trim(PedidosNome.AsString);
  case PedidosEntrega.AsInteger of
     0:PedidosZC_Entrega.AsString := 'Tele';
     1:PedidosZC_Entrega.AsString := 'Retira';
     2:PedidosZC_Entrega.AsString := 'Cons';
    10:PedidosZC_Entrega.AsString := 'Canc-Tele';
    11:PedidosZC_Entrega.AsString := 'Canc-Retira';
    12:PedidosZC_Entrega.AsString := 'Canc-Cons';
    else if PedidosEntrega.AsInteger < 10 then
           PedidosZC_Entrega.AsString := '*'
         else
           PedidosZC_Entrega.AsString := 'Cancelado';
  end;


end;

procedure TFSTEPrincipal.PedWrkCalcFields(DataSet: TDataSet);
var xData,xHora: String;
const x1: String = ' ';
      x2: String = '  ';
      x3: String = '   ';
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
  PedWrkZC_TurnoNro.AsString := PedWrkTurno.AsString + '  ' + PedWrkNro.AsString;
  xData := DateToStr(DateOf(PedWrkData.AsDateTime));
  if mdDtHr = 1 then
    xData := Copy(xData,1,6) + Copy(xData,9,2);
  xHora := Copy(TimeToStr(TimeOf(PedWrkData.AsDateTime)),1,5);
  PedWrkZC_DataHora.AsString := xData + '  ' + xHora;

end;

procedure TFSTEPrincipal.ProdutosBeforePost(DataSet: TDataSet);
begin
  ProdutosDescr.AsString := AnsiUpperCase(ProdutosDescr.AsString);

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
