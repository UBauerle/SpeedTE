unit STEImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLPrinters;
  Procedure ImprimePedido(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimeFechamento(pmtData:TDateTime; pmtTurno:String;
                              pmtDin,pmtCCred,pmtCDeb,pmtPix,pmtOutros:Currency);
type
  TFSTEImpressao = class(TForm)
    RLPedido: TRLReport;
    RLCabec: TRLBand;
    RLDetCabec: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDetLinha: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLSumario: TRLBand;
    RLPanel2: TRLPanel;
    RLLogo: TRLImage;
    RLUsuario: TRLLabel;
    RLEnder1: TRLLabel;
    RLEnder2: TRLLabel;
    RLFones: TRLLabel;
    RLDBText16: TRLDBText;
    RLNome: TRLLabel;
    RLEndereco: TRLLabel;
    RLBairro: TRLLabel;
    RLRefer: TRLLabel;
    RLFone: TRLLabel;
    RLVlrPago: TRLLabel;
    RLTroco: TRLLabel;
    RLValor: TRLLabel;
    RLTele: TRLLabel;
    RLTotal: TRLLabel;
    RLMeioPagto: TRLLabel;
    RLFooter: TRLBand;
    RLDtTurnoNro: TRLLabel;
    RLDBText17: TRLDBText;
    RLFechamento: TRLReport;
    RLFechCabec: TRLBand;
    RLFechUsuar: TRLLabel;
    RLFechData: TRLLabel;
    RLFechCabCol: TRLBand;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLFechDetal: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLFechSum: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBResult3: TRLDBResult;
    RLSystemInfo1: TRLSystemInfo;
    RLFechFooter: TRLBand;
    RLFechEmissao: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBResult4: TRLDBResult;
    RLDBResult5: TRLDBResult;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabDin: TRLLabel;
    RLLabCCred: TRLLabel;
    RLLabCDeb: TRLLabel;
    RLLabPix: TRLLabel;
    RLLabOutros: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabAuxil: TRLLabel;
    RLEntrega: TRLLabel;
    procedure RLDetLinhaBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEImpressao: TFSTEImpressao;

implementation

{$R *.dfm}

uses FortesReportCtle, STEPrincipal, uSysPrinters, uGenericas;

Procedure ImprimePedido(pmtPreview:Boolean; pmtVias:Integer=1);
var nAltura,tmPagina,i: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
    lPreview: Boolean;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    if FileExists(FSTEPrincipal.LogoImpres) then
      RLLogo.Picture.LoadFromFile(FSTEPrincipal.LogoImpres);
    RLUsuario.Caption := FSTEPrincipal.idUsuario;
    RLEnder1.Caption := Trim(FSTEPrincipal.idLograd) + ' ' +
                        Trim(FSTEPrincipal.idNro) + ' ' +
                        Trim(FSTEPrincipal.idCompl) + ' ';
    RLEnder2.Caption := Trim(FSTEPrincipal.idBairro) + ' ' +
                        Trim(FSTEPrincipal.idCidade) + ' ' +
                        Trim(FSTEPrincipal.idUF);
    RLFones.Caption :=  'Fone: ' + Trim(FSTEPrincipal.idFone) + ' ';
    if FSTEPrincipal.idWhats <> '' then
      RLFones.Caption := RLFones.Caption + 'WhatsApp: ' + Trim(FSTEPrincipal.idWhats);
    //
    RLNome.Caption := FSTEPrincipal.PedWrkNome.AsString;
    RLEndereco.Caption := FSTEPrincipal.PedWrkEndereco.AsString;
    RLBairro.Caption := FSTEPrincipal.PedWrkBairro.AsString;
    RLRefer.Caption := FSTEPrincipal.PedWrkRefer.AsString;
    RLFone.Caption := 'Fone: ' + EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    RLEntrega.Visible := FSTEPrincipal.lMdEntrega;
    case FSTEPrincipal.PedWrkEntrega.AsInteger of
      0:RLEntrega.Caption := 'Tele-entrega';
      1:RLEntrega.Caption := 'Retira';
      2:RLEntrega.Caption := 'Cons.local';
      else RLEntrega.Caption := '';
    end;
    //
    RLValor.Caption   := 'Valor: ' + FloatToStrF(FSTEPrincipal.PedWrkTotal.AsCurrency,ffNumber,15,2);
    RLTele.Caption    := 'Tele: '  + FloatToStrF(FSTEPrincipal.PedWrkVlrTele.AsCurrency,ffNumber,15,2);
    RLTotal.Caption   := 'Total: ' + FloatToStrF(FSTEPrincipal.PedWrkZC_Total.AsCurrency,ffNumber,15,2);

    RLMeioPagto.Caption := 'Pagto: ' + FSTEPrincipal.PedwrkZC_MPagto.AsString;

    RLVlrPago.Caption := 'Vlr pago: ' + FloatToStrF(FSTEPrincipal.PedWrkVlrPago.AsCurrency,ffNumber,15,2);
    if FSTEPrincipal.PedWrkZC_Troco.AsCurrency > 0 then
    begin
      RLTroco.Caption := 'Troco: ' + FloatToStrF(FSTEPrincipal.PedWrkZC_Troco.AsCurrency,ffNumber,15,2);
      RLTroco.Visible := True;
    end
    else RLTroco.Visible := False;

    RLDtTurnoNro.Caption := FSTEPrincipal.PedWrkData.AsString + '  ' +
                            FSTEPrincipal.PedWrkTurno.AsString + '  ' +
                            FSTEPrincipal.PedWrkNro.AsString;
    //
    xPrinter := FSTEPrincipal.idPrinter;
    lPreview := pmtPreview;  // FSTEPrincipal.lPreview;
    if not DefineImpressora(True,xPrinter,xportaPrt,xdriverPrt,indexPrt) then
      lPreview := True;
    //
    nAltura := RLCabec.Height + RLDetCabec.Height + RLSumario.Height + RLFooter.Height;
    FSTEPrincipal.LctWrk.First;
    while not FSTEPrincipal.LctWrk.Eof do
    begin
      nAltura := nAltura + 16;
      if FSTEPrincipal.LctWrkObs1.AsString <> '' then
        nAltura := nAltura + 16;
      if FSTEPrincipal.LctWrkObs2.AsString <> '' then
        nAltura := nAltura + 16;
      FSTEPrincipal.LctWrk.Next;
    end;
    nAltura := nAltura + FSTEPrincipal.altExtra + FSTEPrincipal.margTop + FSTEPrincipal.margBot;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then
      tmPagina := 80
    else if tmPagina > FSTEPrincipal.tmMax then
              tmPagina := FSTEPrincipal.tmMax;
    RLPedido.Margins.TopMargin := FSTEPrincipal.margTop;
    RLPedido.Margins.BottomMargin := FSTEPrincipal.margBot;
    //RLPedido.Margins.LeftMargin := FSTEPrincipal.margEsq;
    //RLPedido.Margins.RightMargin := FSTEPrincipal.margDir;
    RLPedido.PageSetup.PaperHeight := tmPagina;
    FFRCtle.RLPreviewSetup1.CustomActionText := '';      // 'Impressao';  //lstAction;

    RLPedido.PrintDialog := FSTEPrincipal.lDialog;
    RLPrinters.RLPrinter.PrinterName := xPrinter;

    if lPreview then
      RLPedido.Preview
    else begin
      //RLPrinters.RLPrinter.Copies := FSTEPrincipal.copias;  // Não corta o papel entre vias
      //RLPedido.Print
      for i:= 1 to pmtVias do
        RLPedido.Print;
    end;

 end;
 FSTEImpressao.Free;

end;


Procedure ImprimeFechamento(pmtData:TDateTime; pmtTurno:String;
                            pmtDin,pmtCCred,pmtCDeb,pmtPix,pmtOutros:Currency);

var nAltura,tmPagina,i,nLarg: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
    lPreview: Boolean;
    wValores: array[1..5] of Currency;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    RLFechUsuar.Caption := FSTEPrincipal.idUsuario;
    RLFechData.Caption := DateToStr(pmtData) + ' ';
    if pmtTurno = '0' then
      RLFechData.Caption := RLFechData.Caption + 'DIA'
    else
      RLFechData.Caption := RLFechData.Caption + 'NOITE';

    wValores[1] := pmtDin;
    wValores[2] := pmtCCred;
    wValores[3] := pmtCDeb;
    wValores[4] := pmtPix;
    wValores[5] := pmtOutros;
    nLarg := 0;
    for i := 1 to 5 do
    begin
      RLLabAuxil.Caption := FloatToStrF(wValores[i],ffNumber,15,2);
      if RLLabAuxil.Width > nLarg then
        nLarg := RLLabAuxil.Width;
    end;
    RLLabDin.Width := nLarg;
    RLLabCCred.Width := nLarg;
    RLLabCDeb.Width := nLarg;
    RLLabPix.Width := nLarg;
    RLLabOutros.Width := nLarg;

    RLLabDin.Caption := FloatToStrF(pmtDin,ffNumber,15,2);
    RLLabCCred.Caption := FloatToStrF(pmtCCred,ffNumber,15,2);
    RLLabCDeb.Caption := FloatToStrF(pmtCDeb,ffNumber,15,2);
    RLLabPix.Caption := FloatToStrF(pmtPix,ffNumber,15,2);
    RLLabOutros.Caption := FloatToStrF(pmtOutros,ffNumber,15,2);
    RLFechEmissao.Caption := 'Emissão: ' + DateToStr(Date) + ' as ' + TimeToStr(Time);
    //
    xPrinter := FSTEPrincipal.idPrinter;
    lPreview := FSTEPrincipal.lPreview;
    if not DefineImpressora(True,xPrinter,xportaPrt,xdriverPrt,indexPrt) then
      lPreview := True;
    //
    nAltura := (FSTEPrincipal.Pedidos.RecordCount * 14) +
               RLFechCabec.Height + RLFechCabCol.Height + RLFechSum.Height + RLFechFooter.Height +
               FSTEPrincipal.altExtra + FSTEPrincipal.margTop + FSTEPrincipal.margBot;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then
      tmPagina := 80
    else if tmPagina > FSTEPrincipal.tmMax then
              tmPagina := FSTEPrincipal.tmMax;
    RLFechamento.Margins.TopMargin := FSTEPrincipal.margTop;
    RLFechamento.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLFechamento.PageSetup.PaperHeight := tmPagina;
    FFRCtle.RLPreviewSetup1.CustomActionText := '';      // 'Impressao';  //lstAction;

    RLFechamento.PrintDialog := FSTEPrincipal.lDialog;
    RLPrinters.RLPrinter.PrinterName := xPrinter;

    if lPreview then
      RLFechamento.Preview
    else
      RLFechamento.Print;
  end;
 FSTEImpressao.Free;

end;



procedure TFSTEImpressao.RLDetLinhaBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if FSTEPrincipal.LctWrkObs1.AsString <> '' then
  begin
    RLDBText16.Visible := True;
    RLDetLinha.Height := 30;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
    begin
      //RLDBText17.Visible := True;
      RLDetLinha.Height := 45;
    end;
  end
  else begin
    RLDBText16.Visible := False;
    //RLDBText17.Visible := False;
    RLDetLinha.Height := 15;
  end;

end;

end.
