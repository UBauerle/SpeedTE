unit STELctoPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB;



type
  TFSTELctoPedido = class(TForm)
    PanWork: TPanel;
    PanNovoLcto: TPanel;
    LabIncluirLcto: TLabel;
    btSim: TBitBtn;
    btNao: TBitBtn;
    PanAlteraExclue: TPanel;
    Label8: TLabel;
    btAlteraLcto: TBitBtn;
    btExclueLcto: TBitBtn;
    btIgnora: TBitBtn;
    PanTotalizacao: TPanel;
    PanIdCliente: TPanel;
    Label14: TLabel;
    LabFone: TLabel;
    dbFone: TDBEdit;
    Label2: TLabel;
    dbNome: TDBEdit;
    Label3: TLabel;
    dbEnder: TDBEdit;
    Label4: TLabel;
    dbBairro: TDBEdit;
    Label5: TLabel;
    dbProx: TDBEdit;
    LabCPF_CNPJ: TLabel;
    dbCPF_CNPJ: TDBEdit;
    btConfCliente: TBitBtn;
    MemLcto: TMemo;
    Label18: TLabel;
    btAcrescenta: TBitBtn;
    btFinaliza: TBitBtn;
    btCancela: TBitBtn;
    PanLancto: TPanel;
    Label19: TLabel;
    PanItem: TPanel;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    dbProdCombo: TDBComboBox;
    dbQtd: TDBEdit;
    dbObs1: TDBEdit;
    dbObs2: TDBEdit;
    dbUnit: TDBEdit;
    dbTotal: TDBEdit;
    btConfirmaProd: TBitBtn;
    RETexto: TRichEdit;
    btDdCliente: TBitBtn;
    PanDuploClick: TPanel;
    imgAponta: TImage;
    PanTotalizTop: TPanel;
    Label7: TLabel;
    dbSubTotal: TDBEdit;
    edValorTele: TDBEdit;
    LabTele: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    dbLkMeioPgto: TDBLookupComboBox;
    Label15: TLabel;
    dbMeioPagto: TDBText;
    dbVlrPago: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    dbTroco: TDBEdit;
    dbLkEntrega: TDBLookupComboBox;
    LabEntrega: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbFoneDblClick(Sender: TObject);
    procedure dbFoneExit(Sender: TObject);
    procedure dbNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbEnderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbProxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbCPF_CNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbNomeKeyPress(Sender: TObject; var Key: Char);
    procedure dbEnderKeyPress(Sender: TObject; var Key: Char);
    procedure dbBairroKeyPress(Sender: TObject; var Key: Char);
    procedure dbProxKeyPress(Sender: TObject; var Key: Char);
    procedure dbCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure dbCPF_CNPJExit(Sender: TObject);
    procedure btConfClienteClick(Sender: TObject);
    procedure dbFoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbFoneKeyPress(Sender: TObject; var Key: Char);
    procedure dbProdComboExit(Sender: TObject);
    procedure dbProdComboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbObs1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbObs2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbUnitKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbProdComboKeyPress(Sender: TObject; var Key: Char);
    procedure dbObs1KeyPress(Sender: TObject; var Key: Char);
    procedure dbObs2KeyPress(Sender: TObject; var Key: Char);
    procedure dbUnitKeyPress(Sender: TObject; var Key: Char);
    procedure dbObs1Change(Sender: TObject);
    procedure dbObs1Exit(Sender: TObject);
    procedure dbObs2Change(Sender: TObject);
    procedure dbUnitExit(Sender: TObject);
    procedure dbQtdKeyPress(Sender: TObject; var Key: Char);
    procedure btConfirmaProdClick(Sender: TObject);
    procedure btSimClick(Sender: TObject);
    procedure btNaoClick(Sender: TObject);
    procedure RETextoDblClick(Sender: TObject);
    procedure btAcrescentaClick(Sender: TObject);
    procedure btAlteraLctoClick(Sender: TObject);
    procedure btExclueLctoClick(Sender: TObject);
    procedure btIgnoraClick(Sender: TObject);
    procedure dbLkMeioPgtoExit(Sender: TObject);
    procedure dbLkMeioPgtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLkMeioPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure dbVlrPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbVlrPagoKeyPress(Sender: TObject; var Key: Char);
    procedure dbLkEntregaExit(Sender: TObject);
    procedure dbLkEntregaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbLkEntregaKeyPress(Sender: TObject; var Key: Char);
    procedure btFinalizaClick(Sender: TObject);
    procedure dbQtdExit(Sender: TObject);
    procedure edValorTeleEnter(Sender: TObject);
    procedure edValorTeleExit(Sender: TObject);
    procedure edValorTeleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edValorTeleKeyPress(Sender: TObject; var Key: Char);
    procedure dbFoneEnter(Sender: TObject);
    procedure btDdClienteClick(Sender: TObject);
    procedure dbProxExit(Sender: TObject);
    procedure dbProdComboEnter(Sender: TObject);
    procedure dbProdComboClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTELctoPedido: TFSTELctoPedido;
  fTime: Boolean;
  wLogFile: String;
  nroPed,qtdLctos: Integer;
  xFone: String;
  lCadastrado: Boolean;
  lForcaFechamento: Boolean;

implementation

{$R *.dfm}

uses STEPrincipal, STEConsCliente, uGenericas, STEImpressao;


Procedure CalculaTotalPedido;
var wTotal: Currency;
begin
  wTotal := 0;
  FSTEPrincipal.LctWrk.First;
  while not FSTEPrincipal.LctWrk.Eof do
  begin
    if (FSTEPrincipal.LctWrkProduto.AsString = '') or
       ((FSTEPrincipal.LctWrkValor.AsCurrency = 0) and (not FSTEPrincipal.lLctSemValor)) then
      FSTEPrincipal.LctWrk.Delete
    else begin
      wTotal := wTotal + FSTEPrincipal.LctWrkTotal.AsCurrency;
      FSTEPrincipal.LctWrk.Next;
    end;
  end;
  if FSTEPrincipal.PedWrk.State <> dsEdit then
    FSTEPrincipal.PedWrk.Edit;
  FSTEPrincipal.PedWrkTotal.AsCurrency := wTotal;

end;


Procedure MontaTextoPedido;
var xQtd,xDescr,xUnit,xTotal,xFinal: String;
begin
//   Linha de 60 caracteres
// Qt Descrição                                   Unit    Total
// 123456789.123456789.123456789.123456789.1234567    1234
// 00 123456789.123456789.123456789.123456789. 1234567 12345678
// 123456789.123456789.123456789.123456789.123456789.123456789.
// 1234.123456789.123456789.123456789.123456789.123456789.12345
  xFinal := '.';
  with FSTELctoPedido do
  begin
    MemLcto.Lines.Clear;
    MemLcto.Lines.Add('0');
    RETexto.Lines.Clear;
    RETexto.SelAttributes.Color := clNavy;
    RETexto.SelAttributes.Underline := True;
    RETexto.SelAttributes.Bold := True;
    RETexto.Lines.Add(stringCompleta('Qtd Descrição','D',' ',47) + 'Unit    Total.');
    FSTEPrincipal.LctWrk.First;
    while not FSTEPrincipal.LctWrk.Eof do
    begin
      xQtd := stringCompleta(FSTEPrincipal.LctWrkQuant.AsString,'E',' ',2);
      xDescr := stringCompleta(FSTEPrincipal.LctWrkProduto.AsString,'D',' ',40);
      xUnit := stringCompleta(FloatToStrF(FSTEPrincipal.LctWrkValor.AsCurrency,ffNumber,15,2),'E',' ',7);
      xTotal := stringCompleta(FloatToStrF(FSTEPrincipal.LctWrkTotal.AsCurrency,ffNumber,15,2),'E',' ',8);
      if (FSTEPrincipal.LctWrkObs1.AsString = '') and
         (FSTEPrincipal.LctWrkObs2.AsString = '') then
        RETexto.SelAttributes.Underline := True;
      RETexto.Lines.Add(xQtd + '  ' + xDescr + xUnit + ' ' + xTotal + xFinal);
      MemLcto.Lines.Add(FSTEPrincipal.LctWrkLcto.AsString);
      if FSTEPrincipal.LctWrkObs1.AsString <> '' then
      begin
        RETexto.SelAttributes.Color := clBlue;
        if FSTEPrincipal.LctWrkObs2.AsString = '' then
          RETexto.SelAttributes.Underline := True;
        RETexto.lines.Add('     ' + StringCompleta(FSTEPrincipal.LctWrkObs1.AsString,'D',' ',55) + xFinal);
        MemLcto.Lines.Add(FSTEPrincipal.LctWrkLcto.AsString);
        if FSTEPrincipal.LctWrkObs2.AsString <> '' then
        begin
          RETexto.SelAttributes.Color := clBlue;
          RETexto.SelAttributes.Underline := True;
          RETexto.lines.Add('     ' + StringCompleta(FSTEPrincipal.LctWrkObs2.AsString,'D',' ',55) + xFinal);
          MemLcto.Lines.Add(FSTEPrincipal.LctWrkLcto.AsString);
        end;
      end;
      FSTEPrincipal.LctWrk.Next;
    end;
  end;

end;


Procedure SolicitaInclusao(pVisual:Boolean);
begin
  with FSTELctoPedido do
  begin
    if pVisual then
    begin
      PanNovoLcto.Top := PanDuploClick.Top - (PanNovoLcto.Height + 12);
      PanNovoLcto.Left := PanLancto.Left + 100;
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
  end;
  FSTELctoPedido.PanTotalizTop.Enabled := False;
  FSTELctoPedido.PanItem.Enabled := True;
  FSTELctoPedido.btConfirmaProd.Enabled := True;
  FSTELctoPedido.dbProdCombo.SetFocus;

end;




procedure TFSTELctoPedido.btAcrescentaClick(Sender: TObject);
begin
  InclueLancamento;

end;

procedure TFSTELctoPedido.btAlteraLctoClick(Sender: TObject);
begin
  PanAlteraExclue.Visible := False;
  PanItem.Enabled := True;
  btConfirmaProd.Enabled := True;
  Try
    FSTEPrincipal.LctWrk.Edit;
    dbProdCombo.SetFocus;
  Except
    MessageDlg('Não foi possível editar o lançamento',mtError,[mbOk],0);
    PanItem.Enabled := False;
    btConfirmaProd.Enabled := False;
  End;

end;

procedure TFSTELctoPedido.btCancelaClick(Sender: TObject);
begin
  lLancando := False;
  FSTEPrincipal.LctWrk.Active := False;
  FSTEPrincipal.PedWrk.Active := False;
  if lForcaFechamento then
  begin
    Close;
    Exit;
  end;
  if FSTEPrincipal.finalPedido = 1 then
  begin
    fTime := True;
    FSTELctoPedido.FormActivate(nil);
    Exit;
  end;
  Close;

end;

procedure TFSTELctoPedido.btConfClienteClick(Sender: TObject);
begin
  PanIdCliente.Enabled := False;
  btConfCliente.Enabled := False;
  btDdCliente.Enabled := True;
  if FSTEPrincipal.LctWrk.RecordCount = 0 then
    InclueLancamento
  else begin
     PanTotalizTop.Enabled := True;
     edValorTele.SetFocus;
  end;

end;

procedure TFSTELctoPedido.btConfirmaProdClick(Sender: TObject);
begin
  if lLancando then        // Lancando item
    if (FSTEPrincipal.LctWrkTotal.AsCurrency = 0) and           // Valor ZERADO e
       (not FSTEPrincipal.lLctSemValor) then                    // Não aceita item sem valor
      if MessageDlg('Lançamento SEM VALOR' + #13#13 +
                    FSTEPrincipal.LctWrkProduto.AsString + #13#13 +
                    'Incluir no pedido/comanda?',
                    mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrNo then
      begin
        FSTEPrincipal.LctWrk.Delete;
        SolicitaInclusao(True);
        Exit;
      end;
  //
  lLancando := False;
  if not lExclusao then
  begin
    if FSTEPrincipal.LctWrkObs1.AsString = '' then
      if FSTEPrincipal.LctWrkObs2.AsString <> '' then
      begin
        FSTEPrincipal.LctWrkObs1.AsString := FSTEPrincipal.LctWrkObs2.AsString;
        FSTEPrincipal.LctWrkObs2.Clear;
      end;
    FSTEPrincipal.LctWrk.Post;
  end;
  CalculaTotalPedido;
  MontaTextoPedido;
  Application.ProcessMessages;
  SolicitaInclusao(True);

end;

procedure TFSTELctoPedido.btDdClienteClick(Sender: TObject);
begin
  PanIdCliente.Enabled := True;
  btConfCliente.Enabled := True;
  PanTotalizTop.Enabled := False;
  dbNome.SetFocus;

end;

procedure TFSTELctoPedido.btExclueLctoClick(Sender: TObject);
begin
  PanAlteraExclue.Visible := False;
  Try
    FSTEPrincipal.LctWrk.Delete;
  Except
    MessageDlg('Não foi possível excluir o lançamento',mtError,[mbOk],0);
  End;
  CalculaTotalPedido;
  MontaTextoPedido;
  Application.ProcessMessages;
  SolicitaInclusao(True);

end;


procedure TFSTELctoPedido.btFinalizaClick(Sender: TObject);
var sqLct: Integer;
    usaLancto: Boolean;
begin
  if FSTEPrincipal.PedWrkTotal.AsCurrency = 0 then
  begin
    btCancelaClick(nil);
    Exit;
  end;
  if FSTEPrincipal.PedWrkZC_Troco.AsCurrency < 0 then
  begin
    MessageDlg('Valor pago insuficiente' + #13#13 +
               'Verifique "Pagamento" e/ou o "Vlr.pago" e reinforme',
               mtError,[mbOk],0);
    dbLkMeioPgto.SetFocus;
    Exit;
  end;
  //
  CalculaTotalPedido;
  FSTEPrincipal.Pedidos.Append;
  FSTEPrincipal.PedidosNro.AsInteger := FSTEPrincipal.PedWrkNro.AsInteger;
  FSTEPrincipal.PedidosFone.AsString := FSTEPrincipal.PedWrkFone.AsString;
  FSTEPrincipal.PedidosNome.AsString := FSTEPrincipal.PedWrkNome.AsString;
  FSTEPrincipal.PedidosEndereco.AsString := FSTEPrincipal.PedWrkEndereco.AsString;
  FSTEPrincipal.PedidosBairro.AsString := FSTEPrincipal.PedWrkBairro.AsString;
  FSTEPrincipal.PedidosRefer.AsString := FSTEPrincipal.PedWrkRefer.AsString;
  FSTEPrincipal.PedidosTotal.AsCurrency := FSTEPrincipal.PedWrkTotal.AsCurrency;
  FSTEPrincipal.PedidosVlrTele.AsCurrency := FSTEPrincipal.PedWrkVlrTele.AsCurrency;
  FSTEPrincipal.PedidosMeioPgto.AsInteger := FSTEPrincipal.PedWrkMeioPgto.AsInteger;
  FSTEPrincipal.PedidosVlrPago.AsCurrency := FSTEPrincipal.PedWrkVlrPago.AsCurrency;
  FSTEPrincipal.PedidosTurno.AsString := FSTEPrincipal.PedWrkTurno.AsString;
  FSTEPrincipal.PedidosData.AsDateTime := Now;                        // PedWrkData.AsDateTime;
  FSTEPrincipal.PedidosCPF_CNPJ.AsString := FSTEPrincipal.PedWrkCPF_CNPJ.AsString;
  FSTEPrincipal.PedidosEntrega.AsInteger := FSTEPrincipal.PedWrkEntrega.AsInteger;
  FSTEPrincipal.Pedidos.Post;
  //
  sqLct := 0;
  FSTEPrincipal.LctWrk.First;
  while not FSTEPrincipal.LctWrk.Eof do
  begin
    sqLct := sqLct + 1;
    FSTEPrincipal.PedLctos.Append;
    FSTEPrincipal.PedLctosPedNro.AsInteger := FSTEPrincipal.LctWrkPedNro.AsInteger;
    FSTEPrincipal.PedLctosLcto.AsInteger := sqLct;
    FSTEPrincipal.PedLctosQuant.AsInteger := FSTEPrincipal.LctWrkQuant.AsInteger;
    FSTEPrincipal.PedLctosProduto.AsString := FSTEPrincipal.LctWrkProduto.AsString;
    FSTEPrincipal.PedLctosObs1.AsString := FSTEPrincipal.LctWrkObs1.AsString;
    FSTEPrincipal.PedLctosObs2.AsString := FSTEPrincipal.LctWrkObs2.AsString;
    FSTEPrincipal.PedLctosValor.AsCurrency := FSTEPrincipal.LctWrkValor.AsCurrency;
    FSTEPrincipal.PedLctosTotal.AsCurrency := FSTEPrincipal.LctWrkTotal.AsCurrency;
    FSTEPrincipal.PedLctos.Post;
    FSTEPrincipal.LctWrk.Next;
  end;
  AtualizaCliente(lCadastrado);
  if FSTEPrincipal.loPedido = 0 then
    ImprimePedido(FSTEPrincipal.lPreview, FSTEPrincipal.copias)    // Cliente/Endereço TOPO
  else
    ImprimePedidoRP(FSTEPrincipal.lPreview, FSTEPrincipal.copias);    // Cliente/Endereço Rodape
  if FSTEPrincipal.lImpInterno then
    if FSTEPrincipal.loInterno = 0 then
      ImprimeInterno(FSTEPrincipal.lPreview, FSTEPrincipal.copInterno)   // Cliente/Endereço TOPO
    else
      ImprimeInternoRP(FSTEPrincipal.lPreview, FSTEPrincipal.copInterno);   // Cliente/Endereço Rodape
  //
  SalvaDados(4,False);
  FSTEPrincipal.LctWrk.Active := False;
  FSTEPrincipal.PedWrk.Active := False;
  //
  if FSTEPrincipal.finalPedido = 1 then
  begin
    fTime := True;
    FSTELctoPedido.FormActivate(nil);
    Exit;
  end;
  Close;

end;

procedure TFSTELctoPedido.btIgnoraClick(Sender: TObject);
begin
  PanItem.Enabled := True;
  PanAlteraExclue.Visible := False;

end;

procedure TFSTELctoPedido.btNaoClick(Sender: TObject);
begin
  PanNovoLcto.Visible := False;
  btConfirmaProd.Enabled := False;
  if FSTEPrincipal.LctWrk.RecordCount = 0 then
  begin
    btCancelaClick(nil);
    Exit;
  end;
  PanTotalizTop.Enabled := True;

  edValorTele.SetFocus;

end;

procedure TFSTELctoPedido.btSimClick(Sender: TObject);
begin
  PanNovoLcto.Visible := False;
  InclueLancamento;

end;

procedure TFSTELctoPedido.dbBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbCPF_CNPJExit(Sender: TObject);
begin
  if not ValidaCNPJ_CPF(FSTEPrincipal.PedWrkCPF_CNPJ.AsString) then
  begin
    MessageDlg('CPF / CNPJ inválido, reinforme',mtError,[mbOk],0);
    dbCPF_CNPJ.SetFocus;
    Exit;
  end;
  if FSTEPrincipal.PedWrkCPF_CNPJ.AsString = '' then
    FSTEPrincipal.PedWrkCPF_CNPJ.EditMask := ''
  else if Length(Trim(FSTEPrincipal.PedWrkCPF_CNPJ.AsString)) > 11 then
         FSTEPrincipal. PedWrkCPF_CNPJ.EditMask := '00\.000\.000/0000-00;0; '
       else
         FSTEPrincipal.PedwrkCPF_CNPJ.EditMask := '000\.000\.000-00;0; ';
  btConfCliente.Enabled := True;
  btConfCliente.SetFocus;

end;

procedure TFSTELctoPedido.dbCPF_CNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbEnderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbEnderKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbFoneDblClick(Sender: TObject);
begin
  if PesquisaClientes(xFone) then
  begin
    FSTEPrincipal.PedWrkFone.AsString := xFone;
    dbFoneExit(nil);
  end
  else dbFone.Text := '';

end;


procedure TFSTELctoPedido.dbFoneEnter(Sender: TObject);
begin
  imgAponta.Visible := True;
  LabFone.Font.Style := [fsBold];
  lForcaFechamento := False;

end;

procedure TFSTELctoPedido.dbFoneExit(Sender: TObject);
begin
  imgAponta.Visible := False;
  LabFone.Font.Style := [];
  lCadastrado := False;
  if dbFone.Text = '' then
  begin
    lForcaFechamento := True;
    btCancelaClick(nil);
    Exit;
  end;
  if FSTEPrincipal.Clientes.IndexName <> 'Fone' then
  begin
    FSTEPrincipal.Clientes.IndexName := 'Fone';
    FSTEPrincipal.Clientes.First;
  end;
  if FSTEPrincipal.Clientes.FindKey([dbFone.Text]) then
  begin
    FSTEPrincipal.PedWrkNome.AsString := FSTEPrincipal.ClientesNome.AsString;
    FSTEPrincipal.PedWrkEndereco.AsString := FSTEPrincipal.ClientesEndereco.AsString;
    FSTEPrincipal.PedWrkBairro.AsString := FSTEPrincipal.ClientesBairro.AsString;
    FSTEPrincipal.PedWrkRefer.AsString := FSTEPrincipal.ClientesRefer.AsString;
    FSTEPrincipal.PedWrkCPF_CNPJ.AsString := Trim(FSTEPrincipal.ClientesCPF_CNPJ.AsString);
    if Length(Trim(FSTEPrincipal.PedWrkCPF_CNPJ.AsString)) > 11 then
      FSTEPrincipal.PedWrkCPF_CNPJ.EditMask := '00\.000\.000/0000-00;0; '
    else
      FSTEPrincipal.PedwrkCPF_CNPJ.EditMask := '000\.000\.000-00;0; ';
    lCadastrado := True;
    btConfCliente.Enabled := True;
    btConfCliente.SetFocus;
  end
  else dbNome.SetFocus;

end;

procedure TFSTELctoPedido.dbFoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F2 then
    dbFoneDblClick(nil)
  else
    if Key = Vk_Return then
      SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbFoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbLkEntregaExit(Sender: TObject);
begin
  if not ValidaEntrega then
    edValorTele.SetFocus;

end;

procedure TFSTELctoPedido.dbLkEntregaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbLkEntregaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbLkMeioPgtoExit(Sender: TObject);
begin
  if FSTEPrincipal.PedWrkMeioPgto.AsInteger = 1 then        // Dinheiro
    dbVlrPago.SetFocus
  else
    FSTEPrincipal.PedWrkVlrPago.AsCurrency := FSTEPrincipal.PedWrkZC_Total.AsCurrency;

end;

procedure TFSTELctoPedido.dbLkMeioPgtoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbLkMeioPgtoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbObs1Change(Sender: TObject);
begin
  if FSTEPrincipal.LctWrk.Active then
    if Length(Trim(dbObs1.Text)) = 45 then
      SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbObs1Exit(Sender: TObject);
begin
  if dbObs1.Text = '' then
    dbUnit.SetFocus;

end;

procedure TFSTELctoPedido.dbObs1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbObs1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbObs2Change(Sender: TObject);
begin
  if FSTEPrincipal.LctWrk.Active then
    if Length(Trim(dbObs2.Text)) = 45 then
      SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbObs2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbObs2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbProdComboClick(Sender: TObject);
begin
  if FSTEPrincipal.expanProds = 2 then
    SendMessage(dbProdCombo.Handle, CB_SHOWDROPDOWN, 1, 0);

end;

procedure TFSTELctoPedido.dbProdComboEnter(Sender: TObject);
begin
  if FSTEPrincipal.expanProds = 0 then
    SendMessage(dbProdCombo.Handle, CB_SHOWDROPDOWN, 1, 0);

end;

procedure TFSTELctoPedido.dbProdComboExit(Sender: TObject);
var xKey: String;
begin
  if dbProdCombo.Text = '' then
  begin
    FSTEPrincipal.LctWrk.Delete;
    if FSTEPrincipal.PedWrkTotal.AsCurrency = 0 then
    begin
      btCancelaClick(nil);
      Exit;
    end;
    btConfirmaProd.Enabled := False;
    PanItem.Enabled := False;
    PanTotalizTop.Enabled := True;
    edValorTele.SetFocus;
    Exit;
  end;
  xKey := FSTEPrincipal.LctWrkProduto.AsString;
  FSTEPrincipal.Produtos.FindNearest([xKey]);
  if Pos(xKey,FSTEPrincipal.ProdutosDescr.AsString) > 0 then
  begin
    FSTEPrincipal.LctWrkValor.AsCurrency := FSTEPrincipal.ProdutosValor.AsCurrency;
    dbQtd.SetFocus;
    Exit;
  end;
  MessageDlg('Produto não localizado, reinforme',mtError,[mbOk],0);
  dbProdCombo.SetFocus;

end;

procedure TFSTELctoPedido.dbProdComboKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
  begin
    SelectNext((Sender as TwinControl),True,True);
    Exit;
  end;
  if FSTEPrincipal.expanProds = 1 then
    SendMessage(dbProdCombo.Handle, CB_SHOWDROPDOWN, 1, 0);

end;

procedure TFSTELctoPedido.dbProdComboKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbProxExit(Sender: TObject);
begin
  if dbCPF_CNPJ.Visible then
    dbCPF_CNPJ.SetFocus
  else begin
    btConfCliente.Enabled := True;
    btConfCliente.SetFocus;
  end;

end;

procedure TFSTELctoPedido.dbProxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
    SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbProxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbQtdExit(Sender: TObject);
begin
  if lLancando then
  begin
    if FSTEPrincipal.LctWrkQuant.AsInteger < 1 then
    begin
      MessageDlg('Quantidade não pode ser menor que 1, reinforme',mtError,[mbOk],0);
      dbQtd.SetFocus;
    end;
    FSTEPrincipal.LctWrkTotal.AsCurrency := FSTEPrincipal.LctWrkValor.AsCurrency * FSTEPrincipal.LctWrkQuant.AsInteger;
  end;

end;

procedure TFSTELctoPedido.dbQtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbUnitExit(Sender: TObject);
begin
  if (FSTEPrincipal.LctWrk.State = dsEdit) or (FSTEPrincipal.LctWrk.State = dsInsert) then
    FSTEPrincipal.LctWrkTotal.AsCurrency := FSTEPrincipal.LctWrkValor.AsCurrency * FSTEPrincipal.LctWrkQuant.AsInteger;
  btConfirmaProd.SetFocus;

end;

procedure TFSTELctoPedido.dbUnitKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbUnitKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.dbVlrPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.dbVlrPagoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.edValorTeleEnter(Sender: TObject);
begin
  if fTime then
    Exit;
  if FSTEPrincipal.LctWrk.RecordCount = 0 then
  begin
    btCancelaClick(nil);
    Exit;
  end;
  //
  PanNovoLcto.Visible := False;
  PanAlteraExclue.Visible := False;
  btAcrescenta.Enabled := True;
  btFinaliza.Enabled := True;
  btDdCliente.Enabled := True;
  if (FSTEPrincipal.PedWrkTotal.AsCurrency = 0) and
     (FSTEPrincipal.LctWrk.RecordCount = 0) then
  begin
    if MessageDlg('Informe:'+ #13#13 +
                  '     Alterar/informar dados do cliente, ou' + #13 +
                  '     Cancelar pedido',
                  mtConfirmation,[mbYes,mbNo],0,mbYes,
                  ['Alterar/informar dados','Cancelar pedido']) = mrYes then
    begin
      PanIdCliente.Enabled := True;
      dbNome.SetFocus;
    end
    else
      btCancelaClick(nil);
    Exit;
  end;
  LabTele.Caption := '---> Tele:';
  LabTele.Font.Style := [fsBold];

end;


procedure TFSTELctoPedido.edValorTeleExit(Sender: TObject);
begin
  LabTele.Caption := 'Tele:';
  LabTele.Font.Style := [];
  //  dbLkMeioPgto.SetFocus;

end;

procedure TFSTELctoPedido.edValorTeleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTELctoPedido.edValorTeleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTELctoPedido.FormActivate(Sender: TObject);
begin
  if not fTime then
    Exit;
  fTime := False;
  wLogFile := ChangeFileExt(Application.ExeName,'.Log');
  Align := alClient;
  LabIncluirLcto.Caption := FSTEPrincipal.txtIncluir;
  dbMeioPagto.Visible := FSTEPrincipal.lDesenv;

  dbProdCombo.Items.Clear;
  FSTEPrincipal.Produtos.IndexName := 'Alfabetica';
  FSTEPrincipal.Produtos.First;
  while not FSTEPrincipal.Produtos.Eof do
  begin
    dbProdCombo.Items.Add(FSTEPrincipal.ProdutosDescr.AsString);
    FSTEPrincipal.Produtos.Next;
  end;
  FormResize(nil);
  //
  if FSTEPrincipal.LctWrk.Active then
    FSTEPrincipal.LctWrk.Active := False;
  if FSTEPrincipal.PedWrk.Active then
    FSTEPrincipal.PedWrk.Active := False;
  FSTEPrincipal.Pedidos.Last;
  nroPed := FSTEPrincipal.PedidosNro.AsInteger + 1;
  FSTEPrincipal.PedWrk.Active := True;
  FSTEPrincipal.PedWrk.EmptyDataSet;
  FSTEPrincipal.PedWrk.Append;
  FSTEPrincipal.PedWrkNro.AsInteger := nroPed;
  FSTEPrincipal.PedWrkFone.AsString := '';
  case FSTEPrincipal.mpPadrao of               // Index
    0:FSTEPrincipal.PedWrkMeioPgto.AsInteger := 1;     // Reais
    1:FSTEPrincipal.PedWrkMeioPgto.AsInteger := 3;     // C.Crédito
    2:FSTEPrincipal.PedWrkMeioPgto.AsInteger := 4;     // C.Débito
    3:FSTEPrincipal.PedWrkMeioPgto.AsInteger := 17;    // PIX
    4:FSTEPrincipal.PedWrkMeioPgto.AsInteger := 99;    // Outros
  end;
  FSTEPrincipal.PedWrkEntrega.AsInteger := 0;          // 0-Tele 1-Retira 2-Consumo local
  if FSTEPrincipal.rgTurno.ItemIndex = 0 then
    FSTEPrincipal.PedWrkTurno.AsString := 'D'
  else
    FSTEPrincipal.PedWrkTurno.AsString := 'N';
  FSTEPrincipal.PedWrkData.AsDateTime := Now;
  FSTEPrincipal.PedWrkTotal.AsCurrency := 0;
  FSTEPrincipal.PedWrkVlrTele.AsCurrency := 0;
  FSTEPrincipal.PedWrkVlrPago.AsCurrency := 0;
  FSTEPrincipal.LctWrk.Active := True;
  FSTEPrincipal.LctWrk.EmptyDataSet;
  //
  LabCPF_CNPJ.Visible := FSTEPrincipal.lSolCPF;
  dbCPF_CNPJ.Visible := FSTEPrincipal.lSolCPF;
  PanItem.Enabled := False;
  RETexto.Lines.Clear;
  MemLcto.Lines.Clear;
  qtdLctos := 0;
  PanIdCliente.Enabled := True;
  btConfCliente.Enabled := False;
  PanItem.Enabled := False;
  btConfirmaProd.Enabled := False;
  PanTotalizTop.Enabled := False;
  btAcrescenta.Enabled := False;
  btDdCliente.Enabled := False;
  btFinaliza.Enabled := False;
  dbFone.SetFocus;

end;

procedure TFSTELctoPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fTime := True;

end;

procedure TFSTELctoPedido.FormCreate(Sender: TObject);
begin
  fTime := True;
  RETexto.Align := alClient;
  PanTotalizTop.BevelOuter := bvNone;

end;

procedure TFSTELctoPedido.FormResize(Sender: TObject);
var xQbLinha: String;
begin
  if Width < 1180 then
    Width := 1180;
  if Height < 560 then
    Height := 560;
  //
  PanIdCliente.Width := Trunc(Width * 0.28);
  PanTotalizacao.Width := Trunc(Width * 0.23);
  //
  btCancela.Left := PanTotalizacao.Width - (btCancela.Width + 6);
  btCancela.Top := PanTotalizacao.Height - (btCancela.Height + 32);
  btAcrescenta.Left := btCancela.Left - 20;
  btAcrescenta.Top := btCancela.Top - (btAcrescenta.Height + 8);
  btFinaliza.Left := btAcrescenta.Left - 20;
  btFinaliza.Top := btAcrescenta.Top - (btFinaliza.Height + 8);

  btDdCliente.Left := 8;
  btDdCliente.Top := btAcrescenta.Top;
  btDdCliente.Height := (btAcrescenta.Height * 2) + 8;
  btDdCliente.Width := btAcrescenta.Left - 16;
  while (btDdCliente.Left + btDdCliente.Width) >= (btAcrescenta.Left - 6)
    do btDdCliente.Width := btDdCliente.Width - 2;
  xQbLinha := ' ';
  if btDdCliente.Width < 120 then
    xQbLinha := #13;
  btDdCliente.Caption := 'Alterar &dados' + xQbLinha + 'do cliente';

end;

procedure TFSTELctoPedido.RETextoDblClick(Sender: TObject);
var nLin,nLcto: Integer;
begin
  nLin := RE_ObterLinhaAtual(RETexto);
  nLcto := StrToIntDef(Trim(MemLcto.Lines[nlin]),0);
  //ShowMessage('DBlClick na linha:' + IntToStr(nLin) + '   Lcto='+ IntToStr(nLcto));
  if nLcto = 0 then
    Exit;
  if not FSTEPrincipal.LctWrk.FindKey([FSTEPrincipal.PedWrkNro.AsInteger,nLcto]) then
  begin
    MessageDlg('Lançamento não encontrado',mtError,[mbOk],0);
    Exit;
  end;
  PanItem.Enabled := False;
  PanAlteraExclue.Top :=  PanDuploClick.Top - (PanAlteraExclue.Height + 12);
  PanAlteraExclue.Left := PanLancto.Left + 100;
  PanAlteraExclue.Visible := True;
  btIgnora.SetFocus;

end;

end.
