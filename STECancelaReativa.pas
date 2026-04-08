unit STECancelaReativa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TFSTECancelaReativa = class(TForm)
    PanRodape: TPanel;
    btConfirma: TBitBtn;
    btCancela: TBitBtn;
    PanTopico: TPanel;
    PanWrk: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    edMotivo: TEdit;
    procedure btCancelaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    lCancReat: Boolean;

  end;

var
  FSTECancelaReativa: TFSTECancelaReativa;
  lCRIncrem: Integer;

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas;

procedure TFSTECancelaReativa.btCancelaClick(Sender: TObject);
begin
  FSTECancelaReativa.Close;

end;

procedure TFSTECancelaReativa.btConfirmaClick(Sender: TObject);
var wMsg: String;
    nOpeLog: Integer;
begin
  if Length(Trim(edMotivo.Text)) < 5 then
  begin
    MessageDlg('Informe o motivo, com no mínimo 5 caracteres',mtError,[mbOk],0);
    edMotivo.SetFocus;
    Exit;
  end;
  if MessageDlg('Confirma ' + PanTopico.Caption,
                mtConfirmation,[mbYes,mbNo],0,mbNo,['Sim','Não']) = mrYes then
  begin
    FSTEPrincipal.Pedidos.Edit;
    FSTEPrincipal.PedidosEntrega.AsInteger := FSTEPrincipal.PedidosEntrega.AsInteger + lCRIncrem;
    FSTEPrincipal.Pedidos.Post;
    //
    if lCRIncrem > 0 then
    begin
      wMsg := 'Cancelamento';
      nOpeLog := 4;
    end
    else begin
      wMsg := 'Reativação';
      nOpeLog := 5;
    end;
    wMsg := wMsg + '|' + FSTEPrincipal.PedidosNro.AsString +
                   '|' + FSTEPrincipal.PedidosNome.AsString +
                   '|' + FloatToStrF(FSTEPrincipal.PedidosTotal.AsCurrency,ffNumber,15,2) +
                   '|' + edMotivo.Text;
    GravaLog(FSTEPrincipal.wLogFile,  nOpeLog, 'Sys', 'Sistema', wMsg);
    FSTECancelaReativa.lCancReat := True;
  end;
  FSTECancelaReativa.Close;

end;

procedure TFSTECancelaReativa.FormActivate(Sender: TObject);
begin
  if FSTEPrincipal.PedidosEntrega.AsInteger < 10 then
  begin
    PanTopico.Caption := 'Cancelar pedido';
    btConfirma.Caption := '&Cancelar pedido';
    lCRIncrem := 10;
  end
  else begin
    PanTopico.Caption := 'Reativar pedido';
    btConfirma.Caption := '&Reativar pedido';
    lCRIncrem := -10;
  end;
  edMotivo.Text := '';

end;

end.
