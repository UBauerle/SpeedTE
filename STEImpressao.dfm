object FSTEImpressao: TFSTEImpressao
  Left = 0
  Top = 0
  Caption = 'FSTEImpressao'
  ClientHeight = 507
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLPedido: TRLReport
    Left = 6
    Top = 8
    Width = 302
    Height = 454
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = FSTEPrincipal.DSLctWrk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 80.000000000000000000
    PageSetup.PaperHeight = 120.000000000000000000
    object RLCabec: TRLBand
      Left = 30
      Top = 19
      Width = 246
      Height = 159
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLPanel2: TRLPanel
        Left = 0
        Top = 0
        Width = 246
        Height = 58
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedBottom = True
        object RLLogo: TRLImage
          Left = 0
          Top = 4
          Width = 50
          Height = 50
          Borders.Sides = sdCustom
          Borders.DrawLeft = True
          Borders.DrawTop = True
          Borders.DrawRight = True
          Borders.DrawBottom = True
          Stretch = True
          Transparent = False
        end
        object RLUsuario: TRLLabel
          Left = 52
          Top = 0
          Width = 63
          Height = 15
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLEnder1: TRLLabel
          Left = 52
          Top = 15
          Width = 44
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLEnder2: TRLLabel
          Left = 52
          Top = 27
          Width = 44
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLWAPP: TRLLabel
          Left = 72
          Top = 42
          Width = 42
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLImgWhats: TRLImage
          Left = 52
          Top = 39
          Width = 18
          Height = 18
          Picture.Data = {
            07544269746D617046020000424D460200000000000076000000280000001D00
            00001D0000000100040000000000D00100000000000000000000100000000000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FF88FFFFFFFFFFFFFFFFFFFFFFFFF000FF82668FFF866666667FFFFFFFFF
            F000FFF666666666666666666FFFFFFFF000FFF767766668FFFFFF76668FFFFF
            F000FFF866FF88FFFFFFFFFF7628FFFFF000FFFF66FFFFFFFFFFFFFFF862FFFF
            F000FFFF768FFFFFFFFFFFFFFF866FFFF000FFFF668FFFFFFFF86666FFF668FF
            F000FFF867FFFFFFF86666666FFF66FFF000FFF66FFFFFFF766666666FFF668F
            F000FFF66FFFFFF7667FF627FFFF868FF000FF866FFFFF8668FFFFFFFFFF867F
            F000FF867FFFFF667FFFFFFFFFFFF66FF000FF866FFFF666FFFFFFFFFFFF866F
            F000FFF66FFFF6668FFFFFFFFFFF867FF000FFF66FFF86666FFFFFFFFFFF768F
            F000FFF668FFF6667FFFFFFFFFFF66FFF000FFF866FFF662FFFFFFFFFFF866FF
            F000FFFF668FFF77FFFFFFFFFFF668FFF000FFFF8668FFFFFFFFFFFFFF666FFF
            F000FFFFF8668FFFFFFFFFFFF666FFFFF000FFFFFF7667FFFFFFFFF8666FFFFF
            F000FFFFFFF866668FFF876666FFFFFFF000FFFFFFFFF766666666668FFFFFFF
            F000FFFFFFFFFFF8766678FFFFFFFFFFF000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            F000FFFFFFFFFFFFFFFFFFFFFFFFFFFFF000}
          Stretch = True
        end
        object RLImgFone: TRLImage
          Left = 140
          Top = 39
          Width = 18
          Height = 18
          Picture.Data = {
            07544269746D617076040000424D760400000000000076000000280000002000
            0000200000000100080000000000000400000000000000000000100000001000
            0000000000000000800000800000008080008000000080008000808000008080
            8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0F0F0F0800080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0F080003030300080F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F080003030B0303030300080F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F080003030B0B0B03030303030300080F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F080003030B0B0B0B0B030303030303030300080F0F0F0F0F0F0F
            0F0F0F0F080003030B0B0B0B0B0B0F0303030303030303030300080F0F0F0F0F
            0F0F080003030B0B0B0B0B0B0F0F0F03030303030303030303030300080F0F0F
            0F0F00030B0B0B0B0B0B0F0F0F0F0B0B03030303030303030303000000000000
            0F0F00030B0B0B0B0F0F0F0F0B0B0B0B0B030303030303030300000B0B030303
            000F00030B0B0F0F0F0F0B0B0B0B0B0B0B0B03030303030303000B0B0B030303
            030000030F0F0F0F0B0B0B0B03000B0B0B0B0B030303030300030B0303000000
            030008030F0F0B0B0B0B03000F0F030B0B0B0B0B030303030003030B0B030303
            00000F08030B0B0B03000F0F030B03000B0B0B0B0B03030300000B0B0B030303
            03000F0F08030B0B0F0F030B03000F0F030B0B0B0B0B030300030B0B0B030303
            03000F0F0F08030B0B0B03000F0F030B03000B0B0B0B0B0300030B0B0B030303
            03000F0F0F0F08030B0B0F0F030B03000F0F030B0B0B0B0B00030B0B0B0F0F0F
            03000F0F0F0F0F08030B0B0B03000F0F030B0B0B0B0B030300030B0B0F0B0B0B
            0F080F0F0F0F0F0F08030B0B0F0F030B0B0B0B0B000B030300030B0B0F0B0B0B
            080F0F0F0F0F0F000000030B0B0B0B0B0B0B0000000B030300030B0F0B0B0B08
            0F0F0F0F0F0F000B0B0300030B0B0B0303000303000F0B00030B0F0B0B0B080F
            0F0F0F0F0F0F000B0000030000000B030300030B0B0000030F0F0B0B0B080F0F
            0F0F0F0F0F0F00000B0B030303000B0303000B0B0B0B0F0F0B0B0B00080F0F0F
            0F0F0F0F0F0F000B0B0B0B0303000F0B000B0B0B0F0F0B0B0B00080F0F0F0F0F
            0F0F0F0F0F0F0F000B0B0B0B030300000B0F0F0F0B0B0B00080F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F000B0B0B0F0F0F0F0F0B0B0B0000080F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F00000F0B0B0B0B0B0000080F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0800000000080F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F
            0F0F}
          Stretch = True
        end
        object RLFONE: TRLLabel
          Left = 164
          Top = 42
          Width = 41
          Height = 12
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLNome: TRLLabel
        Left = 12
        Top = 60
        Width = 54
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLEndereco: TRLLabel
        Left = 12
        Top = 80
        Width = 75
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLBairro: TRLLabel
        Left = 12
        Top = 100
        Width = 54
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLRefer: TRLLabel
        Left = 12
        Top = 120
        Width = 50
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLFoneClie: TRLLabel
        Left = 152
        Top = 139
        Width = 94
        Height = 19
        Align = faRightBottom
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLEntrega: TRLLabel
        Left = 0
        Top = 140
        Width = 79
        Height = 18
        Align = faLeftBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLImgFoneClie: TRLLabel
        Left = 138
        Top = 139
        Width = 40
        Height = 20
        Caption = #39
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Wingdings 2'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLDetCabec: TRLBand
      Left = 30
      Top = 178
      Width = 246
      Height = 15
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLPedCab1: TRLLabel
        Left = 0
        Top = 0
        Width = 12
        Height = 14
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sq'
      end
      object RLPedCab2: TRLLabel
        Left = 15
        Top = 0
        Width = 52
        Height = 14
        Caption = 'Descri'#231#227'o'
      end
      object RLPedCab3: TRLLabel
        Left = 138
        Top = 0
        Width = 16
        Height = 14
        Align = faRightMost
        Alignment = taCenter
        AutoSize = False
        Caption = 'Qt'
      end
      object RLPedCab4: TRLLabel
        Left = 154
        Top = 0
        Width = 44
        Height = 14
        Align = faRightMost
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Unit'
      end
      object RLPedCab5: TRLLabel
        Left = 198
        Top = 0
        Width = 48
        Height = 14
        Align = faRightMost
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total'
      end
    end
    object RLDetPedido: TRLBand
      Left = 30
      Top = 193
      Width = 246
      Height = 45
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BeforePrint = RLDetPedidoBeforePrint
      object RLPedDd5: TRLDBText
        Left = 196
        Top = 0
        Width = 48
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Total'
        DataSource = FSTEPrincipal.DSLctWrk
        Text = ''
      end
      object RLPedDd4: TRLDBText
        Left = 156
        Top = 0
        Width = 44
        Height = 15
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Valor'
        DataSource = FSTEPrincipal.DSLctWrk
        Text = ''
      end
      object RLPedDd3: TRLDBText
        Left = 138
        Top = 0
        Width = 16
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'Quant'
        DataSource = FSTEPrincipal.DSLctWrk
        Text = ''
      end
      object RLPedDd1: TRLDBText
        Left = 0
        Top = 0
        Width = 12
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'Lcto'
        DataSource = FSTEPrincipal.DSLctWrk
        Text = ''
      end
      object RLPedDd2: TRLDBText
        Left = 14
        Top = 0
        Width = 120
        Height = 15
        AutoSize = False
        DataField = 'Produto'
        DataSource = FSTEPrincipal.DSLctWrk
        Text = ''
      end
      object RLPedObs1: TRLDBText
        Left = 6
        Top = 16
        Width = 25
        Height = 12
        DataField = 'Obs1'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLPedObs2: TRLDBText
        Left = 6
        Top = 29
        Width = 25
        Height = 12
        DataField = 'Obs2'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    object RLSumario: TRLBand
      Left = 30
      Top = 238
      Width = 246
      Height = 74
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLVlrPago: TRLLabel
        Left = 128
        Top = 36
        Width = 104
        Height = 14
        Alignment = taRightJustify
        Caption = 'Vlr.pago: 999.999,00'
      end
      object RLTroco: TRLLabel
        Left = 147
        Top = 52
        Width = 85
        Height = 14
        Alignment = taRightJustify
        Caption = 'Troco: xxxxxxxx'
      end
      object RLMeioPagto: TRLLabel
        Left = 152
        Top = 20
        Width = 80
        Height = 14
        Alignment = taRightJustify
        Caption = 'Pagto: C.Credito'
      end
      object RLValor: TRLLabel
        Left = 80
        Top = 20
        Width = 32
        Height = 14
        Alignment = taRightJustify
        Caption = 'Valor:'
      end
      object RLTele: TRLLabel
        Left = 86
        Top = 36
        Width = 26
        Height = 14
        Alignment = taRightJustify
        Caption = 'Tele:'
      end
      object RLTotal: TRLLabel
        Left = 4
        Top = 52
        Width = 108
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total: 991.234,56'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 4
        Top = 4
        Width = 94
        Height = 14
        Info = itDetailCount
        Text = 'Itens: '
      end
    end
    object RLFooter: TRLBand
      Left = 30
      Top = 312
      Width = 246
      Height = 16
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLDtTurnoNro: TRLLabel
        Left = 0
        Top = 1
        Width = 63
        Height = 12
        Align = faLeftTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel19: TRLLabel
        Left = 203
        Top = 1
        Width = 43
        Height = 12
        Align = faRightTop
        Alignment = taRightJustify
        Caption = 'RLPedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLFechamento: TRLReport
    Left = 314
    Top = 8
    Width = 302
    Height = 454
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = FSTEPrincipal.DSPedidos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 80.000000000000000000
    PageSetup.PaperHeight = 120.000000000000000000
    object RLFechCabec: TRLBand
      Left = 30
      Top = 19
      Width = 246
      Height = 32
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLFechUsuar: TRLLabel
        Left = 0
        Top = 0
        Width = 246
        Height = 15
        Align = faTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLFechData: TRLLabel
        Left = 174
        Top = 16
        Width = 72
        Height = 15
        Align = faRightBottom
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel18: TRLLabel
        Left = 0
        Top = 16
        Width = 72
        Height = 15
        Align = faLeftBottom
        Caption = 'Fechamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLFechCabCol: TRLBand
      Left = 30
      Top = 51
      Width = 246
      Height = 14
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLFechCab1: TRLLabel
        Left = 0
        Top = 0
        Width = 32
        Height = 12
        Caption = 'Cliente'
      end
      object RLFechCab2: TRLLabel
        Left = 96
        Top = 0
        Width = 44
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Valor'
      end
      object RLFechCab3: TRLLabel
        Left = 140
        Top = 0
        Width = 32
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Tele'
      end
      object RLFechCab4: TRLLabel
        Left = 172
        Top = 0
        Width = 48
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Total'
      end
      object RLFechCab5: TRLLabel
        Left = 220
        Top = 0
        Width = 22
        Height = 12
        Alignment = taCenter
        AutoSize = False
        Caption = 'MPg'
      end
    end
    object RLFechDetal: TRLBand
      Left = 30
      Top = 65
      Width = 246
      Height = 14
      object RLFechDd1: TRLDBText
        Left = 0
        Top = 1
        Width = 96
        Height = 12
        AutoSize = False
        DataField = 'ZC_FoneNome'
        DataSource = FSTEPrincipal.DSPedidos
        Text = ''
      end
      object RLFechDd2: TRLDBText
        Left = 96
        Top = 1
        Width = 44
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Total'
        DataSource = FSTEPrincipal.DSPedidos
        Text = ''
      end
      object RLFechDd3: TRLDBText
        Left = 140
        Top = 1
        Width = 32
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VlrTele'
        DataSource = FSTEPrincipal.DSPedidos
        Text = ''
      end
      object RLFechDd4: TRLDBText
        Left = 172
        Top = 1
        Width = 48
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'ZC_Total'
        DataSource = FSTEPrincipal.DSPedidos
        Text = ''
      end
      object RLFechDd5: TRLDBText
        Left = 219
        Top = -2
        Width = 24
        Height = 12
        Alignment = taCenter
        AutoSize = False
        DataField = 'ZC_MPgto'
        DataSource = FSTEPrincipal.DSPedidos
        Text = ''
      end
    end
    object RLFechSum: TRLBand
      Left = 30
      Top = 79
      Width = 246
      Height = 112
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLTotValor: TRLDBResult
        Left = 96
        Top = 0
        Width = 44
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Total'
        DataSource = FSTEPrincipal.DSPedidos
        DisplayMask = ',0.00'
        Info = riSum
        Text = ''
      end
      object RLTotTele: TRLDBResult
        Left = 140
        Top = 2
        Width = 32
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VlrTele'
        DataSource = FSTEPrincipal.DSPedidos
        Info = riSum
        Text = ''
      end
      object RLTotGeral: TRLDBResult
        Left = 172
        Top = 2
        Width = 48
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'ZC_Total'
        DataSource = FSTEPrincipal.DSPedidos
        Info = riSum
        Text = ''
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 2
        Width = 94
        Height = 12
        Info = itDetailCount
        Text = 'Pedidos #'
      end
      object RLLabel11: TRLLabel
        Left = 59
        Top = 12
        Width = 35
        Height = 12
        Caption = 'M'#233'dias:'
      end
      object RLMediaValor: TRLDBResult
        Left = 97
        Top = 12
        Width = 44
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'Total'
        DataSource = FSTEPrincipal.DSPedidos
        Info = riAverage
        Text = ''
      end
      object RLMediaGeral: TRLDBResult
        Left = 175
        Top = 12
        Width = 44
        Height = 12
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'ZC_Total'
        DataSource = FSTEPrincipal.DSPedidos
        Info = riAverage
        Text = ''
      end
      object RLLabel12: TRLLabel
        Left = 2
        Top = 24
        Width = 89
        Height = 12
        Caption = 'Meios de pagamento'
      end
      object RLLabel13: TRLLabel
        Left = 22
        Top = 36
        Width = 40
        Height = 12
        Alignment = taRightJustify
        Caption = 'Dinheiro:'
      end
      object RLLabel14: TRLLabel
        Left = 16
        Top = 48
        Width = 46
        Height = 12
        Alignment = taRightJustify
        Caption = 'C.Cr'#233'dito:'
      end
      object RLLabel15: TRLLabel
        Left = 19
        Top = 60
        Width = 43
        Height = 12
        Alignment = taRightJustify
        Caption = 'C.D'#233'bito:'
      end
      object RLLabel16: TRLLabel
        Left = 155
        Top = 36
        Width = 19
        Height = 12
        Alignment = taRightJustify
        Caption = 'Pix:'
      end
      object RLLabel17: TRLLabel
        Left = 140
        Top = 48
        Width = 34
        Height = 12
        Alignment = taRightJustify
        Caption = 'Outros:'
      end
      object RLLabDin: TRLLabel
        Left = 64
        Top = 36
        Width = 64
        Height = 12
        Alignment = taRightJustify
        Transparent = False
      end
      object RLLabCCred: TRLLabel
        Left = 64
        Top = 48
        Width = 64
        Height = 12
        Alignment = taRightJustify
        Transparent = False
      end
      object RLLabCDeb: TRLLabel
        Left = 64
        Top = 60
        Width = 64
        Height = 12
        Alignment = taRightJustify
        Transparent = False
      end
      object RLLabPix: TRLLabel
        Left = 176
        Top = 36
        Width = 64
        Height = 12
        Alignment = taRightJustify
        Transparent = False
      end
      object RLLabOutros: TRLLabel
        Left = 176
        Top = 48
        Width = 64
        Height = 12
        Alignment = taRightJustify
        Transparent = False
      end
      object RLLabAuxil: TRLLabel
        Left = 176
        Top = 60
        Width = 50
        Height = 12
        Visible = False
      end
      object RLPanTurnos: TRLPanel
        Left = 0
        Top = 73
        Width = 246
        Height = 38
        Align = faBottom
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        object RLLabel1: TRLLabel
          Left = 40
          Top = 1
          Width = 30
          Height = 11
          Alignment = taRightJustify
          Caption = 'Turno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 96
          Top = 1
          Width = 44
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 140
          Top = 1
          Width = 32
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tele'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 172
          Top = 1
          Width = 48
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 40
          Top = 12
          Width = 30
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Dia'
        end
        object RLLabVlrDia: TRLLabel
          Left = 96
          Top = 12
          Width = 44
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabTeleDia: TRLLabel
          Left = 140
          Top = 12
          Width = 32
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabTotalDia: TRLLabel
          Left = 172
          Top = 12
          Width = 48
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel9: TRLLabel
          Left = 40
          Top = 24
          Width = 30
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Noite'
        end
        object RLLabVlrNoite: TRLLabel
          Left = 96
          Top = 24
          Width = 44
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabTeleNoite: TRLLabel
          Left = 140
          Top = 24
          Width = 32
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabTotalNoite: TRLLabel
          Left = 172
          Top = 24
          Width = 48
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabel6: TRLLabel
          Left = 72
          Top = 1
          Width = 24
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Qtd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabQtdDia: TRLLabel
          Left = 72
          Top = 12
          Width = 24
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
        object RLLabQtdNoite: TRLLabel
          Left = 72
          Top = 24
          Width = 24
          Height = 12
          Alignment = taRightJustify
          AutoSize = False
        end
      end
    end
    object RLFechFooter: TRLBand
      Left = 30
      Top = 191
      Width = 246
      Height = 16
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLFechEmissao: TRLLabel
        Left = 0
        Top = 1
        Width = 72
        Height = 12
        Align = faLeftTop
      end
      object RLLabel20: TRLLabel
        Left = 179
        Top = 1
        Width = 67
        Height = 12
        Align = faRightTop
        Alignment = taRightJustify
        Caption = 'RLFechamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object RLInterno: TRLReport
    Left = 622
    Top = 8
    Width = 302
    Height = 454
    Margins.LeftMargin = 8.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 7.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    DataSource = FSTEPrincipal.DSLctWrk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 80.000000000000000000
    PageSetup.PaperHeight = 120.000000000000000000
    object RLCabInterno: TRLBand
      Left = 30
      Top = 19
      Width = 246
      Height = 117
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      object RLNomeInt: TRLLabel
        Left = 12
        Top = 40
        Width = 54
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLEnderInt: TRLLabel
        Left = 12
        Top = 54
        Width = 55
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLBairroInt: TRLLabel
        Left = 12
        Top = 68
        Width = 56
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLReferInt: TRLLabel
        Left = 12
        Top = 82
        Width = 54
        Height = 14
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLEntregaInt: TRLLabel
        Left = 0
        Top = 98
        Width = 94
        Height = 18
        Align = faLeftBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLIdInterno: TRLLabel
        Left = 0
        Top = 0
        Width = 246
        Height = 18
        Align = faTop
        Caption = 'Cozinha/Chapa/Interno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLFoneInt: TRLLabel
        Left = 183
        Top = 100
        Width = 63
        Height = 16
        Align = faRightBottom
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLNroInterno: TRLLabel
        Left = 0
        Top = 18
        Width = 246
        Height = 18
        Align = faTop
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLDetCabInt: TRLBand
      Left = 30
      Top = 136
      Width = 246
      Height = 15
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLIntCab1: TRLLabel
        Left = 0
        Top = 0
        Width = 18
        Height = 16
        Align = faLeftOnly
        Alignment = taCenter
        AutoSize = False
        Caption = 'Sq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLIntCab2: TRLLabel
        Left = 18
        Top = 0
        Width = 62
        Height = 16
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLIntCab3: TRLLabel
        Left = 224
        Top = 0
        Width = 22
        Height = 16
        Align = faRightOnly
        Alignment = taCenter
        AutoSize = False
        Caption = 'Qtd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLDetInterno: TRLBand
      Left = 30
      Top = 151
      Width = 246
      Height = 51
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      BeforePrint = RLDetInternoBeforePrint
      object RLIntDd3: TRLDBText
        Left = 224
        Top = 1
        Width = 22
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'Quant'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLIntDd1: TRLDBText
        Left = 0
        Top = 1
        Width = 18
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'Lcto'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLIntDd2: TRLDBText
        Left = 19
        Top = 1
        Width = 194
        Height = 16
        AutoSize = False
        DataField = 'Produto'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLIntObs1: TRLDBText
        Left = 8
        Top = 18
        Width = 35
        Height = 14
        DataField = 'Obs1'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLIntObs2: TRLDBText
        Left = 8
        Top = 34
        Width = 35
        Height = 14
        DataField = 'Obs2'
        DataSource = FSTEPrincipal.DSLctWrk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
    end
    object RLSumarInt: TRLBand
      Left = 30
      Top = 202
      Width = 246
      Height = 18
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLSystemInfo2: TRLSystemInfo
        Left = 4
        Top = 4
        Width = 94
        Height = 14
        Info = itDetailCount
        Text = 'Itens: '
      end
    end
    object RLFootInt: TRLBand
      Left = 30
      Top = 220
      Width = 246
      Height = 16
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel60: TRLLabel
        Left = 202
        Top = 1
        Width = 44
        Height = 12
        Align = faRightTop
        Alignment = taRightJustify
        Caption = 'RLInterno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
  end
end
