unit STEClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TFSTEClientes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PanRodape: TPanel;
    btSair: TBitBtn;
    btIncluir: TBitBtn;
    btExcluir: TBitBtn;
    btImprimir: TBitBtn;
    GridClientes: TDBGrid;
    NavClientes: TDBNavigator;
    LabNRegs: TLabel;
    PanManut: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btGravaCliente: TBitBtn;
    btCancelaCliente: TBitBtn;
    Label4: TLabel;
    cbOrdem: TComboBox;
    LabLocaliz: TLabel;
    edLocaliz: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edFone: TDBEdit;
    edNome: TDBEdit;
    edEndereco: TDBEdit;
    edBairro: TDBEdit;
    edRefer: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelaClienteClick(Sender: TObject);
    procedure btGravaClienteClick(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
    procedure edLocalizChange(Sender: TObject);
    procedure GridClientesDblClick(Sender: TObject);
    procedure edFoneKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNomeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edEnderecoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edBairroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edReferKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFoneKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeKeyPress(Sender: TObject; var Key: Char);
    procedure edEnderecoKeyPress(Sender: TObject; var Key: Char);
    procedure edBairroKeyPress(Sender: TObject; var Key: Char);
    procedure edReferKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEClientes: TFSTEClientes;
  ultSeq: Integer;

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas;

procedure TFSTEClientes.btCancelaClienteClick(Sender: TObject);
begin
  FSTEPrincipal.Clientes.Cancel;
  PanManut.Visible := False;
  PanRodape.Enabled := True;
  GridClientes.Enabled := True;

end;

procedure TFSTEClientes.btExcluirClick(Sender: TObject);
begin
  if MessageDlg('Excluir cliente' + #13#13 +
                FSTEPrincipal.ClientesChave.AsString + #13 +
                FSTEPrincipal.ClientesNome.AsString + #13#13 +
                'Confirma exclusão ?',
                mtConfirmation,[mbYes,mbNo], 0, mbNo, ['Excluir','Não excluir']) = mrYes then
  begin
    FSTEPrincipal.Clientes.Delete;
    LabNRegs.Caption := IntToStr(FSTEPrincipal.Clientes.RecordCount) + ' registros';
    FSTEPrincipal.lManutClientes := True;
  end;

end;

procedure TFSTEClientes.btGravaClienteClick(Sender: TObject);
var wFone, wMsg: String;
begin
  wMsg := '';
  if ValidaTelefone(FSTEPrincipal.ClientesChave.AsString,wFone) = '*'  then
    wMsg := wMsg + 'Telefone inválido' + #13;
  if Length(Trim(FSTEPrincipal.ClientesNome.AsString)) < 3 then
    wMsg := wMsg + 'Nome não informado ou muito curto (3 caracteres)' + #13;
  if Length(Trim(FSTEPrincipal.ClientesEndereco.AsString)) < 3 then
    wMsg := wMsg + 'Endereço não informado ou muito curto (3 caracteres)' + #13;
  if wMsg <> '' then
  begin
    MessageDlg('Erro(s) encontrado(s)' + #13 + wMsg + #13 + 'Reinforme',mtError,[mbOk],0);

  end;
  Try
    FSTEPrincipal.Clientes.Post;
  Except
    FSTEPrincipal.Clientes.Cancel;
    MessageDlg('Falha da gravação de dados',mtError,[mbOk],0);
  End;
  PanManut.Visible := False;
  PanRodape.Enabled := True;
  GridClientes.Enabled := True;
  LabNRegs.Caption := IntToStr(FSTEPrincipal.Clientes.RecordCount) + ' registros';
  FSTEPrincipal.lManutClientes := True;

end;

procedure TFSTEClientes.btImprimirClick(Sender: TObject);
begin
  MessageDlg('Não implementado',mtInformation,[mbOk],0);

end;

procedure TFSTEClientes.btIncluirClick(Sender: TObject);
begin
  PanRodape.Enabled := False;
  GridClientes.Enabled := False;
  PanManut.Visible := True;
  ultSeq := ultSeq + 1;
  FSTEPrincipal.Clientes.Append;
  FSTEPrincipal.ClientesSeq.AsInteger := ultSeq;

end;

procedure TFSTEClientes.btSairClick(Sender: TObject);
begin
  FSTEClientes.Close;

end;

procedure TFSTEClientes.cbOrdemChange(Sender: TObject);
var kSeq: Integer;
    kFone,kNome: String;
begin
  with FSTEPrincipal do
  begin
    kSeq := ClientesSeq.AsInteger;
    kFone := ClientesChave.AsString;
    kNome := ClientesNome.AsString;
    case cbOrdem.ItemIndex of
      1:Clientes.IndexName := 'Fone';
      2:Clientes.IndexName := 'Alfabetica';
      3:Clientes.IndexName := 'Adress';
      else Clientes.IndexName := '';
    end;
    Clientes.First;
    case cbOrdem.ItemIndex of
      1:Clientes.FindNearest([kFone,kSeq]);
      2:Clientes.FindNearest([kNome,kFone]);
      3:Clientes.FindNearest([kNome,kFone]);
      else Clientes.FindNearest([kSeq]);
    end;
    edLocaliz.Text := '';
    if cbOrdem.ItemIndex = 0 then
      edLocaliz.Enabled := False
    else
      edLocaliz.Enabled := True;
    LabLocaliz.Enabled := edLocaliz.Enabled;

  end;

end;

procedure TFSTEClientes.edBairroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEClientes.edBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEClientes.edEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEClientes.edEnderecoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEClientes.edFoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEClientes.edFoneKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEClientes.edLocalizChange(Sender: TObject);
begin
  if (edLocaliz.Text = '') or (cbOrdem.ItemIndex = 0) then
    Exit;
  FSTEPrincipal.Clientes.FindNearest([Trim(EdLocaliz.Text),'']);

end;

procedure TFSTEClientes.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEClientes.edNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEClientes.edReferKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEClientes.edReferKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEClientes.FormActivate(Sender: TObject);
begin
  Form_Define(FSTEClientes);
  FormResize(nil);
  with FSTEPrincipal do
  begin
    cbOrdem.ItemIndex := 0;
    cbOrdemChange(nil);
    Clientes.Last;
    ultSeq := ClientesSeq.AsInteger;
    cbOrdem.ItemIndex := 2;       // Alfabetica
    cbOrdemChange(nil);
    Clientes.First;
    LabNRegs.Caption := IntToStr(Clientes.RecordCount) + ' registros';
    edLocaliz.Text := '';
  end;


end;

procedure TFSTEClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FSTEClientes);

end;

procedure TFSTEClientes.FormResize(Sender: TObject);
begin
  if FSTEClientes.Width < 800 then
    FSTEClientes.Width := 800;
  if FSTEClientes.Height < 440 then
    FSTEClientes.Height := 440;
  GridClientes := DefineGrid(GridClientes,[0.10, 0.15, 0.33, 0.15, 0.33], 2, 4);

end;

procedure TFSTEClientes.GridClientesDblClick(Sender: TObject);
begin
  FSTEPrincipal.lManutClientes := True;

end;

end.
