unit STEImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLPrinters;
  Procedure ImprimePedido(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimePedidoRP(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimeInterno(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimeInternoRP(pmtPreview:Boolean; pmtVias:Integer=1);
  Procedure ImprimeFechamento(pmtData:TDateTime;
                              pmtDtFim:TDateTime;
                              pmtTurno:String;
                              pmtDin,pmtCCred,pmtCDeb,pmtPix,pmtOutros:Currency;
                              pmtQtdDia:Integer;pmtVlrDia,pmtTeleDia,pmtTotalDia:Currency;
                              pmtQtdNoite:Integer;pmtVlrNoite,pmtTeleNoite,pmtTotalNoite:Currency;
                              pmtTipo: String);  //        pmtTipo:String='Turno' ou 'Periodo);

type
  TFSTEImpressao = class(TForm)
    RLPedido: TRLReport;
    RLCabec: TRLBand;
    RLDetCabec: TRLBand;
    RLPedCab2: TRLLabel;
    RLPedCab1: TRLLabel;
    RLPedCab3: TRLLabel;
    RLPedCab4: TRLLabel;
    RLDetPedido: TRLBand;
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
    RLIntCab2: TRLLabel;
    RLIntCab1: TRLLabel;
    RLDetInterno: TRLBand;
    RLIntDd1: TRLDBText;
    RLIntDd2: TRLDBText;
    RLIntObs1: TRLDBText;
    RLIntObs2: TRLDBText;
    RLSumarInt: TRLBand;
    RLFootInt: TRLBand;
    RLLabel60: TRLLabel;
    RLFoneInt: TRLLabel;
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
    RLInternoRP: TRLReport;
    RLCabInternoRP: TRLBand;
    RLIdInternoRP: TRLLabel;
    RLNroInternoRP: TRLLabel;
    RLDetCabIntRP: TRLBand;
    RLIntCab2RP: TRLLabel;
    RLIntCab1RP: TRLLabel;
    RLDetInternoRD: TRLBand;
    RLIntDd1RP: TRLDBText;
    RLIntDd2RP: TRLDBText;
    RLIntObs1RP: TRLDBText;
    RLIntObs2RP: TRLDBText;
    RLSumarIntRP: TRLBand;
    RLSystemInfo4: TRLSystemInfo;
    RLFootIntRP: TRLBand;
    RLLabel28: TRLLabel;
    RLNomeIntRP: TRLLabel;
    RLEnderIntRP: TRLLabel;
    RLBairroIntRP: TRLLabel;
    RLReferIntRP: TRLLabel;
    RLEntregaIntRP: TRLLabel;
    RLFoneIntRP: TRLLabel;
    RLPanIdInterno: TRLPanel;
    RLIdInterno: TRLLabel;
    RLNroInterno: TRLLabel;
    RLPedidoRP: TRLReport;
    RLCabecRP: TRLBand;
    RLDetCabecRP: TRLBand;
    RLPedCab2RP: TRLLabel;
    RLPedCab1RP: TRLLabel;
    RLPedCab3RP: TRLLabel;
    RLPedCab4RP: TRLLabel;
    RLDetPedidoRP: TRLBand;
    RLPedDd4RP: TRLDBText;
    RLPedDd3RP: TRLDBText;
    RLPedDd1RP: TRLDBText;
    RLPedDd2RP: TRLDBText;
    RLPedObs1RP: TRLDBText;
    RLPedObs2RP: TRLDBText;
    RLSumarioRP: TRLBand;
    RLVlrPagoRP: TRLLabel;
    RLTrocoRP: TRLLabel;
    RLMeioPagtoRP: TRLLabel;
    RLValorRP: TRLLabel;
    RLTeleRP: TRLLabel;
    RLTotalRP: TRLLabel;
    RLSystemInfo5: TRLSystemInfo;
    RLDtTurnoNroRP: TRLLabel;
    RLFooterRP: TRLBand;
    RLLabel42: TRLLabel;
    RLEntregaRp: TRLLabel;
    RLFoneCLieRP: TRLLabel;
    RLImgFoneClieRP: TRLLabel;
    RLReferRP: TRLLabel;
    RLBairroRP: TRLLabel;
    RLEnderecoRP: TRLLabel;
    RLNomeRP: TRLLabel;
    RLLogoRP: TRLImage;
    RLUsuarioRP: TRLLabel;
    RLEnder1RP: TRLLabel;
    RLEnder2RP: TRLLabel;
    RLImgWhatsRP: TRLImage;
    RLWAPPRP: TRLLabel;
    RLImgFoneRP: TRLImage;
    RLFONERP: TRLLabel;
    RLDraw1: TRLDraw;
    RLDtTurnoNro: TRLLabel;
    procedure RLDetPedidoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetInternoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetInternoRDBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetPedidoRPBeforePrint(Sender: TObject; var PrintIt: Boolean);
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
    // Define largura das colunas
    RLPedCab1.Width := Trunc(wLargLst * 0.081);       // Quantidade
    RLPedCab3.Width := Trunc(wLargLst * 0.170);        // Valor unitário
    RLPedCab4.Width := Trunc(wLargLst * 0.195);       // Valor total
    RLPedCab2.Width := wLargLst - (RLPedCab1.Width + RLPedCab3.Width  + RLPedCab4.Width); // Produto
    // Define posições
    RLPedCab1.Left := 0;                                   // Quantidade
    RLPedCab2.Left := RLPedCab1.Left + RLPedCab1.Width;    // Descricao do produto
    RLPedCab3.Left := RLPedCab2.Left + RLPedCab2.Width;    // Vlr unitário
    RLPedCab4.Left := RLPedCab3.Left + RLPedCab3.Width;    // Vlr total
    RLPedCab3.Visible := FSTEPrincipal.lValorUnit;
    // Define larguras e posições linha detalhe
    RLPedDd1.Left  := RLPedCab1.Left;
    RLPedDd1.Width := RLPedCab1.Width;
    RLPedDd2.Left  := RLPedCab2.Left;
    RLPedDd2.Width := RLPedCab2.Width;
    RLPedDd3.Left  := RLPedCab3.Left;
    RLPedDd3.Width := RLPedCab3.Width;
    RLPedDd4.Left  := RLPedCab4.Left;
    RLPedDd4.Width := RLPedCab4.Width;
    RLPedDd3.Visible := FSTEPrincipal.lValorUnit;
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
    RLDtTurnoNro.Caption := FSTEPrincipal.PedWrkZC_DataHora.AsString;
    if FSTEPrincipal.lImpTurno then
      RLDtTurnoNro.Caption := RLDtTurnoNro.Caption + '   ' + FSTEPrincipal.PedWrkZC_TurnoNro.AsString;
     RLDtTurnoNro.Caption := RLDtTurnoNro.Caption + '  ';

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
      2:RLEntrega.Caption := 'Consumo local';
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
    //
    xPrinter := FSTEPrincipal.idPrinter;
    if not DefineImpressora(True,xPrinter,xportaPrt,xdriverPrt,indexPrt) then
      lPreview := True;
    //
    nAltura := RLCabec.Height + RLDetCabec.Height + RLSumario.Height + RLFooter.Height;
    FSTEPrincipal.LctWrk.First;
    while not FSTEPrincipal.LctWrk.Eof do
    begin
      if FSTEPrincipal.linPedFixa then
        nAltura := nAltura + 50
      else begin
        nAltura := nAltura + 18;
        if FSTEPrincipal.LctWrkObs1.AsString <> '' then
          nAltura := nAltura + 16;
        if FSTEPrincipal.LctWrkObs2.AsString <> '' then
          nAltura := nAltura + 16;
      end;
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


Procedure ImprimePedidoRP(pmtPreview:Boolean; pmtVias:Integer=1);
var nAltura,tmPagina,i,posImg: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    lPreview := pmtPreview;

    RLPedidoRP.Margins.TopMargin := FSTEPrincipal.margTop;
    RLPedidoRP.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLPedidoRP.Margins.LeftMargin := FSTEPrincipal.margEsq;
    RLPedidoRP.Margins.RightMargin := FSTEPrincipal.margDir;
    wLargLst := RLCabecRP.Width;
    // Define largura das colunas
    RLPedCab1RP.Width := Trunc(wLargLst * 0.081);
    RLPedCab3RP.Width := Trunc(wLargLst * 0.170);        // Valor unitário
    RLPedCab4RP.Width := Trunc(wLargLst * 0.195);
    RLPedCab2RP.Width := wLargLst - (RLPedCab1RP.Width + RLPedCab3RP.Width  + RLPedCab4RP.Width);
    // Define posições
    RLPedCab1RP.Left := 0;                                       // Quantidade
    RLPedCab2RP.Left := RLPedCab1RP.Left + RLPedCab1RP.Width;    // Descricao do produto
    RLPedCab3RP.Left := RLPedCab2RP.Left + RLPedCab2RP.Width;
    RLPedCab4RP.Left := RLPedCab3RP.Left + RLPedCab3RP.Width;
    RLPedCab3RP.Visible := FSTEPrincipal.lValorUnit;
    // Define larguras e posições linha detalhe
    RLPedDd1RP.Left  := RLPedCab1RP.Left;
    RLPedDd1RP.Width := RLPedCab1RP.Width;
    RLPedDd2RP.Left  := RLPedCab2RP.Left;
    RLPedDd2RP.Width := RLPedCab2RP.Width;
    RLPedDd3RP.Left  := RLPedCab3RP.Left;
    RLPedDd3RP.Width := RLPedCab3RP.Width;
    RLPedDd4RP.Left  := RLPedCab4RP.Left;
    RLPedDd4RP.Width := RLPedCab4RP.Width;
    RLPedDd3RP.Visible := FSTEPrincipal.lValorUnit;
    //
    if FileExists(FSTEPrincipal.LogoImpres) then
      RLLogoRP.Picture.LoadFromFile(FSTEPrincipal.LogoImpres);
    RLUsuarioRP.Caption := FSTEPrincipal.idUsuario;
    RLEnder1RP.Caption := Trim(FSTEPrincipal.idLograd) + ' ' +
                          Trim(FSTEPrincipal.idNro) + ' ' +
                          Trim(FSTEPrincipal.idCompl) + ' ';
    RLEnder2RP.Caption := Trim(FSTEPrincipal.idBairro) + ' ' +
                          Trim(FSTEPrincipal.idCidade) + ' ' +
                          Trim(FSTEPrincipal.idUF);
    posImg := 52;
    RLImgWhatsRP.Visible := False;
    RLWAPPRP.Visible := False;
    RLImgFoneRP.Visible := False;
    RLFONERP.Visible := False;
    if FSTEPrincipal.idWhats <> '' then
    begin
      RLImgWhatsRP.Left := posImg;
      RLImgWhatsRP.Visible := True;
      RLWAPPRP.Caption := Trim(FSTEPrincipal.idWhats);
      RLWAPPRP.Left := RLImgWhatsRP.Left + RLImgWhatsRP.Width + 1;
      RLWAPPRP.Visible := True;
      posImg := posImg + RLImgWhatsRP.Width + RLWAPPRP.Width + 12;
    end;
    if FSTEPrincipal.idFone <> '' then
    begin
      RLImgFoneRP.Left := posImg;
      RLImgFoneRP.Visible := True;
      RLFONERP.Caption := Trim(FSTEPrincipal.idFone);
      RLFONERP.Left := RLImgFoneRP.Left + RLImgFoneRP.Width + 1;
      RLFONERP.Visible := True;
    end;
    //
    RLNomeRP.Caption := FSTEPrincipal.PedWrkNome.AsString;
    RLEnderecoRP.Caption := FSTEPrincipal.PedWrkEndereco.AsString;
    RLBairroRP.Caption := FSTEPrincipal.PedWrkBairro.AsString;
    RLReferRP.Caption := FSTEPrincipal.PedWrkRefer.AsString;
    //RLFone.Caption := 'Fone: ' + EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    RLFoneClieRP.Caption := ' ' + EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    RLImgFoneClieRP.Left := RLFoneClieRP.Left - RLImgFoneClieRP.Width;
    RLEntregaRP.Visible := FSTEPrincipal.lMdEntrega;
    case FSTEPrincipal.PedWrkEntrega.AsInteger of
      0:RLEntregaRP.Caption := 'Tele-entrega';
      1:RLEntregaRP.Caption := 'Retira';
      2:RLEntregaRP.Caption := 'Consumo local';
      else RLEntregaRP.Caption := '';
    end;
    //
    RLValorRP.Caption := 'Valor: ' + FloatToStrF(FSTEPrincipal.PedWrkTotal.AsCurrency,ffNumber,15,2);
    RLTeleRP.Caption  := 'Tele: '  + FloatToStrF(FSTEPrincipal.PedWrkVlrTele.AsCurrency,ffNumber,15,2);
    RLTotalRP.Caption := 'Total: ' + FloatToStrF(FSTEPrincipal.PedWrkZC_Total.AsCurrency,ffNumber,15,2);

    RLMeioPagtoRP.Caption := 'Pagto: ' + FSTEPrincipal.PedwrkZC_MPagto.AsString;

    RLVlrPagoRP.Caption := 'Vlr pago: ' + FloatToStrF(FSTEPrincipal.PedWrkVlrPago.AsCurrency,ffNumber,15,2);
    if FSTEPrincipal.PedWrkZC_Troco.AsCurrency > 0 then
    begin
      RLTrocoRP.Caption := 'Troco: ' + FloatToStrF(FSTEPrincipal.PedWrkZC_Troco.AsCurrency,ffNumber,15,2);
      RLTrocoRP.Visible := True;
    end
    else RLTrocoRP.Visible := False;
    RLDraw1.Width := wLargLst;

    RLDtTurnoNroRP.Caption := FSTEPrincipal.PedWrkZC_DataHora.AsString;
    if FSTEPrincipal.lImpTurno then
      RLDtTurnoNroRP.Caption := RLDtTurnoNroRP.Caption + '   ' + FSTEPrincipal.PedWrkZC_TurnoNro.AsString;
    RLDtTurnoNroRP.Caption := RLDtTurnoNro.Caption + '  ';
    //
    xPrinter := FSTEPrincipal.idPrinter;
    if not DefineImpressora(True,xPrinter,xportaPrt,xdriverPrt,indexPrt) then
      lPreview := True;
    //
    nAltura := RLCabecRP.Height + RLDetCabecRP.Height + RLSumarioRP.Height + RLFooterRP.Height;
    FSTEPrincipal.LctWrk.First;
    while not FSTEPrincipal.LctWrk.Eof do
    begin
      if FSTEPrincipal.linPedFixa then
        nAltura := nAltura + 50
      else begin
        nAltura := nAltura + 18;
        if FSTEPrincipal.LctWrkObs1.AsString <> '' then
          nAltura := nAltura + 16;
        if FSTEPrincipal.LctWrkObs2.AsString <> '' then
          nAltura := nAltura + 16;
      end;
     FSTEPrincipal.LctWrk.Next;
    end;
    nAltura := nAltura + FSTEPrincipal.altExtra + FSTEPrincipal.margTop + FSTEPrincipal.margBot;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then
      tmPagina := 80
    else if tmPagina > FSTEPrincipal.tmMax then
              tmPagina := FSTEPrincipal.tmMax;
    RLPedidoRP.PageSetup.PaperHeight := tmPagina;
    FFRCtle.RLPreviewSetup1.CustomActionText := '';      // 'Impressao';  //lstAction;
    RLPedidoRP.PrintDialog := FSTEPrincipal.lDialog;
    RLPrinters.RLPrinter.PrinterName := xPrinter;

    if lPreview then
      RLPedidoRP.Preview
    else
      for i:= 1 to pmtVias do
        RLPedidoRP.Print;
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
    RLIntCab1.Left := 0;
    RLIntCab1.Width := 24;
    RLIntCab2.Left := RLIntCab1.Width + 1;
    RLIntDd1.Left := RLIntCab1.Left;
    RLIntDd1.Width := RLIntCab1.Width;
    RLIntDd2.Left := RLIntCab2.Left;
    RLIntDd2.Width := wLargLst - (RLIntDd1.Width + 1);
    RLIntObs1.Left := RLIntCab2.Left;
    RLIntObs2.Left := RLIntCab2.Left;
    //
    RLIdInterno.Caption := FSTEPrincipal.idInterno;
    RLNroInterno.Caption := FSTEPrincipal.PedWrkZC_DataHora.AsString;
    if FSTEPrincipal.lImpTurno then
      RLNroInterno.Caption := RLNroInterno.Caption + '   ' + FSTEPrincipal.PedWrkZC_TurnoNro.AsString;
    RLNroInterno.Caption := RLNroInterno.Caption + '  ';
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
      2:RLEntregaInt.Caption := 'Consumo local';
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
      if FSTEPrincipal.linIntFixa then
        nAltura := nAltura + 56
      else begin
        nAltura := nAltura + 20;
        if FSTEPrincipal.LctWrkObs1.AsString <> '' then
          nAltura := nAltura + 18;
        if FSTEPrincipal.LctWrkObs2.AsString <> '' then
          nAltura := nAltura + 18;
      end;
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


Procedure ImprimeInternoRP(pmtPreview:Boolean; pmtVias:Integer=1);
var nAltura,tmPagina,i: Integer;
    xPrinter,xportaPrt,xdriverPrt: String;
    indexPrt: Integer;
begin
  FSTEImpressao := TFSTEImpressao.Create(nil);
  with FSTEImpressao do
  begin
    lPreview := pmtPreview;
    RLInternoRP.Margins.TopMargin := FSTEPrincipal.margTop;
    RLInternoRP.Margins.BottomMargin := FSTEPrincipal.margBot;
    RLInternoRP.Margins.LeftMargin := FSTEPrincipal.margEsq;
    RLInternoRP.Margins.RightMargin := FSTEPrincipal.margDir;
    wLargLst := RLCabInternoRP.Width;
    //
    RLIntCab1RP.Left := 0;
    RLIntCab1RP.Width := 24;
    RLIntCab2RP.Left := RLIntCab1RP.Width + 1;
    RLIntDd1RP.Left := RLIntCab1RP.Left;
    RLIntDd1RP.Width := RLIntCab1RP.Width;
    RLIntDd2RP.Left := RLIntCab2RP.Left;
    RLIntDd2RP.Width := wLargLst - (RLIntDd1RP.Width + 1);
    RLIntObs1RP.Left := RLIntCab2RP.Left;
    RLIntObs2RP.Left := RLIntCab2RP.Left;
    //
    RLIdInternoRP.Caption := FSTEPrincipal.idInterno;
    RLNroInternoRP.Caption := FSTEPrincipal.PedWrkZC_DataHora.AsString;
    if FSTEPrincipal.lImpTurno then
      RLNroInternoRP.Caption := RLNroInternoRP.Caption + '   ' + FSTEPrincipal.PedWrkZC_TurnoNro.AsString;
    RLNroInternoRP.Caption := RLNroInternoRP.Caption + '  ';
    //
    RLNomeIntRP.Caption := FSTEPrincipal.PedWrkNome.AsString;
    RLEnderIntRP.Caption := FSTEPrincipal.PedWrkEndereco.AsString;
    RLBairroIntRP.Caption := FSTEPrincipal.PedWrkBairro.AsString;
    RLReferIntRP.Caption := FSTEPrincipal.PedWrkRefer.AsString;
    RLFoneIntRP.Caption := EditaFone('',FSTEPrincipal.PedWrkFone.AsString,True);
    //RLEntregaInt.Visible := FSTEPrincipal.lMdEntrega;  Sempre visível
    case FSTEPrincipal.PedWrkEntrega.AsInteger of
      0:RLEntregaIntRP.Caption := 'Tele-entrega';
      1:RLEntregaIntRP.Caption := 'Retira';
      2:RLEntregaIntRP.Caption := 'Consumo local';
      else RLEntregaIntRP.Caption := '';
    end;
    //
    xPrinter := FSTEPrincipal.idPrinter;
    if not DefineImpressora(True,xPrinter,xportaPrt,xdriverPrt,indexPrt) then
      lPreview := True;
    //
    nAltura := RLCabInternoRP.Height + RLDetCabIntRP.Height + RLSumarIntRP.Height + RLFootIntRP.Height;
    FSTEPrincipal.LctWrk.First;
    while not FSTEPrincipal.LctWrk.Eof do
    begin
      if FSTEPrincipal.linIntFixa then
        nAltura := nAltura + 56
      else begin
        nAltura := nAltura + 20;
        if FSTEPrincipal.LctWrkObs1.AsString <> '' then
          nAltura := nAltura + 18;
        if FSTEPrincipal.LctWrkObs2.AsString <> '' then
          nAltura := nAltura + 18;
      end;
      FSTEPrincipal.LctWrk.Next;
    end;
    nAltura := nAltura + FSTEPrincipal.altExtra + FSTEPrincipal.margTop + FSTEPrincipal.margBot;
    tmPagina := Trunc(nAltura / 3.7795) + 1;
    if tmPagina < 80 then
      tmPagina := 80
    else if tmPagina > FSTEPrincipal.tmMax then
              tmPagina := FSTEPrincipal.tmMax;
    RLInternoRP.PageSetup.PaperHeight := tmPagina;
    FFRCtle.RLPreviewSetup1.CustomActionText := '';      // 'Impressao';  //lstAction;
    RLInternoRP.PrintDialog := FSTEPrincipal.lDialog;
    RLPrinters.RLPrinter.PrinterName := xPrinter;

    if lPreview then
      RLInternoRP.Preview
    else
      for i := 1 to pmtVias do
        RLInternoRP.Print;
 end;
 FSTEImpressao.Free;

end;


Procedure ImprimeFechamento(pmtData:TDateTime;
                            pmtDtFim:TDateTime;
                            pmtTurno:String;
                            pmtDin,pmtCCred,pmtCDeb,pmtPix,pmtOutros:Currency;
                            pmtQtdDia:Integer;pmtVlrDia,pmtTeleDia,pmtTotalDia:Currency;
                            pmtQtdNoite:Integer;pmtVlrNoite,pmtTeleNoite,pmtTotalNoite:Currency;
                            pmtTipo: String);  //        'Turno' 'Total'  'Periodo'
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
     if pmtTurno = 'D' then
        RLFechData.Caption := RLFechData.Caption + 'DIA'
      else
        RLFechData.Caption := RLFechData.Caption + 'NOITE';
    end
    else begin
      if pmtTipo = 'Total' then
        RLFechData.Caption := 'Todos as datas'
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
    if pmtTipo = 'Turno' then
    begin                             // Impressão do turno
      RLPanTurnos.Visible := False;
      RLFechSum.Height := 90;
    end
    else begin                        // Total ou Periodo, Turno Dia, Noite ou Ambos  (D,N,DN)
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
  if FSTEPrincipal.linIntFixa then
    RLDetInterno.Height := 56
  else begin
    RLDetInterno.Height := 20;
    if FSTEPrincipal.LctWrkObs1.AsString <> '' then
      RLDetInterno.Height := 38;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
      RLDetInterno.Height := 56;
  end;

end;


procedure TFSTEImpressao.RLDetInternoRDBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if FSTEPrincipal.linIntFixa then
    RLDetInterno.Height := 56
  else begin
    RLDetInternoRD.Height := 20;
    if FSTEPrincipal.LctWrkObs1.AsString <> '' then
      RLDetInternoRD.Height := 38;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
      RLDetInternoRD.Height := 56;
  end;

end;

procedure TFSTEImpressao.RLDetPedidoBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  if FSTEPrincipal.linPedFixa then
    RLDetPedido.Height := 50
  else begin
    RLDetPedido.Height := 18;
    if FSTEPrincipal.LctWrkObs1.AsString <> '' then
      RLDetPedido.Height := 34;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
      RLDetPedido.Height := 50;
  end;

end;

procedure TFSTEImpressao.RLDetPedidoRPBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if FSTEPrincipal.linPedFixa then
    RLDetPedidoRP.Height := 50
  else begin
    RLDetPedidoRP.Height := 18;
    if FSTEPrincipal.LctWrkObs1.AsString <> '' then
      RLDetPedidoRP.Height := 34;
    if FSTEPrincipal.LctWrkObs2.AsString <> '' then
      RLDetPedidoRP.Height := 50;
  end;

end;

end.
