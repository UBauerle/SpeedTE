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
    btFechPeriodo: TBitBtn;
    PanSelTurnos: TPanel;
    Label10: TLabel;
    btImprInterno: TBitBtn;
    Label11: TLabel;
    dtPicIni: TDateTimePicker;
    Label12: TLabel;
    dtPicFim: TDateTimePicker;
    cbDatas: TCheckBox;
    cbTurnos: TComboBox;
    Label13: TLabel;
    btProsseg: TBitBtn;
    btCancel: TBitBtn;
    TurnosData: TDateField;
    TurnosSelec: TStringField;
    TurnosTurno: TStringField;
    TurnosTxDtTurno: TStringField;
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
    procedure btFechPeriodoClick(Sender: TObject);
    procedure btImprInternoClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure cbDatasClick(Sender: TObject);
    procedure cbDatasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbDatasKeyPress(Sender: TObject; var Key: Char);
    procedure dtPicIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtPicFimKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbTurnosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dtPicIniKeyPress(Sender: TObject; var Key: Char);
    procedure dtPicFimKeyPress(Sender: TObject; var Key: Char);
    procedure cbTurnosKeyPress(Sender: TObject; var Key: Char);
    procedure GridTurnosDblClick(Sender: TObject);
    procedure btProssegClick(Sender: TObject);
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

const
  msgSemMovto: String = 'Turno sem movimentação';

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas, STEImpressao;


Function ObtemTurnos(pmtPath:String; pmtMeses:Integer=12): Boolean;
var wArqs: TStringDynArray;
    i,nTurno,ddAno,wAnoMes,wAnoMesLimite: Integer;
    AA,MM,DD: Word;
    xPedidos,xTurno,xLanctos,xAno,xDia,xMes: String;
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
    Turnos.FieldDefs.Add('Turno',     ftString, 1);
    Turnos.FieldDefs.Add('TxTurno',   ftString, 5);
    Turnos.FieldDefs.Add('TxDtTurno', ftString, 7);
    Turnos.FieldDefs.Add('IdPedidos', ftString, 120);
    Turnos.FieldDefs.Add('IdLanctos', ftString, 120);
    Turnos.FieldDefs.Add('Selec',     ftString, 1);
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
      if Pos('_Lct',xPedidos) = 0 then
      begin                   //  Ped_250621D  Ped_250621D_Lct         Ped_250621N  Ped_250621N_Lct
        xTurno := Copy(xPedidos,11,1);     // 'D'ia ou 'N'oite
        xAno := Copy(xPedidos,5,2);
        xMes := Copy(xPedidos,7,2);
        xDia := Copy(xPedidos,9,2);
        AA := StrToIntDef(xAno,0) + 2000;
        MM := StrToIntDef(xMes,0);
        DD := StrToIntDef(xDia,0);
        wAnoMes := (AA * 100) + MM;
        wData := EncodeDate(AA,MM,DD);
        ddAno := DayOfTheYear(wData);       // Dias decorridos no ano
        xLanctos := pmtPath + Copy(xPedidos,1,11) + '_Lct.DAT';
        //
        if wAnoMes >= wAnoMesLimite then
        begin                // Considera o turno no prazo de pesquisa
          Turnos.Append;
          TurnosData.AsDateTime := EncodeDate(AA,MM,DD);
          TurnosTurno.AsString := xTurno;
          if xTurno = 'D' then
            TurnosTxTurno.AsString := 'Dia'
          else
            TurnosTxTurno.AsString := 'Noite';
          TurnosTxDtTurno.AsString := xAno + xMes + xDia + xTurno;
          TurnosIdPedidos.AsString := wArqs[i];
          TurnosIdLanctos.AsString := xLanctos;
          TurnosSelec.AsString := '';
          Turnos.Post;
        end;
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
    btImprInterno.Visible := FSTEPrincipal.lImpInterno;
    Form_Define(FSTEConsTurno);
    FormResize(nil);
    ShowModal;

  end;

end;

Procedure ExibeSelecaoDeTurnos(pmtModo:Boolean);
var AA,MM,DD: word;
begin
  with FSTEConsTurno do
  begin
    PanSelTurnos.Visible := pmtModo;
    if pmtModo then
    begin
      PanSelTurnos.Left := 28;
      PanSelTurnos.Top := 68;
      cbDatas.Checked := False;
      DecodeDate(Date,AA,MM,DD);
      dtPicIni.Date := EncodeDate(AA,MM,1);
      dtPicIni.Enabled := True;
      dtPicFim.Date := DateOf(Date);
      dtPicFim.Enabled := True;
      cbTurnos.ItemIndex := 2;
    end;
    if pmtModo then
      pmtModo := False
    else
      pmtModo := True;
    GridTurnos.Enabled := pmtModo;
    NavTurnos.Enabled := pmtModo;
    GridPedidos.Enabled := pmtModo;
    NavPedidos.Enabled := pmtModo;
    btVisualizar.Enabled := pmtModo;
    btImprimir.Enabled := pmtModo;
    btImprInterno.Enabled := pmtModo;
    btFechamento.Enabled := pmtModo;
    btFechPeriodo.Enabled := pmtModo;
    btSair.Enabled := pmtModo;

  end;

end;


procedure TFSTEConsTurno.btCancelClick(Sender: TObject);
begin
  ExibeSelecaoDeTurnos(False);

end;

procedure TFSTEConsTurno.btFechamentoClick(Sender: TObject);
begin
  if FSTEPrincipal.Pedidos.RecordCount = 0 then
  begin
    MessageDlg(msgSemMovto,mtInformation,[mbOk],0);
    Exit;
  end;
  ImprimeFechamento(TurnosData.AsDateTime,
                    TurnosData.AsDateTime,
                    TurnosTurno.AsString,
                    tDin,tCCred,tCDeb,tPix,tOutros,
                    0,0,0,0,
                    0,0,0,0,
                    'Turno');

end;

procedure TFSTEConsTurno.btFechaVisClick(Sender: TObject);
begin
  PanVisualiz.Visible := False;
  REPedido.Lines.Clear;

end;

procedure TFSTEConsTurno.btFechPeriodoClick(Sender: TObject);
begin
  ExibeSelecaoDeTurnos(True);
  cbDatas.SetFocus;

end;

procedure TFSTEConsTurno.btImprimirClick(Sender: TObject);
begin
  if FSTEPrincipal.Pedidos.RecordCount = 0 then
  begin
    MessageDlg(msgSemMovto + #13 +
               'Não há pedidos a imprimir',mtInformation,[mbOk],0);
    Exit;
  end;
  Copia_Pedido_Wrk;
  if FSTEPrincipal.loPedido = 0 then
    ImprimePedido(FSTEPrincipal.lPrevCons)
  else
    ImprimePedidoRP(FSTEPrincipal.lPrevCons);
  Sleep(FSTEPrincipal.tempEspera);

end;

procedure TFSTEConsTurno.btImprInternoClick(Sender: TObject);
begin
  if FSTEPrincipal.Pedidos.RecordCount = 0 then
  begin
    MessageDlg(msgSemMovto + #13 +
               'Não há pedidos a imprimir',mtInformation,[mbOk],0);
    Exit;
  end;
  Copia_Pedido_Wrk;
  if FSTEPrincipal.loInterno = 0 then
    ImprimeInterno(FSTEPrincipal.lPrevCons)      // Cliente/Endereço TOPO
  else
    ImprimeInternoRP(FSTEPrincipal.lPrevCons);   // Cliente/Endereço RODAPE
  Sleep(FSTEPrincipal.tempEspera);

end;

procedure TFSTEConsTurno.btProssegClick(Sender: TObject);
var wArqs: TStringDynArray;
    i,j,nrSeq: Integer;
    xPedidos: String;
    xTurno,xAno,xMes,xDia: String;
    wAno,wMes,wDia: Word;
    selTurno: String;
    lstWork: TStringList;
    xInfo: TStringList;
    wDataIni,wDataFim: TDate;
    tDin,tCCred,tCDeb,tPix,tOutros: Currency;
    xTpFecham,xSelArquivos: String;
    totTurnos: array[1..2,1..3] of Currency;
    qtdTurnos: array[1..2] of Integer;
    idxTurno: Integer;

begin
  LabPedTurno.Caption := 'Pedidos de ' + DateToStr(dtPicIni.Date) + ' a ' +
                         DateToStr(dtPicFim.Date) + '   Turno: ' + cbTurnos.Text;
  lAtivo := False;
  FSTEPrincipal.Pedidos.Active := False;
  FSTEPrincipal.PedLctos.Active := False;
  FSTEPrincipal.Pedidos.Active := True;
  FSTEPrincipal.Pedidos.EmptyDataSet;
  case cbTurnos.ItemIndex of
    0:selTurno := 'D';
    1:selTurno := 'N';
    else selTurno := 'DN';
  end;
  if cbDatas.Checked then
  begin
    wDataIni := EncodeDate(2020,1,1);
    wDataFim := Date + 1;
    xTpFecham := 'Total';
  end
  else begin
    wDataIni := dtPicIni.Date;
    wDataFim := dtPicFim.Date;
    xTpFecham := 'Periodo';
  end;
  xSelArquivos := 'Ped_??????';
  if selTurno = 'DN' then
    xSelArquivos := xSelArquivos + '?'
  else begin
    xSelArquivos := xSelArquivos + selTurno;
    xTpFecham := 'PerTurno';
  end;
  xSelArquivos := xSelArquivos + '.DAT';        // 'Ped_' + '*.DAT'

  wArqs := TDirectory.GetFiles(FSTEPrincipal.pathDados,
                               xSelArquivos, TSearchOption.soTopDirectoryOnly);   //soAllDirectories: Pesquisa em todos os subdiretórios.
  nrSeq := 0;
  tDin := 0;
  tCCred := 0;
  tCDeb := 0;
  tPix := 0;
  tOutros := 0;
  for i := 1 to 2 do               // 1-Dia  2-Noite
  begin
    qtdTurnos[i] := 0;                // Qunatidade de pedidos
    for j := 1 to 3 do                // 1-Valor  2-Tele  3-Total
      totTurnos[i,j] := 0;
  end;
  //
  for i := Low(wArqs) to High(wArqs) do
  begin
    xPedidos := ExtractFileName(wArqs[i]);
    xTurno := Copy(xPedidos,11,1);     // 'D'ia ou 'N'oite
    if xTurno = 'D' then
      idxTurno := 1
    else
      idxTurno := 2;;
    xAno := Copy(xPedidos,5,2);
    xMes := Copy(xPedidos,7,2);
    xDia := Copy(xPedidos,9,2);
    AA := StrToIntDef(xAno,0) + 2000;
    MM := StrToIntDef(xMes,0);
    DD := StrToIntDef(xDia,0);
    if (EncodeDate(AA,MM,DD) >= wDataIni) and        // Data >= inicial
       (EncodeDate(AA,MM,DD) <= wDataFim) then       // Data <= final   - Turno é selecionado na carga dos arquivos
    begin
      lstWork := TStringList.Create;
      lstWork.LoadFromFile(wArqs[i]);
      for j := 0 to lstWork.Count-1 do
      begin
        xInfo:= TStringList.Create;
        ObtemCamposArqTexto(lstWork[j], xInfo, 14);
        FSTEPrincipal.Pedidos.Append;
        FSTEPrincipal.PedidosNro.AsInteger := nrSeq;    // StrToIntDef(xInfo[0],1);
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
          case FSTEPrincipal.PedidosMeioPgto.AsInteger of
            1:tDin := tDin + FSTEPrincipal.PedidosZC_Total.AsCurrency;
            3:tCCred := tCCred + FSTEPrincipal.PedidosZC_Total.AsCurrency;
            4:tCDeb := tCDeb + FSTEPrincipal.PedidosZC_Total.AsCurrency;
            17:tPix := tPix + FSTEPrincipal.PedidosZC_Total.AsCurrency;
            else tOutros := tOutros + FSTEPrincipal.PedidosZC_Total.AsCurrency;
          end;
          qtdTurnos[idxTurno] := qtdTurnos[idxTurno] + 1;
          totTurnos[idxTurno,1] := totTurnos[idxTurno,1] + FSTEPrincipal.PedidosTotal.AsCurrency;
          totTurnos[idxTurno,2] := totTurnos[idxTurno,2] + FSTEPrincipal.PedidosVlrTele.AsCurrency;
          totTurnos[idxTurno,3] := totTurnos[idxTurno,3] + FSTEPrincipal.PedidosVlrPago.AsCurrency;
        Except
          FSTEPrincipal.Pedidos.Cancel;
        End;
        nrSeq := nrSeq + 1;
        xInfo.Free;
      end;
    end;

    end;

  if FSTEPrincipal.Pedidos.RecordCount = 0 then
    MessageDlg('Não há movimentação no período / turnos selecionado',mtInformation,[mbOk],0)
  else
    ImprimeFechamento(dtPicIni.Date,
                      dtPicFim.Date,
                      selTurno,
                      tDin,tCCred,tCDeb,tPix,tOutros,
                      qtdTurnos[1],totTurnos[1,1],totTurnos[1,2],totTurnos[1,3],
                      qtdTurnos[2],totTurnos[2,1],totTurnos[2,2],totTurnos[2,3],
                      xTpFecham);
  ExibeSelecaoDeTurnos(False);
  //
  lAtivo := True;
  Turnos.Last;
  edTurnoChange(nil);

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
  begin
    MessageDlg(msgSemMovto + #13 +
               'Não há pedidos para visualização',mtInformation,[mbOk],0);
    Exit;
  end;
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

procedure TFSTEConsTurno.cbDatasClick(Sender: TObject);
begin
  if cbDatas.Checked then
    dtPicIni.Enabled := False
  else
    dtPicIni.Enabled := True;
  dtPicFim.Enabled := dtPicIni.Enabled;
  if dtPicIni.Enabled then
    dtPicIni.SetFocus
  else
    cbTurnos.SetFocus;

end;

procedure TFSTEConsTurno.cbDatasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEConsTurno.cbDatasKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEConsTurno.cbTurnosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEConsTurno.cbTurnosKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEConsTurno.dtPicFimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEConsTurno.dtPicFimKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEConsTurno.dtPicIniKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEConsTurno.dtPicIniKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

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
  btImprInterno.Caption := 'Imprimir' + #13 + 'in&Terno';
  btFechamento.Caption := 'Imprimir' + #13 + '&fechamento';
  btFechPeriodo.Caption := 'Fechamento' + #13 + '&periódico';
  PanSelTurnos.Width := 268;
  btProsseg.Width := 124;
  btCancel.Width := 124;
  btProsseg.Left := 8;
  btCancel.Left := 136;

end;

procedure TFSTEConsTurno.FormResize(Sender: TObject);
begin
  if FSTEConsTurno.Width < 900 then
    FSTEConsTurno.Width := 900;
  if FSTEConsTurno.Height < 600 then
    FSTEConsTurno.Height := 600;
  GridTurnos := DefineGrid(GridTurnos,[0.55, 0.33, 0.10],1,0);
  if FSTEPrincipal.lMdEntrega then
    GridPedidos := DefineGrid(GridPedidos,[0.11,0.33,0.11,0.11,0.11,0.11,0.07],1,0)
  else
    GridPedidos := DefineGrid(GridPedidos,[0.11,0.33,0.11,0.11,0.11,0.11,0.00],1,0);

end;

procedure TFSTEConsTurno.GridTurnosDblClick(Sender: TObject);
begin
  Try
    Turnos.Edit;
    if TurnosSelec.AsString = '' then
      TurnosSelec.AsString := 'P'
    else
      TurnosSelec.AsString := '';
    Turnos.Post;
  Finally

  End;

end;

procedure TFSTEConsTurno.PanVisualizExit(Sender: TObject);
begin
  PanVisualiz.Visible := False;

end;

end.
