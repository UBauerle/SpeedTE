unit STEImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLPrinters;
  Procedure ImprimePedido(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimeInterno(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimeFechamento(pmtData:TDateTime;
                              pmtDtFim:TDateTime;
                              pmtTurno:String;
                              pmtDin,pmtCCred,pmtCDeb,pmtPix,pmtOutros:Currency;
                              pmtQtdDia:Integer;pmtVlrDia,pmtTeleDia,pmtTotalDia:Currency;
                              pmtQtdNoite:Integer;pmtVlrNoite,pmtTeleNoite,pmtTotalNoite:Currency;
                              pmtTipo: String);  //        pmtTipo:String='Turno');
type
  TFSTEImpressao = class(TForm)
    RLPedido: TRLReport;
    RLCabec: TRLBand;
    RLDetCabec: TRLBand;
    RLPedCab1: TRLLabel;
    RLPedCab2: TRLLabel;
    RLPedCab3: TRLLabel;
    RLPedCab4: TRLLabel;
    RLPedCab5: TRLLabel;
    RLDetPedido: TRLBand;
    RLPedDd5: TRLDBText;
    RLPedDd4: TRLDBText;
    RLPedDd3: TRLDBText;
    RLPedDd1: TRLDBText;
    RLPedDd2: TRLDBText;
    RLSumario: TRLBand;
    RLPanel2: TRLPanel;
    RLLogo: TRLImage;
    RLUsuario: TRLLabel;
    RLEnder1: TRLLabel;
    RLEnder2: TRLLabel;
    RLWAPP: TRLLabel;
    RLPedObs1: TRLDBText;
    RLNome: TRLLabel;
    RLEndereco: TRLLabel;
    RLBairro: TRLLabel;
    RLRefer: TRLLabel;
    RLFoneClie: TRLLabel;
    RLVlrPago: TRLLabel;
    RLTroco: TRLLabel;
    RLMeioPagto: TRLLabel;
    RLFooter: TRLBand;
    RLDtTurnoNro: TRLLabel;
    RLPedObs2: TRLDBText;
    RLFechamento: TRLReport;
    RLFechCabec: TRLBand;
    RLFechUsuar: TRLLabel;
    RLFechData: TRLLabel;
    RLFechCabCol: TRLBand;
    RLFechCab1: TRLLabel;
    RLFechCab2: TRLLabel;
    RLFechCab3: TRLLabel;
    RLFechCab4: TRLLabel;
    RLFechCab5: TRLLabel;
    RLFechDetal: TRLBand;
    RLFechDd1: TRLDBText;
    RLFechDd2: TRLDBText;
    RLFechDd3: TRLDBText;
    RLFechDd4: TRLDBText;
    RLFechDd5: TRLDBText;
    RLFechSum: TRLBand;
    RLTotValor: TRLDBResult;
    RLTotTele: TRLDBResult;
    RLTotGeral: TRLDBResult;
    RLSystemInfo1: TRLSystemInfo;
    RLFechFooter: TRLBand;
    RLFechEmissao: TRLLabel;
    RLLabel11: TRLLabel;
    RLMediaValor: TRLDBResult;
    RLMediaGeral: TRLDBResult;
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
    RLImgFoneClie: TRLLabel;
    RLImgWhats: TRLImage;
    RLImgFone: TRLImage;
    RLFONE: TRLLabel;
    RLValor: TRLLabel;
    RLTele: TRLLabel;
    RLTotal: TRLLabel;
    RLInterno: TRLReport;
    RLCabInterno: TRLBand;
    RLNomeInt: TRLLabel;
    RLEnderInt: TRLLabel;
    RLBairroInt: TRLLabel;
    RLReferInt: TRLLabel;
    RLEntregaInt: TRLLabel;
    RLDetCabInt: TRLBand;
    RLIntCab1: TRLLabel;
    RLIntCab2: TRLLabel;
    RLIntCab3: TRLLabel;
    RLDetInterno: TRLBand;
    RLIntDd3: TRLDBText;
    RLIntDd1: TRLDBText;
    RLIntDd2: TRLDBText;
    RLIntObs1: TRLDBText;
    RLIntObs2: TRLDBText;
    RLSumarInt: TRLBand;
    RLFootInt: TRLBand;
    RLLabel60: TRLLabel;
    RLIdInterno: TRLLabel;
    RLFoneInt: TRLLabel;
    RLNroInterno: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLPanTurnos: TRLPanel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabVlrDia: TRLLabel;
    RLLabTeleDia: TRLLabel;
    RLLabTotalDia: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabVlrNoite: TRLLabel;
    RLLabTeleNoite: TRLLabel;
    RLLabTotalNoite: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabQtdDia: TRLLabel;
    RLLabQtdNoite: TRLLabel;
    procedure RLDetPedidoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetInternoBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSTEImpressao: TFSTEImpressao;
  wLargLst: Integer;
  lPreview: Boolean;

implementation

{$R *.dfm}

uses FortesReportCtle, STEPrincipal, uSysPrinters, uGenericas;

Procedure ImprimePedido(pmtPreview:Boolean; pmtVias:Integer=1);
var nAltura,tmPagina,i,posImg: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    lPreview := pmtPreview;

    RLPedido.Margins.TopMargin := FSTEPrincipal.margTop;
    RLPedido.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLPedido.Margins.LeftMargin := FSTEPrincipal.margEsq;
    RLPedido.Margins.RightMargin := FSTEPrincipal.margDir;
    wLargLst := RLCabec.Width;

    RLPedCab1.Width := Trunc(wLargLst * 0.065);
    RLPedCab3.Width := Trunc(wLargLst * 0.065);
    RLPedCab4.Width := Trunc(wLargLst * 0.179);
    RLPedCab5.Width := Trunc(wLargLst * 0.196);
    RLPedCab2.Width := wLargLst - (RLPedCab1.Width + RLPedCab3.Width  + RLPedCab4.Width + RLPedCab5.Width);
    RLPedCab1.Left := 0;
    RLPedCab2.Left := RLPedCab1.Left + RLPedCab1.Width;
    RLPedCab3.Left := RLPedCab2.Left + RLPedCab2.Width;
    RLPedCab4.Left := RLPedCab3.Left + RLPedCab3.Width;
    RLPedCab5.Left := RLPedCab4.Left + RLPedCab4.Width;
    //
    RLPedDd1.Left := RLPedCab1.Left;
    RLPedDd1.Width := RLPedCab1.Width;
    RLPedDd2.Left := RLPedCab2.Left;
    RLPedDd2.Width := RLPedCab2.Width;
    RLPedDd3.Left := RLPedCab3.Left;
    RLPedDd3.Width := RLPedCab3.Width;
    RLPedDd4.Left := RLPedCab4.Left;
    RLPedDd4.Width := RLPedCab4.Width;
    RLPedDd5.Left := RLPedCab5.Left;
    RLPedDd5.Width := RLPedCab5.Width;
    //
    if FileExists(FSTEPrincipal.LogoImpres) then
      RLLogo.Picture.LoadFromFile(FSTEPrincipal.LogoImpres);
    RLUsuario.Caption := FSTEPrincipal.idUsuario;
    RLEnder1.Caption := Trim(FSTEPrincipal.idLograd) + ' ' +
                        Trim(FSTEPrincipal.idNro) + ' ' +
                        Trim(FSTEPrincipal.idCompl) + ' ';
    RLEnder2.Caption := Trim(FSTEPrincipal.idBairro) + ' ' +
                        Trim(FSTEPrincipal.idCidade) + ' ' +
                        Trim(FSTEPrincipal.idUF);
    posImg := 52;
    RLImgWhats.Visible := False;
    RLWAPP.Visible := False;
    RLImgFone.Visible := False;
    RLFONE.Visible := False;
    if FSTEPrincipal.idWhats <> '' then
    begin
      RLImgWhats.Left := posImg;
      RLImgWhats.Visible := True;
      RLWAPP.Caption := Trim(FSTEPrincipal.idWhats);
      RLWAPP.Left := RLImgWhats.Left + RLImgWhats.Width + 1;
      RLWAPP.Visible := True;
      posImg := posImg + RLImgWhats.Width + RLWAPP.Width + 12;
    end;
    if FSTEPrincipal.idFone <> '' then
    begin
      RLImgFone.Left := posImg;
      RLImgFone.Visible := True;
      RLFONE.Caption := Trim(FSTEPrincipal.idFone);
      RLFONE.Left := RLImgFone.Left + RLImgFone.Width + 1;
      RLFONE.Visible := True;
    end;
    //
    RLNome.Caption := FSTEPrincipal.PedWrkNome.AsString;
    RLEndereco.Caption := FSTEPrincipal.PedWrkEndereco.AsString;
    RLBairro.Caption := FSTEPrincipal.PedWrkBairro.AsString;
    RLRefer.Caption := FSTEPrincipal.PedWrkRefer.AsString;
    //RLFone.Caption := 'Fone: ' + EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    RLFoneClie.Caption := ' ' + EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    RLImgFoneClie.Left := RLFoneClie.Left - RLImgFoneClie.Width;
    RLEntrega.Visible := FSTEPrincipal.lMdEntrega;
    case FSTEPrincipal.PedWrkEntrega.AsInteger of
      0:RLEntrega.Caption := 'Tele-entrega';
      1:RLEntrega.Caption := 'Retira';
      2:RLEntrega.Caption := 'Cons.local';
      else RLEntrega.Caption := '';
    end;
    //
    RLValor.Caption := 'Valor: ' + FloatToStrF(FSTEPrincipal.PedWrkTotal.AsCurrency,ffNumber,15,2);
    RLTele.Caption  := 'Tele: '  + FloatToStrF(FSTEPrincipal.PedWrkVlrTele.AsCurrency,ffNumber,15,2);
    RLTotal.Caption := 'Total: ' + FloatToStrF(FSTEPrincipal.PedWrkZC_Total.AsCurrency,ffNumber,15,2);

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
    RLPedido.PageSetup.PaperHeight := tmPagina;
    FFRCtle.RLPreviewSetup1.CustomActionText := '';      // 'Impressao';  //lstAction;
    RLPedido.PrintDialog := FSTEPrincipal.lDialog;
    RLPrinters.RLPrinter.PrinterName := xPrinter;

    if lPreview then
      RLPedido.Preview
    else
      for i:= 1 to pmtVias do
        RLPedido.Print;
 end;
 FSTEImpressao.Free;

end;


Procedure ImprimeInterno(pmtPreview:Boolean; pmtVias:Integer=1);
var nAltura,tmPagina,i: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    lPreview := pmtPreview;

    RLInterno.Margins.TopMargin := FSTEPrincipal.margTop;
    RLInterno.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLInterno.Margins.LeftMargin := FSTEPrincipal.margEsq;
    RLInterno.Margins.RightMargin := FSTEPrincipal.margDir;
    wLargLst := RLCabInterno.Width;
    //
    RLIntDd1.Left := 0;
    RLIntDd1.Width := 18;
    RLIntDd3.Left := wLargLst - 22;
    RLIntDd3.Width := 22;
    RLIntDd2.Left := RLIntDd1.Left + RLIntDd1.Width;
    RLIntDd2.Width := wLargLst - (RLIntDd1.Width + RLIntDd3.Width);
    //
    RLIdInterno.Caption := FSTEPrincipal.idInterno;
    RLNroInterno.Caption := FSTEPrincipal.PedWrkData.AsString + ' ' +
                            FSTEPrincipal.PedWrkTurno.AsString + ' ' +
                            FSTEPrincipal.PedWrkNro.AsString;
    //
    RLNomeInt.Caption := FSTEPrincipal.PedWrkNome.AsString;
    RLEnderInt.Caption := FSTEPrincipal.PedWrkEndereco.AsString;
    RLBairroInt.Caption := FSTEPrincipal.PedWrkBairro.AsString;
    RLReferInt.Caption := FSTEPrincipal.PedWrkRefer.AsString;
    RLFoneInt.Caption := EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    //RLEntregaInt.Visible := FSTEPrincipal.lMdEntrega;  Sempre visível
    case FSTEPrincipal.PedWrkEntrega.AsInteger of
      0:RLEntregaInt.Caption := 'Tele-entrega';
      1:RLEntregaInt.Caption := 'Retira';
      2:RLEntregaInt.Caption := 'Cons.local';
      else RLEntregaInt.Caption := '';
    end;
    //
    xPrinter := FSTEPrincipal.idPrinter;
    if not DefineImpressora(True,xPrinter,xportaPrt,xdriverPrt,indexPrt) then
      lPreview := True;
    //
    nAltura := RLCabInterno.Height + RLDetCabInt.Height + RLSumarInt.Height + RLFootInt.Height;
    FSTEPrincipal.LctWrk.First;
    while not FSTEPrincipal.LctWrk.Eof do
    begin
      nAltura := nAltura + 18;
      if FSTEPrincipal.LctWrkObs1.AsString <> '' then
        nAltura := nAltura + 15;
      if FSTEPrincipal.LctWrkObs2.AsString <> '' then
        nAltura := nAltura + 15;
      FSTEPrincipal.LctWrk.Next;
    end;
    nAltura := nAltura + FSTEPrincipal.altExtra + FSTEPrincipal.margTop + FSTEPrincipal.margBot;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then
      tmPagina := 80
    else if tmPagina > FSTEPrincipal.tmMax then
              tmPagina := FSTEPrincipal.tmMax;
    RLInterno.PageSetup.PaperHeight := tmPagina;
    FFRCtle.RLPreviewSetup1.CustomActionText := '';      // 'Impressao';  //lstAction;
    RLInterno.PrintDialog := FSTEPrincipal.lDialog;
    RLPrinters.RLPrinter.PrinterName := xPrinter;

    if lPreview then
      RLInterno.Preview
    else
      for i := 1 to pmtVias do
        RLInterno.Print;
 end;
 FSTEImpressao.Free;

end;


Procedure ImprimeFechamento(pmtData:TDateTime;
                            pmtDtFim:TDateTime;
                            pmtTurno:String;
                            pmtDin,pmtCCred,pmtCDeb,pmtPix,pmtOutros:Currency;
                            pmtQtdDia:Integer;pmtVlrDia,pmtTeleDia,pmtTotalDia:Currency;
                            pmtQtdNoite:Integer;pmtVlrNoite,pmtTeleNoite,pmtTotalNoite:Currency;
                            pmtTipo: String);  //        pmtTipo:String='Turno');
var nAltura,tmPagina,i,nLarg: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
    lPreview: Boolean;
    wValores: array[1..5] of Currency;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    RLFechamento.Margins.TopMargin := FSTEPrincipal.margTop;
    RLFechamento.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLFechamento.Margins.LeftMargin := FSTEPrincipal.margEsq;
    RLFechamento.Margins.RightMargin := FSTEPrincipal.margDir;
    //
    wLargLst := RLFechCabec.Width;
    RLFechCab5.Width := Trunc(wLargLst * 0.098);
    RLFechCab4.Width := Trunc(wLargLst * 0.196);
    RLFechCab3.Width := Trunc(wLargLst * 0.131);
    RLFechCab2.Width := Trunc(wLargLst * 0.179);
    RLFechCab1.Width := wLargLst - (RLFechCab5.Width + RLFechCab4.Width + RLFechCab3.Width + RLFechCab2.Width);
    RLFechCab1.Left := 0;
    RLFechCab2.Left := RLFechCab1.Left + RLFechCab1.Width;
    RLFechCab3.Left := RLFechCab2.Left + RLFechCab2.Width;
    RLFechCab4.Left := RLFechCab3.Left + RLFechCab3.Width;
    RLFechCab5.Left := RLFechCab4.Left + RLFechCab4.Width;
    //
    RLFechDd1.Left := RLFechCab1.Left;
    RLFechDd1.Width := RLFechCab1.Width;
    RLFechDd2.Left := RLFechCab2.Left;
    RLFechDd2.Width := RLFechCab2.Width;
    RLFechDd3.Left := RLFechCab3.Left;
    RLFechDd3.Width := RLFechCab3.Width;
    RLFechDd4.Left := RLFechCab4.Left;
    RLFechDd4.Width := RLFechCab4.Width;
    RLFechDd5.Left := RLFechCab5.Left;
    RLFechDd5.Width := RLFechCab5.Width;
    //
    RLTotValor.Left := RLFechDd2.Left;
    RLTotValor.Width := RLFechDd2.Width;
    RLTotTele.Left := RLFechDd3.Left;
    RLTotTele.Width := RLFechDd3.Width;
    RLTotGeral.Left := RLFechDd4.Left;
    RLTotGeral.Width := RLFechDd4.Width;
    RLMediaValor.Left := RLTotValor.Left;
    RLMediaValor.Width := RLTotValor.Width;
    RLMediaGeral.Left := RLTotGeral.Left;
    RLMediaGeral.Width := RLTotGeral.Width;
    //
    RLFechUsuar.Caption := FSTEPrincipal.idUsuario;
    if pmtTipo = 'Turno' then
    begin
     RLFechData.Caption := DateToStr(pmtData) + ' ';
     if pmtTurno = '0' then
        RLFechData.Caption := RLFechData.Caption + 'DIA'
      else
        RLFechData.Caption := RLFechData.Caption + 'NOITE';
    end
    else begin
      if pmtTipo = 'PerTotal' then
        RLFechData.Caption := 'Todos os turnos'
      else
        RLFechData.Caption := DateToStr(pmtData) + '-' + DateToStr(pmtDtFim);
      if pmtTurno = 'D' then
        RLFechData.Caption := RLFechData.Caption + ' D'
      else
        if pmtTurno = 'N' then
          RLFechData.Caption := RLFechData.Caption + ' N'
        else
          RLFechData.Caption := RLFechData.Caption + ' DN';
    end;
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
    if (pmtTipo <> 'Turno') and
       (pmtTipo <> 'PerTurno') then
    begin
      lPreview := True;
      RLPanTurnos.Visible := True;
      RLLabQtdDia.Caption := IntToStr(pmtQtdDia);
      RLLabVlrDia.Caption := FloatToStrF(pmtVlrDia,ffNumber,15,2);
      RLLabTeleDia.Caption := FloatToStrF(pmtTeleDia,ffNumber,15,2);
      RLLabTotalDia.Caption := FloatToStrF(pmtTotalDia,ffNumber,15,2);
      RLLabQtdNoite.Caption := IntToStr(pmtQtdNoite);
      RLLabVlrNoite.Caption := FloatToStrF(pmtVlrNoite,ffNumber,15,2);
      RLLabTeleNoite.Caption := FloatToStrF(pmtTeleNoite,ffNumber,15,2);
      RLLabTotalNoite.Caption := FloatToStrF(pmtTotalNoite,ffNumber,15,2);
      RLFechSum.Height := 128;
    end
    else begin    // Impressão do turno
      RLPanTurnos.Visible := False;
      RLFechSum.Height := 90;
    end;
    //
    nAltura := (FSTEPrincipal.Pedidos.RecordCount * 14) +
               RLFechCabec.Height + RLFechCabCol.Height + RLFechSum.Height + RLFechFooter.Height +
               FSTEPrincipal.altExtra + FSTEPrincipal.margTop + FSTEPrincipal.margBot;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then
      tmPagina := 80
    else if tmPagina > FSTEPrincipal.tmMax then
              tmPagina := FSTEPrincipal.tmMax;

    RLFechamento.PageSetup.PaperHeight := tmPagina;

    RLFechamento.Margins.TopMargin := FSTEPrincipal.margTop;
    RLFechamento.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLFechamento.Margins.LeftMargin := FSTEPrincipal.margEsq;
    RLFechamento.Margins.RightMargin := FSTEPrincipal.margDir;

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



procedure TFSTEImpressao.RLDetInternoBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if FSTEPrincipal.LctWrkObs1.AsString <> '' then
  begin
    RLIntObs1.Visible := True;
    RLDetInterno.Height := 33;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
    begin
      RLIntObs2.Visible := True;
      RLDetInterno.Height := 48;
    end
    else
      RLPedObs2.Visible := False;
  end
  else begin
    RLIntObs1.Visible := False;
    RLIntObs2.Visible := False;
    RLDetInterno.Height := 18;
  end;

end;


procedure TFSTEImpressao.RLDetPedidoBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if FSTEPrincipal.LctWrkObs1.AsString <> '' then
  begin
    RLPedObs1.Visible := True;
    RLDetPedido.Height := 30;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
    begin
      RLPedObs2.Visible := True;
      RLDetPedido.Height := 45;
    end
    else
      RLPedObs2.Visible := False;
  end
  else begin
    RLPedObs1.Visible := False;
    RLPedObs2.Visible := False;
    RLDetPedido.Height := 15;
  end;

end;

end.
