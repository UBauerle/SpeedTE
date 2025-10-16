unit STEConsCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls;
  Function PesquisaClientes(var Fone:String): Boolean;

type
  TFSTEConsCliente = class(TForm)
    PanDados: TPanel;
    PanRodape: TPanel;
    GridClientes: TDBGrid;
    NavClientes: TDBNavigator;
    LabNRegs: TLabel;
    cbOrdem: TComboBox;
    Label4: TLabel;
    LabLocaliz: TLabel;
    edLocaliz: TEdit;
    btUtiliz: TBitBtn;
    btCancel: TBitBtn;
    procedure btCancelClick(Sender: TObject);
    procedure btUtilizClick(Sender: TObject);
    procedure cbOrdemChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edLocalizChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEConsCliente: TFSTEConsCliente;
  retFone: String;

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas;

Function PesquisaClientes(var Fone:String): Boolean;
var idxAnt: String;
begin
  Result := False;
  idxAnt := FSTEPrincipal.Clientes.IndexName;
  case FSTEPrincipal.nIndexConsClie of
    0:FSTEPrincipal.Clientes.IndexName := '';
    1:FSTEPrincipal.Clientes.IndexName := 'Fone';
    2:FSTEPrincipal.Clientes.IndexName := 'Alfabetica';
    3:FSTEPrincipal.Clientes.IndexName := 'Address';
    4:FSTEPrincipal.Clientes.IndexName := 'AlfaEnder';
  end;
  retFone := '';
  FSTEPrincipal.Clientes.First;

  FSTEConsCliente.ShowModal;
  if FSTEPrincipal.Clientes.IndexName <> idxAnt then
    FSTEPrincipal.Clientes.IndexName := idxAnt;
  Fone := retFone;
  if retFone <> '' then
    Result := True;

end;

procedure TFSTEConsCliente.btCancelClick(Sender: TObject);
begin
  retFone := '';
  Close;

end;

procedure TFSTEConsCliente.btUtilizClick(Sender: TObject);
begin
  retFone := FSTEPrincipal.ClientesChave.AsString;
  Close;

end;

procedure TFSTEConsCliente.cbOrdemChange(Sender: TObject);
begin
  with FSTEPrincipal do
  begin
    case cbOrdem.ItemIndex of
      0:FSTEPrincipal.Clientes.IndexName := '';
      1:FSTEPrincipal.Clientes.IndexName := 'Fone';
      2:FSTEPrincipal.Clientes.IndexName := 'Alfabetica';
      3:FSTEPrincipal.Clientes.IndexName := 'Address';
      4:FSTEPrincipal.Clientes.IndexName := 'AlfaEnder';
      5:FSTEPrincipal.Clientes.IndexName := 'UltCompra';
    end;
    edLocaliz.Text := '';
    edLocaliz.Enabled := True;
    if cbOrdem.ItemIndex = 0 then
      edLocaliz.Enabled := False;
    LabLocaliz.Enabled := edLocaliz.Enabled;
    Clientes.First;
  end;

end;

procedure TFSTEConsCliente.edLocalizChange(Sender: TObject);
var xData: TDateTime;
    lAcessa: Boolean;
begin
  if edLocaliz.Text = '' then
  begin
    FSTEPrincipal.Clientes.First;
    Exit;
  end;
  if cbOrdem.ItemIndex = 5 then    // Por data
  begin
    Try
      xData := StrToDate(edLocaliz.Text);
      lAcessa := True;
    Except
      xData := Date;
      lAcessa := False;
    End;
    if lAcessa then
      FSTEPrincipal.Clientes.FindNearest([xData,'']);
    Exit;
  end;
  // Demais indices
  FSTEPrincipal.Clientes.FindNearest([Trim(edLocaliz.Text),'']);

end;

procedure TFSTEConsCliente.FormActivate(Sender: TObject);
begin
  Form_Define(FSTEConsCliente);
  FormResize(nil);
  LabNRegs.Caption := IntToStr(FSTEPrincipal.Clientes.RecordCount) + ' clientes cadastrados';
  cbOrdem.ItemIndex := FSTEPrincipal.nIndexConsClie;
  cbOrdemChange(nil);
  edLocaliz.Text := '';

end;

procedure TFSTEConsCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FSTEConsCliente);

end;

procedure TFSTEConsCliente.FormResize(Sender: TObject);
begin
  if FSTEConsCliente.Width < 800 then
    FSTEConsCliente.Width := 800;
  if FSTEConsCliente.Height < 340 then
    FSTEConsCliente.Height := 340;
  GridClientes := DefineGrid(GridClientes,[0.10, 0.20, 0.30, 0.33, 0.33,0.10], 3, 4);

end;

end.
