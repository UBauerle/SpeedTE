unit STEProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask;

type
  TFSTEProdutos = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PanRodape: TPanel;
    btSair: TBitBtn;
    btIncluir: TBitBtn;
    btExcluir: TBitBtn;
    btImprimir: TBitBtn;
    GridProds: TDBGrid;
    NavProds: TDBNavigator;
    LabNRegs: TLabel;
    PanManut: TPanel;
    dbDescricao: TDBEdit;
    dbValor: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btGravaProd: TBitBtn;
    btCancelaProd: TBitBtn;
    Label4: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    dbLkTipo: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelaProdClick(Sender: TObject);
    procedure btGravaProdClick(Sender: TObject);
    procedure GridProdsDblClick(Sender: TObject);
    procedure dbDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbLkTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure dbValorKeyPress(Sender: TObject; var Key: Char);
    procedure dbLkTipoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEProdutos: TFSTEProdutos;

implementation

{$R *.dfm}

uses STEPrincipal, uGenericas;

Procedure ManutencaoProduto(pmtAcao:Integer; pmtModo:Boolean);
begin
  with FSTEProdutos do
  begin
    PanManut.Visible := pmtModo;
    if pmtModo then
      pmtModo := False
    else
      pmtModo := True;
    PanRodape.Enabled := pmtModo;
    GridProds.Enabled := pmtModo;
    if pmtAcao = 3 then
      Exit;
    //
    if pmtAcao = 1 then
    begin
      FSTEPrincipal.ultProduto := FSTEPrincipal.ultProduto + 1;
      FSTEPrincipal.Produtos.Append;
      FSTEPrincipal.ProdutosSeq.AsInteger := FSTEPrincipal.ultProduto;
    end
    else begin
      FSTEPrincipal.Produtos.Edit
    end;

  end;

end;

procedure TFSTEProdutos.btCancelaProdClick(Sender: TObject);
begin
  FSTEPrincipal.Produtos.Cancel;
  ManutencaoProduto(3,False);

end;

procedure TFSTEProdutos.btExcluirClick(Sender: TObject);
begin
  if MessageDlg('Excluir produto' + #13#13 +
                FSTEPrincipal.ProdutosDescr.AsString + #13 +
                'Valor: ' + FloatToStrF(FSTEPrincipal.ProdutosValor.AsCurrency,ffNumber,15,2) + #13#13 +
                'Confirma exclusão ?',
                mtConfirmation,[mbYes,mbNo], 0, mbNo, ['Excluir','Não excluir']) = mrYes then
  begin
    FSTEPrincipal.Produtos.Delete;
    LabNRegs.Caption := IntToStr(FSTEPrincipal.Produtos.RecordCount) + ' registros';
  end;

end;

procedure TFSTEProdutos.btGravaProdClick(Sender: TObject);
begin
  if FSTEPrincipal.ProdutosValor.isNull then
    FSTEPrincipal.ProdutosValor.AsCurrency := 0;
  if FSTEPrincipal.ProdutosTipo.IsNull then
    FSTEPrincipal.ProdutosTipo.AsInteger := 0;
  Try
    FSTEPrincipal.Produtos.Post;
  Except
    FSTEPrincipal.Produtos.Cancel;
    MessageDlg('Falha da gravação de dados',mtError,[mbOk],0);
  End;
  ManutencaoProduto(3,False);
  LabNRegs.Caption := IntToStr(FSTEPrincipal.Produtos.RecordCount) + ' registros';

end;

procedure TFSTEProdutos.btImprimirClick(Sender: TObject);
begin
  MessageDlg('Não implementado',mtInformation,[mbOk],0);

end;

procedure TFSTEProdutos.btIncluirClick(Sender: TObject);
begin
  ManutencaoProduto(1,True);
  dbDescricao.SetFocus;

end;


procedure TFSTEProdutos.btSairClick(Sender: TObject);
begin
  FSTEProdutos.Close;

end;

procedure TFSTEProdutos.dbDescricaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEProdutos.dbDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEProdutos.dbLkTipoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEProdutos.dbLkTipoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEProdutos.dbValorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = Vk_Return then
     SelectNext((Sender as TwinControl),True,True);

end;

procedure TFSTEProdutos.dbValorKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #00;

end;

procedure TFSTEProdutos.FormActivate(Sender: TObject);
begin
  Form_Define(FSTEProdutos);
  FormResize(nil);
  FSTEPrincipal.Produtos.IndexName := 'Alfabetica';
  FSTEPrincipal.Produtos.First;
  LabNRegs.Caption := IntToStr(FSTEPrincipal.Produtos.RecordCount) + ' registros';

end;

procedure TFSTEProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form_Salva(FSTEProdutos);

end;

procedure TFSTEProdutos.FormResize(Sender: TObject);
begin
  if FSTEProdutos.Width < 620 then
    FSTEProdutos.Width := 620;
  if FSTEProdutos.Height < 440 then
    FSTEProdutos.Height := 440;
  GridProds := DefineGrid(GridProds,[0.07, 0.33, 0.16, 0.20],1,0);

end;

procedure TFSTEProdutos.GridProdsDblClick(Sender: TObject);
begin
  ManutencaoProduto(2,True);

end;

end.
