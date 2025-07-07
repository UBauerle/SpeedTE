object FSTEConsTurno: TFSTEConsTurno
  Left = 0
  Top = 0
  Caption = 'FSTEConsTurno'
  ClientHeight = 441
  ClientWidth = 1008
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 16
  object PanPedidos: TPanel
    Left = 179
    Top = 0
    Width = 829
    Height = 441
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 693
    object LabPedTurno: TLabel
      Left = 1
      Top = 1
      Width = 827
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Pedidos'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 65
    end
    object GridPedidos: TDBGrid
      Left = 1
      Top = 21
      Width = 827
      Height = 279
      Align = alClient
      DataSource = FSTEPrincipal.DSPedidos
      DrawingStyle = gdsClassic
      FixedColor = clMoneyGreen
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Fone'
          Title.Alignment = taCenter
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Nome'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr pedido'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VlrTele'
          Title.Alignment = taRightJustify
          Title.Caption = 'Vlr Tele'
          Width = 93
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ZC_MPgto'
          Title.Alignment = taCenter
          Title.Caption = 'Pagto'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZC_Total'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor total'
          Width = 93
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ZC_Entrega'
          Title.Caption = 'Entrega'
          Width = 61
          Visible = True
        end>
    end
    object PanRodape: TPanel
      Left = 1
      Top = 383
      Width = 827
      Height = 57
      Align = alBottom
      TabOrder = 1
      ExplicitWidth = 691
      DesignSize = (
        827
        57)
      object LabNRegs: TLabel
        Left = 12
        Top = 37
        Width = 66
        Height = 16
        Caption = 'LabNRegs'
      end
      object NavPedidos: TDBNavigator
        Left = 12
        Top = 6
        Width = 132
        Height = 25
        DataSource = FSTEPrincipal.DSPedidos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
      end
      object btVisualizar: TBitBtn
        Left = 284
        Top = 6
        Width = 125
        Height = 43
        Anchors = [akTop, akRight]
        Caption = '&Visualizar'
        Glyph.Data = {
          76040000424D7604000000000000760000002800000040000000200000000100
          04000000000000040000130B0000130B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333003333333333333333333333333333FF77FF333333333333
          3333333333333333003333333333333333333333333333FF77FF333333333333
          33333333333333000000333333333333333333333333FF777777333333333333
          33333333333333000000333333333333333333333333FF777777333333333333
          333333333333000000333333333333333333333333FF77777733333333333333
          333333333333000000333333333333333333333333FF77777733333333333333
          3333333333000000333333333333333333333333FF7777773333333333333333
          3333333333000000333333333333333333333333FF7777773333333333333333
          333333330000003333333333333333FFFFFF33FF777777333333333333333333
          333333330000003333333333333333FFFFFF33FF777777333333333333770000
          007733BB770033333333333333FF777777338877777733333333333333770000
          007733BB770033333333333333FF777777338877777733333333333300777777
          77770000BB333333333333337777333333777777773333333333333300777777
          77770000BB333333333333337777333333777777773333333333330077FF88FF
          88FF77003333333333333377FF33333333333377883333333333330077FF88FF
          88FF77003333333333333377FF333333333333778833333333337777FF88FFFF
          FF88FF77773333333333337733333333333333773388333333337777FF88FFFF
          FF88FF7777333333333333773333333333333377338833333333007788FFFFFF
          FFFF887700333333333377FF333333333333333377FF33333333007788FFFFFF
          FFFF887700333333333377FF333333333333333377FF333333330077FFFFFFFF
          FFFFFF770033333333337788333333333333333377FF333333330077FFFFFFFF
          FFFFFF770033333333337788333333333333333377FF33333333007788FFFFFF
          FFFF887700333333333377338833333333333333773333333333007788FFFFFF
          FFFF8877003333333333773388333333333333337733333333337777FF88FFFF
          FF88FF7777333333333333778833333333333377FF33333333337777FF88FFFF
          FF88FF7777333333333333778833333333333377FF3333333333330077FF88FF
          88FF77003333333333333377338888333333FF77333333333333330077FF88FF
          88FF77003333333333333377338888333333FF77333333333333333300777777
          77770033333333333333333377773388FF777733333333333333333300777777
          77770033333333333333333377773388FF777733333333333333333333770000
          0077333333333333333333333333777777333333333333333333333333770000
          0077333333333333333333333333777777333333333333333333}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btVisualizarClick
        ExplicitLeft = 148
      end
      object btImprimir: TBitBtn
        Left = 415
        Top = 6
        Width = 125
        Height = 43
        Anchors = [akTop, akRight]
        Caption = '&Imprimir'
        Glyph.Data = {
          F6060000424DF606000000000000360000002800000018000000180000000100
          180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697BDBBBC
          9D9A9A898687FF00FFFF00FF979596C6C6C6D0CFCFAFACAC989596FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF999697B7
          B5B6F0EFEFF4F3F3AAA7A79D9A9A4241424644456E6C6D999797BCBBBBDAD9D9
          E0E0E0C9C7C7A3A0A1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9896
          97A9A5A6E3E2E2FFFEFEFCFBFBEFEEEEA7A5A59E9C9C3332341212131C1C1D2A
          2A2C4745476D6A6C9A9898C5C4C4E2E1E1D4D3D3959192FF00FFFF00FFFF00FF
          FF00FF9A9899D8D5D5FCFBFBFBFAFAF8F7F7FBFAFAE7E5E6A3A0A0A3A0A0807F
          805453543332341E1E1F1616171A1A1C29292B454445736F70918F8FFF00FFFF
          00FFFF00FF8E8A8BC4C1C1F6F4F4FAF8F8F4F3F3F4F3F3E3E2E2B8B7B7989697
          8986878C8A8A9A9798A5A1A39F9D9D878686605F603D3C3D2222231415162B2A
          2C8A8788FF00FFFF00FFFF00FF8E8A8BEBEBEBF0F0F0EDEBEBD9D8D8B0ADAD96
          9293A6A4A4C7C6C6A4A1A1928F8F8B88898884868B8989969293A19F9EA19F9F
          918F906A696A5151528B8989FF00FFFF00FFFF00FF8E8A8BDEDDDDD0CFCFA7A5
          A5939091A7A5A5CAC9CAD5D7D5DCDADAE1E0E0CCCACABAB7B7A7A5A59A97988F
          8B8C8A8788898687918E8E9D9999A3A0A0918F8FFF00FFFF00FFFF00FF8E8A8B
          9E9C9D939191A9A7A7C7C7C7D1D3D3CECECEC9C9C9E6E5E5F6F4F4F3F3F3EDEB
          EBE0DEDECFCECEBFBDBDAFACACA19F9F9592928C8A8A8A8788868283FF00FFFF
          00FFFF00FF8E8A8BAAA7A9C9C7C7CFCFCFCBCBCBCACACAC6C6C6DADADAF4F3F3
          B5B2B4B6AAB4C4C1C2D8D7D7E1E1E1E2E2E2D9D9D9CECECEC1C0C0B4B2B2AAA7
          A7928F90FF00FFFF00FFFF00FF8E8A8BCACACACCCCCCCACACACACACAC7C7C7D7
          D7D7F4F3F3AFAAAC999E9866B06A9EA39D9995979C9A9AAAA9A9BBBABACCCBCB
          D1D1D1D1D1D1CFCFCF9A9999FF00FFFF00FFFF00FFFF00FFADABACD0D0D0CCCE
          CECECECEDEDEDEE3E2E2A4A1A1ABA9AAEEEEEDC7EDC9E5E9E5E0DDDEF8AF9AB0
          ADAF9F9D9D9591929A9798ABA9A9ABA9AAA39FA0FF00FFFF00FFFF00FFFF00FF
          FF00FFA19FA0BBBABACAC9C9B6B4B4999797BDBBBBF4F3F3F4F3F3F4EEF3EAE7
          E7E5E3E3E2E2E2E1E1E1D9D9D9CECECEBFBFBF9592938F8B8CFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8788A9A7A7D1D1D1BFBFBF989999
          BABABAD3D1D1DEDDDDE1E0E0DEDEDEDCDCDCDDDDDDD7D7D7B5B5B5A7A4A5FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9A9CF3F4F4F4
          F3F2D9D5D4AAA7A7A7A9A9B4B7B8C7CBCCC9CCCCCCCECECCCCCCB6B5B6989697
          A7A4A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFE9CECCFFE3D9FFDDCFFED5C7F8D3C6F3D1C6EDD1CAE6D4CFDED8D5D0
          D0D0B8B7B8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFDDB4B0FFE0D3FFD8C9FFCFC0FFC7B5FFC0AAFFBA
          A4FFB79FFCB099E5C5C1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEB5B0FFE5D8FFD8C9FFCFC0
          FFC9B7FEC1ADFEBBA5FFB49CF7A691FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6BFB8FF
          E5D8FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DEBA08FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFE1BDB8FFE2D5FFD8C9FFCFC0FFC9B7FEC1ADFEBBA5FFB59DF8AF9AFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFE1BDB8FFE0D3FFD8C9FFCFC0FFC9B7FEC1ADFFBB
          A5F8AF9AF8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFE0BAB5FFEDE2FFE0D3FFD8C9FFCFC0
          FEC9B7FEC2ADFFBDA6F8AF9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE1BDB8FFF0E5FF
          E5D8FFDECEFFD5C5FFCEBBFFC7B2EDAB9CF8AF9AFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCE9F
          9DE1BDB8E0B7B2E0B5ADE0B1A9E0ACA5E0AAA0DDA39AF8AF9AFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 2
        OnClick = btImprimirClick
        ExplicitLeft = 279
      end
      object btSair: TBitBtn
        Left = 692
        Top = 6
        Width = 125
        Height = 43
        Anchors = [akTop, akRight]
        Caption = '&Sair'
        Glyph.Data = {
          76040000424D7604000000000000760000002800000040000000200000000100
          04000000000000040000120B0000120B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000000000000033333333337777777777777777777777FF3333333300000000
          0000000000000033333333337777777777777777777777FF333333330011BBBB
          BBBBBBBBBBBB0033333333337777338833333333333377FF333333330011BBBB
          BBBBBBBBBBBB0033333333337777338833333333333377FF33333333001111BB
          BBBBBBBBBBBB00333333333377FF773388333333333377FF33333333001111BB
          BBBBBBBBBBBB00333333333377FF773388333333333377FF3333333300111111
          BBBBBBBBBBBB00333333333377FF337733883333333377FF3333333300111111
          BBBBBBBBBBBB00333333333377FF337733883333333377FF3333333300111111
          00BBBBBBBBBB00333333333377FF333377FF3333333377FF3333333300111111
          00BBBBBBBBBB00333333333377FF333377FF3333333377FF3333333300111111
          00BBBBBBBBBB00333333333377FF333377FF3333333377FF3333333300111111
          00BBBBBBBBBB00333333333377FF333377FF3333333377FF3333333300111111
          00BBBBBBBBBB00333333333377FF333377FF3333333377FF33FF333300111111
          00BBBBBBBBBB00333333333377FF333377FF3333333377FF33FF333300111111
          00BBBBBBBBBB00339933333377FF333377FF3333333377FFFF77333300111111
          00BBBBBBBBBB00339933333377FF333377FF3333333377FFFF77333300111111
          00BBBBBBBBBB00999933333377FF333377FF33FF333377887777333300111111
          00BBBBBBBBBB00999933333377FF333377FF33FF333377887777333300111111
          00BBBB99BBBB99999933333377FF333377FFFF77FF3388777733333300111111
          00BBBB99BBBB99999933333377FF333377FFFF77FF3388777733333300111111
          3300BB99BB9999993333333377FF333377773377FFFF77773333333300111111
          3300BB99BB9999993333333377FF333377773377FFFF77773333333300111111
          00BBBB99999999333333333377FF333377FF3377FF7777FF3333333300111111
          00BBBB99999999333333333377FF333377FF3377FF7777FF3333333300111111
          00BBBB99999900333333333377FF33FF77FF3377777777FF3333333300111111
          00BBBB99999900333333333377FF33FF77FF3377777777FF333333330011EE11
          00BBBB99999999993333333377FF77FF77FF337777777777333333330011EE11
          00BBBB99999999993333333377FF77FF77FF337777777777333333330011EEEE
          00BBBBBBBBBB00333333333377FF777777FFFFFFFFFF77FF333333330011EEEE
          00BBBBBBBBBB00333333333377FF777777FFFFFFFFFF77FF3333333300000000
          0000000000000033333333337777777777777777777777333333333300000000
          0000000000000033333333337777777777777777777777333333}
        NumGlyphs = 2
        TabOrder = 4
        OnClick = btSairClick
        ExplicitLeft = 556
      end
      object btFechamento: TBitBtn
        Left = 546
        Top = 6
        Width = 125
        Height = 43
        Anchors = [akTop, akRight]
        Caption = 'Impr &Fecham'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        TabOrder = 3
        OnClick = btFechamentoClick
        ExplicitLeft = 410
      end
    end
    object PanVisualiz: TPanel
      Left = 28
      Top = 68
      Width = 541
      Height = 221
      TabOrder = 2
      Visible = False
      OnExit = PanVisualizExit
      DesignSize = (
        541
        221)
      object REPedido: TRichEdit
        Left = 8
        Top = 8
        Width = 525
        Height = 174
        Anchors = [akLeft, akTop, akRight, akBottom]
        Color = clAliceblue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'REPedido'
          
            '123456789.123456789.123456789.123456789.123456789.123456789.1234' +
            '56789.'
          'abcdefghijklmnopqrstuvwxyz....'
          ''
          ''
          'Total do turno:'
          'Qtd de pedidos'
          'Produtos:'
          'Tele:'
          'Total:'
          ''
          'Meios de pagto:  0,1,3,4,17,99,xx'
          ''
          'Imprimir:  Rela'#231#227'o de pedidos com'
          '  VlrProd, VlrTele, VlrTotal, ')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object btFechaVis: TBitBtn
        Left = 428
        Top = 188
        Width = 103
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = '&Fechar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666FFFF6666666FF6619996666666996667888F66666688F666199966666
          99166667888F6666887F66661996666991666666788F666887F6666661996699
          166666666788FF887F666666619999916666666667888887F666666666199916
          666666666678887F6666666666999966666666666F8888F66666666669991996
          66666666F888788F66666666999161996666666F88876788F666666999166619
          966666F8887666788F6666999166666996666688876666678F66669916666661
          996666887666666788F66691666666661996668766666666788F666666666666
          6199666666666666678866666666666666666666666666666666}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btFechaVisClick
      end
    end
    object PanFechamento: TPanel
      Left = 1
      Top = 300
      Width = 827
      Height = 83
      Align = alBottom
      TabOrder = 3
      ExplicitWidth = 691
      object gbTotais: TGroupBox
        Left = 1
        Top = 1
        Width = 196
        Height = 81
        Align = alLeft
        Caption = 'Totais do turno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object LabTotProd: TLabel
          Left = 50
          Top = 20
          Width = 72
          Height = 16
          Caption = 'LabTotProd'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabTele: TLabel
          Left = 50
          Top = 40
          Width = 51
          Height = 16
          Caption = 'LabTele'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabTotGeral: TLabel
          Left = 50
          Top = 60
          Width = 76
          Height = 16
          Caption = 'LabTotGeral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 12
          Top = 20
          Width = 35
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 16
          Top = 40
          Width = 31
          Height = 16
          Alignment = taRightJustify
          Caption = 'Tele:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 13
          Top = 62
          Width = 34
          Height = 16
          Alignment = taRightJustify
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
      object gbMPagto: TGroupBox
        Left = 197
        Top = 1
        Width = 352
        Height = 81
        Align = alLeft
        Caption = 'Totais p/ meio de pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Label5: TLabel
          Left = 17
          Top = 20
          Width = 53
          Height = 16
          Caption = 'Dinheiro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 12
          Top = 40
          Width = 58
          Height = 16
          Caption = 'C.Cr'#233'dito:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 15
          Top = 60
          Width = 55
          Height = 16
          Caption = 'C.D'#233'bito:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 215
          Top = 20
          Width = 23
          Height = 16
          Caption = 'PIX:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 196
          Top = 40
          Width = 42
          Height = 16
          Caption = 'Outros:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabDinheiro: TLabel
          Left = 72
          Top = 20
          Width = 73
          Height = 16
          Caption = 'LabDinheiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabCCred: TLabel
          Left = 72
          Top = 40
          Width = 61
          Height = 16
          Caption = 'LabCCred'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabCDeb: TLabel
          Left = 72
          Top = 60
          Width = 58
          Height = 16
          Caption = 'LabCDeb'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabPIX: TLabel
          Left = 240
          Top = 20
          Width = 43
          Height = 16
          Caption = 'LabPIX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LabOutros: TLabel
          Left = 240
          Top = 40
          Width = 62
          Height = 16
          Caption = 'LabOutros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object PanTurnos: TPanel
    Left = 0
    Top = 0
    Width = 179
    Height = 441
    Align = alLeft
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 177
      Height = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'Turnos dispon'#237'veis'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      ExplicitWidth = 149
    end
    object GridTurnos: TDBGrid
      Left = 1
      Top = 21
      Width = 177
      Height = 362
      Align = alClient
      DataSource = DSTurnos
      DrawingStyle = gdsClassic
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'Data'
          Title.Alignment = taCenter
          Width = 82
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TxTurno'
          Title.Alignment = taCenter
          Title.Caption = 'Turno'
          Width = 58
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 1
      Top = 383
      Width = 177
      Height = 57
      Align = alBottom
      TabOrder = 1
      object LabTurnos: TLabel
        Left = 12
        Top = 36
        Width = 65
        Height = 16
        Caption = 'LabTurnos'
      end
      object NavTurnos: TDBNavigator
        Left = 12
        Top = 6
        Width = 132
        Height = 25
        DataSource = DSTurnos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 0
      end
      object edTurno: TDBEdit
        Left = 104
        Top = 29
        Width = 69
        Height = 21
        DataField = 'TxDtTurno'
        DataSource = DSTurnos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnChange = edTurnoChange
      end
    end
  end
  object Turnos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 92
    object TurnosData: TDateField
      FieldName = 'Data'
    end
    object TurnosTurno: TSmallintField
      FieldName = 'Turno'
    end
    object TurnosTxTurno: TStringField
      FieldName = 'TxTurno'
      Size = 5
    end
    object TurnosTxDtTurno: TStringField
      FieldName = 'TxDtTurno'
      Size = 7
    end
    object TurnosIdPedidos: TStringField
      FieldName = 'IdPedidos'
      Size = 120
    end
    object TurnosIdLanctos: TStringField
      FieldName = 'IdLanctos'
      Size = 120
    end
  end
  object DSTurnos: TDataSource
    DataSet = Turnos
    Left = 100
    Top = 92
  end
end
