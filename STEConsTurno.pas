unit STEConsTurno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.IOUtils, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  DateUtils, Vcl.ComCtrls;

  Procedure ConsultaPedidos;

type
  TFSTEConsTurno = class(TForm)
    PanPedidos: TPanel;
    GridPedidos: TDBGrid;
    PanTurnos: TPanel;
    Label1: TLabel;
    Turnos: TClientDataSet;
    DSTurnos: TDataSource;
    TurnosData: TDateField;
    TurnosTurno: TSmallintField;
    GridTurnos: TDBGrid;
    PanRodape: TPanel;
    NavPedidos: TDBNavigator;
    btVisualizar: TBitBtn;
    btImprimir: TBitBtn;
    btSair: TBitBtn;
    Panel1: TPanel;
    NavTurnos: TDBNavigator;
    TurnosTxTurno: TStringField;
    LabTurnos: TLabel;
    TurnosTxDtTurno: TStringField;
    edTurno: TDBEdit;
    LabPedTurno: TLabel;
    TurnosIdPedidos: TStringField;
    TurnosIdLanctos: TStringField;
    PanVisualiz: TPanel;
    REPedido: TRichEdit;
    btFechaVis: TBitBtn;
    LabNRegs: TLabel;
    btFechamento: TBitBtn;
    PanFechamento: TPanel;
    gbTotais: TGroupBox;
    LabTotProd: TLabel;
    LabTele: TLabel;
    LabTotGeral: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    gbMPagto: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabDinheiro: TLabel;
    LabCCred: TLabel;
    LabCDeb: TLabel;
    LabPIX: TLabel;
    LabOutros: TLabel;
    procedure FormResize(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure edTurnoChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btImprimirClick(Sender: TObject);
    procedure btVisualizarClick(Sender: TObject);
    procedure btFechaVisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanVisualizExit(Sender: TObject);
    procedure btFechamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEConsTurno: TFSTEConsTurno;
  lAtivo: Boolean;
  tProds,tTele,tGeral: Currency;
  tDin,tCCred,tCDeb,tPix,tOutros: Currency;

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas, STEImpressao;


Function ObtemTurnos(pmtPath:String; pmtMeses:Integer=12): Boolean;
var wArqs: TStringDynArray;
    i,nTurno,ddAno,wAnoMes,wAnoMesLimite: Integer;
    AA,MM,DD: Word;
    xPedidos,xDtArq,xTurno,xLanctos: String;
    wData: TDate;
begin
  Result := False;
  with FSTEConsTurno do
  begin
    wData := DateOf(Date);
    wData := IncMonth(wData, -pmtMeses);
    DecodeDate(wData,AA,MM,DD);
    wAnoMesLimite := (AA * 100) + MM;         // Ana/mes mais antigo a considerar
    //
    Turnos.Active := False;
    Turnos.FieldDefs.Clear;
    Turnos.FieldDefs.Add('Data',      ftDate);
    Turnos.FieldDefs.Add('Turno',     ftSmallint);
    Turnos.FieldDefs.Add('TxTurno',   ftString, 5);
    Turnos.FieldDefs.Add('TxDtTurno', ftString, 7);
    Turnos.FieldDefs.Add('IdPedidos', ftString, 120);
    Turnos.FieldDefs.Add('IdLanctos', ftString, 120);
    Turnos.IndexDefs.Clear;
    Turnos.IndexDefs.Add('','Data;Turno',[ixPrimary,ixUnique]);
    Turnos.CreateDataSet;
    Try
      Turnos.Active := True;
    Except
      MessageDlg('Não foi possível criar "Turnos"',mtError,[mbOk],0);
      Exit;
    End;
    //
    wArqs := TDirectory.GetFiles(pmtPath,'Ped_' +'*.DAT', TSearchOption.soTopDirectoryOnly); //soAllDirectories: Pesquisa em todos os subdiretórios.
    for i := Low(wArqs) to High(wArqs) do
    begin
      xPedidos := ExtractFileName(wArqs[i]);
      xTurno := Copy(xPedidos,5,1);     // 'D'ia ou 'N'oite
      xDtArq := Copy(xPedidos,6,6);     // AAMMDD
      AA := StrToIntDef(Copy(xDtArq,1,2),0) + 2000;
      MM := StrToIntDef(Copy(xDtArq,3,2),0);
      DD := StrToIntDef(Copy(xDtArq,5,2),0);
      wAnoMes := (AA * 100) + MM;
      wData := EncodeDate(AA,MM,DD);
      ddAno := DayOfTheYear(wData);
      xLanctos := pmtPath + 'PedDet_' + Copy(xPedidos,5,Length(xPedidos)-4);
      //
      if wAnoMes >= wAnoMesLimite then
      begin                // Considera o turno no prazo de pesquisa
        Turnos.Append;
        TurnosData.AsDateTime := EncodeDate(AA,MM,DD);
        if xTurno = 'D' then
        begin
          TurnosTurno.AsInteger := 0;
          TurnosTxTurno.AsString := 'Dia';
          TurnosTxDtTurno.AsString := xDtArq + '0';
        end
        else begin
          TurnosTurno.AsInteger := 1;
          TurnosTxTurno.AsString := 'Noite';
          TurnosTxDtTurno.AsString := xDtArq + '1';
        end;
        TurnosIdPedidos.AsString := wArqs[i];
        TurnosIdLanctos.AsString := xLanctos;
        Turnos.Post;
      end;
    end;
    Result := True;

  end;

end;


Procedure Copia_Pedido_Wrk;
var i: Integer;
    xField: String;
begin
  with FSTEPrincipal do
  begin
    PedWrk.Active := True;
    PedWrk.EmptyDataSet;
    PedWrk.Append;
    for i := 0 to PedWrk.FieldDefs.Count-1 do
    begin
      xField := PedWrk.FieldDefs[i].Name;
      PedWrk.FieldByName(xField).AsVariant := Pedidos.FieldByName(xField).AsVariant;
    end;
    PedWrk.Post;
    //
    LctWrk.Active := True;
    LctWrk.EmptyDataSet;
    PedLctos.First;
    PedLctos.FindNearest([PedidosNro.AsInteger,0]);
    while (PedLctosPedNro.AsInteger = PedidosNro.AsInteger) and (not PedLctos.Eof) do
    begin
      LctWrk.Append;
      for i := 0 to LctWrk.FieldDefs.Count-1 do
      begin
        xField := LctWrk.FieldDefs[i].Name;
        LctWrk.FieldByName(xField).AsVariant := PedLctos.FieldByName(xField).AsVariant;
      end;
      LctWrk.Post;
      PedLctos.Next;
    end;

  end;

end;

Procedure ConsultaPedidos;
begin
  lAtivo := False;
  if not ObtemTurnos(FSTEPrincipal.pathDados, FSTEPrincipal.mesesConsulta) then
    Exit;
  //
  with FSTEConsTurno do
  begin
    Caption := 'Consultar pedidos';
    LabTurnos.Caption := IntToStr(Turnos.RecordCount) + ' Turnos';
    lAtivo := True;
    Turnos.Last;
    edTurnoChange(nil);
    Form_Define(FSTEConsTurno);
    FormResize(nil);
    ShowModal;

  end;


end;

procedure TFSTEConsTurno.btFechamentoClick(Sender: TObject);
begin
  if FSTEPrincipal.Pedidos.RecordCount = 0 then
    Exit;
  ImprimeFechamento(TurnosData.AsDateTime,TurnosTurno.AsString,
                    tDin,tCCred,tCDeb,tPix,tOutros);

end;

procedure TFSTEConsTurno.btFechaVisClick(Sender: TObject);
begin
  PanVisualiz.Visible := False;
  REPedido.Lines.Clear;

end;

procedure TFSTEConsTurno.btImprimirClick(Sender: TObject);
begin
  if FSTEPrincipal.Pedidos.RecordCount = 0 then
    Exit;
  Copia_Pedido_Wrk;
  ImprimePedido(FSTEPrincipal.lPrevCons);

end;

procedure TFSTEConsTurno.btSairClick(Sender: TObject);
begin
  PanVisualiz.Visible := False;
  REPedido.Lines.Clear;
  Close;

end;

procedure TFSTEConsTurno.btVisualizarClick(Sender: TObject);
var wLinha,xQtd,xDescr,xUnit,xTotal: String;
    nLin: Integer;

begin
  if FSTEPrincipal.Pedidos.RecordCount = 0 then
    Exit;
  Copia_Pedido_Wrk;
  REPedido.Lines.Clear;
  wLinha := StringCompleta('Nome: '+FSTEPrincipal.PedWrkNome.AsString,'D',' ',41);
  if FSTEPrincipal.lInfCPF then
    if FSTEPrincipal.PedidosCPF_CNPJ.AsString <> '' then
      wLinha := wLinha + stringCompleta('CPF/CNPJ: '+EditaCNPJ_CPF(FSTEPrincipal.PedidosCPF_CNPJ.AsString),'E',' ',26);
  REPedido.Lines.Add(wLinha);
  REPedido.Lines.Add('Fone: ' + FSTEPrincipal.PedWrkFone.AsString + '  ' +
                     'Data: '+ FSTEPrincipal.PedWrkData.AsString + ' ' +
                     'Turno: ' + FSTEPrincipal.PedWrkZC_Turno.AsString);
  REPedido.Lines.Add('End:' + FSTEPrincipal.PedidosEndereco.AsString + '   ' +
                      FSTEPrincipal.PedidosBairro.AsString);
  REPedido.Lines.Add('    ' + FSTEPrincipal.PedidosRefer.AsString);
  REPedido.Lines.Add(stringFiller('-',68));
  REPedido.SelAttributes.Color := clNavy;
  REPedido.SelAttributes.Underline := True;
  REPedido.SelAttributes.Bold := True;
  wLinha := stringCompleta('Qtd  Descrição','D',' ',52) + 'Unit       Total';
  REPedido.Lines.Add(wLinha);
  FSTEPrincipal.LctWrk.First;
  while not FSTEPrincipal.LctWrk.Eof do
  begin
    xQtd := stringCompleta(FSTEPrincipal.LctWrkQuant.AsString,'E',' ',3);
    xDescr := stringCompleta(FSTEPrincipal.LctWrkProduto.AsString,'D',' ',40);
    xUnit := stringCompleta(FloatToStrF(FSTEPrincipal.LctWrkValor.AsCurrency,ffNumber,15,2),'E',' ',9);
    xTotal := stringCompleta(FloatToStrF(FSTEPrincipal.LctWrkTotal.AsCurrency,ffNumber,15,2),'E',' ',10);
    if (FSTEPrincipal.LctWrkObs1.AsString = '') and (FSTEPrincipal.LctWrkObs2.AsString = '') then
      REPedido.SelAttributes.Underline := True;
    REPedido.Lines.Add(xQtd + '  ' + xDescr + '  ' + xUnit + '  ' + xTotal);
    if FSTEPrincipal.LctWrkObs1.AsString <> '' then
    begin
      REPedido.SelAttributes.Color := clBlue;
      if FSTEPrincipal.LctWrkObs2.AsString = '' then
        REPedido.SelAttributes.Underline := True;
      REPedido.Lines.Add('     ' + StringCompleta(FSTEPrincipal.LctWrkObs1.AsString,'D',' ',62) + '.');
      if FSTEPrincipal.LctWrkObs2.AsString <> '' then
      begin
        REPedido.SelAttributes.Color := clBlue;
        REPedido.SelAttributes.Underline := True;
        REPedido.lines.Add('     ' + StringCompleta(FSTEPrincipal.LctWrkObs2.AsString,'D',' ',62) + '.');
      end;
    end;
    FSTEPrincipal.LctWrk.Next;
  end;
  REPedido.Lines.Add(stringFiller('-',68));
  wLinha := 'Valor: ' + FloatToStrF(FSTEPrincipal.PedWrkTotal.AsCurrency,ffNumber,15,2) +
            '   Tele: ' + FloatToStrF(FSTEPrincipal.PedWrkVlrTele.AsCurrency,ffNumber,10,2) +
            '   Total: ' + FloatToStrF(FSTEPrincipal.PedWrkZC_Total.AsCurrency,ffNumber,15,2) +
            '   Pagto: ' + FSTEPrincipal.PedWrkZC_MPagto.AsString;
  REPedido.Lines.Add(stringCompleta(wLinha,'C',' ',68));
  REPedido.Lines.Add(stringFiller('-',68));
  PanVisualiz.Top := 68;
  PanVisualiz.Height := GridPedidos.Height - 76;
  PanVisualiz.Visible := True;
  nLin := SendMessage(REPedido.Handle, EM_LINEINDEX, 0, 0);      // Obtém o índice da primeira linha (linha 0)
  REPedido.SelStart := nLin;                                     // Define o início da seleção para o início da linha
  REPedido.SetFocus;

{  Linha de 68 caracteres
123456789.123456789.123456789.123456789.123456789.123456789.123456789.123456789.
Fone:123456789.12345  Nome:123456789.123456789.123456789.  Dt/T:99/99/9999 XXXXX
End:123456789.123456789.123456789.123456789.  123456789.123456789.
    123456789.123456789.123456789.123456789.
Qtd  Descrição                                      Unit       Total
123  123456789.123456789.123456789.123456789.  12.456,89  123.567,90
123456789.123456789.123456789.123456789.123456789.123456789.12345678
}

end;

procedure TFSTEConsTurno.edTurnoChange(Sender: TObject);
begin
  if not lAtivo then
    Exit;
  //
  LabPedTurno.Caption := 'Pedidos  Data: ' + TurnosData.AsString + '  Turno: ' + TurnosTxTurno.AsString;
  FSTEPrincipal.Pedidos.Active := False;
  FSTEPrincipal.PedLctos.Active := False;
  if not CarregaPedidos(TurnosIdPedidos.AsString, TurnosIdLanctos.AsString, False, False) then
  begin
    MessageDlg('Não foi possível carregar pedidos e lançamentos indicados',mtError,[mbOk],0);
    Exit;
  end;
  LabNRegs.Caption := IntToStr(FSTEPrincipal.Pedidos.RecordCount) + ' pedidos';
  tProds := 0;
  tTele := 0;
  tGeral := 0;
  tDin := 0;
  tCCred := 0;
  tCDeb := 0;
  tPix := 0;
  tOutros := 0;
  FSTEPrincipal.Pedidos.First;
  while not FSTEPrincipal.Pedidos.Eof do
  begin
    tProds := tProds + FSTEPrincipal.PedidosTotal.AsCurrency;
    tTele := tTele + FSTEPrincipal.PedidosVlrTele.AsCurrency;
    tGeral := tGeral + FSTEPrincipal.PedidosZC_Total.AsCurrency;
    case FSTEPrincipal.PedidosMeioPgto.AsInteger of
      1:tDin := tDin + FSTEPrincipal.PedidosZC_Total.AsCurrency;
      3:tCCred := tCCred + FSTEPrincipal.PedidosZC_Total.AsCurrency;
      4:tCDeb := tCDeb + FSTEPrincipal.PedidosZC_Total.AsCurrency;
      17:tPix := tPix + FSTEPrincipal.PedidosZC_Total.AsCurrency;
      else tOutros := tOutros + FSTEPrincipal.PedidosZC_Total.AsCurrency;
    end;
    FSTEPrincipal.Pedidos.Next;
  end;
  LabTotProd.Caption := FloatToStrF(tProds,ffNumber,15,2);
  LabTele.Caption := FloatToStrF(tTele,ffNumber,15,2);
  LabTotGeral.Caption := FloatToStrF(tGeral,ffNumber,15,2);
  LabDinheiro.Caption := FloatToStrF(tDin,ffNumber,15,2);
  LabCCred.Caption := FloatToStrF(tCCred,ffNumber,15,2);
  LabCDeb.Caption := FloatToStrF(tCDeb,ffNumber,15,2);
  LabPix.Caption := FloatToStrF(tPix,ffNumber,15,2);
  LabOutros.Caption := FloatToStrF(tOutros,ffNumber,15,2);
  FormResize(nil);

end;

procedure TFSTEConsTurno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FSTEConsTurno);
  Close;

end;

procedure TFSTEConsTurno.FormCreate(Sender: TObject);
begin
  btVisualizar.Caption := '&Visualizar'  +  #13 + 'pedido';
  btImprimir.Caption := '&Imprimir'+ #13 + 'pedido';
  btFechamento.Caption := 'Imprimir' + #13 + '&fechamento';

end;

procedure TFSTEConsTurno.FormResize(Sender: TObject);
begin
  if FSTEConsTurno.Width < 900 then
    FSTEConsTurno.Width := 900;
  if FSTEConsTurno.Height < 600 then
    FSTEConsTurno.Height := 600;
  GridTurnos := DefineGrid(GridTurnos,[0.60, 033],1,0);
  if FSTEPrincipal.lMdEntrega then
    GridPedidos := DefineGrid(GridPedidos,[0.11,0.33,0.11,0.11,0.11,0.11,0.07],1,0)
  else
    GridPedidos := DefineGrid(GridPedidos,[0.11,0.33,0.11,0.11,0.11,0.11,0.00],1,0);

end;

procedure TFSTEConsTurno.PanVisualizExit(Sender: TObject);
begin
  PanVisualiz.Visible := False;

end;

end.
