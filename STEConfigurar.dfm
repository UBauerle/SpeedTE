object FSTEConfigurar: TFSTEConfigurar
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do sistema'
  ClientHeight = 473
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 16
  object pgControle: TPageControl
    Left = 0
    Top = 0
    Width = 873
    Height = 417
    ActivePage = TSConfiguracao
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 357
    object TSUsuario: TTabSheet
      Caption = 'Usu'#225'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      object PanUsuario: TPanel
        Left = 0
        Top = 0
        Width = 865
        Height = 382
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 322
        object Label1: TLabel
          Left = 24
          Top = 20
          Width = 101
          Height = 16
          Alignment = taRightJustify
          Caption = 'Nome/Rz.Social:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 52
          Top = 50
          Width = 73
          Height = 16
          Alignment = taRightJustify
          Caption = 'Logradouro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label3: TLabel
          Left = 100
          Top = 80
          Width = 25
          Height = 16
          Alignment = taRightJustify
          Caption = 'Nro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 38
          Top = 110
          Width = 87
          Height = 16
          Alignment = taRightJustify
          Caption = 'Complemento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 75
          Top = 140
          Width = 47
          Height = 16
          Alignment = taRightJustify
          Caption = 'Cidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 86
          Top = 170
          Width = 39
          Height = 16
          Alignment = taRightJustify
          Caption = 'Bairro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 104
          Top = 200
          Width = 21
          Height = 16
          Alignment = taRightJustify
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label8: TLabel
          Left = 91
          Top = 230
          Width = 34
          Height = 16
          Alignment = taRightJustify
          Caption = 'Fone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 59
          Top = 260
          Width = 66
          Height = 16
          Alignment = taRightJustify
          Caption = 'WhatsApp:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object edUsuario: TEdit
          Left = 128
          Top = 16
          Width = 260
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = 'edUsuario'
        end
        object edLograd: TEdit
          Left = 128
          Top = 46
          Width = 260
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'edLograd'
        end
        object edNro: TEdit
          Left = 128
          Top = 76
          Width = 60
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'edNro'
        end
        object edCompl: TEdit
          Left = 128
          Top = 106
          Width = 109
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = 'edCompl'
        end
        object edCidade: TEdit
          Left = 128
          Top = 136
          Width = 160
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = 'edCidade'
        end
        object edBairro: TEdit
          Left = 128
          Top = 166
          Width = 130
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'edBairro'
        end
        object edUF: TEdit
          Left = 128
          Top = 196
          Width = 32
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = 'edUF'
        end
        object edFone: TEdit
          Left = 128
          Top = 226
          Width = 120
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = 'edFone'
        end
        object edWhats: TEdit
          Left = 128
          Top = 256
          Width = 121
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = 'edWhats'
        end
      end
    end
    object TSConfiguracao: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object PanConfig: TPanel
        Left = 0
        Top = 0
        Width = 865
        Height = 382
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 322
        object Label14: TLabel
          Left = 79
          Top = 49
          Width = 71
          Height = 16
          Alignment = taRightJustify
          Caption = 'Logo inicial:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label15: TLabel
          Left = 49
          Top = 80
          Width = 101
          Height = 16
          Alignment = taRightJustify
          Caption = 'Logo impress'#227'o:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label18: TLabel
          Left = 284
          Top = 202
          Width = 44
          Height = 16
          Alignment = taRightJustify
          Caption = 'Meses:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label17: TLabel
          Left = 376
          Top = 168
          Width = 86
          Height = 16
          Alignment = taRightJustify
          Caption = 'Pagto padr'#227'o:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label16: TLabel
          Left = 218
          Top = 168
          Width = 92
          Height = 16
          Alignment = taRightJustify
          Caption = 'Pixel horizontal:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label13: TLabel
          Left = 80
          Top = 168
          Width = 66
          Height = 16
          Alignment = taRightJustify
          Caption = 'In'#237'cio noite:'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label12: TLabel
          Left = 120
          Top = 20
          Width = 30
          Height = 16
          Caption = 'Path:'
        end
        object Label35: TLabel
          Left = 201
          Top = 232
          Width = 127
          Height = 16
          Alignment = taRightJustify
          Caption = 'Texto "Incluir Lancto":'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label40: TLabel
          Left = 30
          Top = 109
          Width = 120
          Height = 16
          Alignment = taRightJustify
          Caption = 'Img "CANCELADO":'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object Label41: TLabel
          Left = 55
          Top = 138
          Width = 95
          Height = 16
          Alignment = taRightJustify
          Caption = 'Img "NORMAL":'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object cbTelas: TCheckBox
          Left = 21
          Top = 20
          Width = 93
          Height = 17
          Caption = 'Salva telas'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 0
        end
        object edPathTelas: TEdit
          Left = 152
          Top = 16
          Width = 372
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = 'edPathTelas'
        end
        object edLogoIni: TEdit
          Left = 152
          Top = 46
          Width = 372
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'edLogoIni'
        end
        object edLogoPrint: TEdit
          Left = 152
          Top = 76
          Width = 372
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = 'edLogoPrint'
        end
        object cbMeses: TComboBox
          Left = 330
          Top = 198
          Width = 47
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          Text = 'cbMeses'
          Items.Strings = (
            '6'
            '12'
            '18'
            '24'
            '30'
            '36'
            '48'
            '240')
        end
        object cbConsPed: TCheckBox
          Left = 20
          Top = 202
          Width = 134
          Height = 17
          Caption = 'Consulta pedidos'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 9
        end
        object cbPgto: TComboBox
          Left = 464
          Top = 165
          Width = 125
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = 'cbPgto'
          Items.Strings = (
            'Dinheiro (1)'
            'C.Cr'#233'dito (3)'
            'C.D'#233'bito (4)'
            'Pix (17)'
            'Outro (99)')
        end
        object cbPixel: TComboBox
          Left = 312
          Top = 165
          Width = 47
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = 'cbPixel'
          Items.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            '10')
        end
        object cbIniNoite: TComboBox
          Left = 152
          Top = 165
          Width = 48
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = 'cbIniNoite'
          Items.Strings = (
            '15'
            '16'
            '17'
            '18'
            '19'
            '20'
            '21'
            '22')
        end
        object cbPrItem: TCheckBox
          Left = 21
          Top = 225
          Width = 100
          Height = 17
          Caption = 'Primeiro '#237'tem'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 10
        end
        object cbCPF: TCheckBox
          Left = 20
          Top = 248
          Width = 100
          Height = 17
          Caption = 'CPF / CNPJ'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 11
        end
        object cbEntrega: TCheckBox
          Left = 20
          Top = 272
          Width = 100
          Height = 17
          Caption = 'Entrega'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 12
        end
        object cbValida: TCheckBox
          Left = 20
          Top = 295
          Width = 116
          Height = 17
          Caption = 'Valida entrega'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 13
        end
        object gbCtle: TGroupBox
          Left = 12
          Top = 318
          Width = 501
          Height = 47
          Caption = 'Controle'
          TabOrder = 21
          OnMouseDown = gbCtleMouseDown
          object Label10: TLabel
            Left = 16
            Top = 24
            Width = 42
            Height = 16
            Caption = 'Chave:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Label11: TLabel
            Left = 103
            Top = 24
            Width = 31
            Height = 16
            Caption = 'Dias:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object edChave: TEdit
            Left = 60
            Top = 20
            Width = 33
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'edChave'
          end
          object cbDias: TComboBox
            Left = 136
            Top = 20
            Width = 48
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'cbDias'
            Items.Strings = (
              '15'
              '30')
          end
          object cbDesenv: TCheckBox
            Left = 200
            Top = 23
            Width = 77
            Height = 17
            Caption = 'Desenv'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
        end
        object edTxtIncluir: TEdit
          Left = 330
          Top = 228
          Width = 167
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
          Text = 'edTxtIncluir'
        end
        object cbLctSV: TCheckBox
          Left = 201
          Top = 272
          Width = 228
          Height = 17
          Caption = 'Aceita lancamento sem valor'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 16
        end
        object cbExCarga: TCheckBox
          Left = 201
          Top = 295
          Width = 225
          Height = 17
          Caption = 'Exibe carga Clientes e Produtos'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 17
        end
        object edImgCancel: TEdit
          Left = 152
          Top = 106
          Width = 372
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = 'edImgCancel'
        end
        object edImgNormal: TEdit
          Left = 152
          Top = 135
          Width = 372
          Height = 24
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'edImgNormal'
        end
        object cbSolCPF: TCheckBox
          Left = 449
          Top = 295
          Width = 160
          Height = 17
          Caption = 'Solicita CPF'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 18
        end
        object rgFinPed: TRadioGroup
          Left = 604
          Top = 16
          Width = 249
          Height = 72
          Caption = 'Ao finalizar pedido'
          Items.Strings = (
            'Retorna para tela inicial'
            'Abre novo pedido')
          TabOrder = 19
        end
        object rgExProd: TRadioGroup
          Left = 604
          Top = 94
          Width = 249
          Height = 115
          Caption = 'Expandir produtos quando'
          Items.Strings = (
            'Acessar o campo (onEnter)'
            'Uma tecla '#233' pressionada (onKeyDown)'
            'Click de mouse (onClick)'
            'N'#227'o utilizado')
          TabOrder = 20
        end
        object rgAtlzCliente: TRadioGroup
          Left = 604
          Top = 215
          Width = 249
          Height = 97
          Caption = 'Atualizar cliente com dados do pedido'
          Items.Strings = (
            'Nunca atualizar'
            'Sempre que houver diferen'#231'as'
            'Questionar qdo houver diferen'#231'as')
          TabOrder = 22
        end
      end
    end
    object TSPedido: TTabSheet
      Caption = 'Pedidos / Impress'#227'o'
      ImageIndex = 2
      object PanPedidos: TPanel
        Left = 0
        Top = 0
        Width = 865
        Height = 382
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 322
        object Label19: TLabel
          Left = 106
          Top = 16
          Width = 71
          Height = 16
          Caption = 'Impressora:'
        end
        object Label20: TLabel
          Left = 40
          Top = 46
          Width = 137
          Height = 16
          Caption = 'Tam m'#225'x p'#225'gina (mm):'
        end
        object Label21: TLabel
          Left = 18
          Top = 76
          Width = 159
          Height = 16
          Alignment = taRightJustify
          Caption = 'Margens (mm)    esquerda:'
        end
        object Label22: TLabel
          Left = 225
          Top = 76
          Width = 40
          Height = 16
          Caption = 'direita:'
        end
        object Label23: TLabel
          Left = 315
          Top = 76
          Width = 30
          Height = 16
          Caption = 'topo:'
        end
        object Label24: TLabel
          Left = 402
          Top = 76
          Width = 47
          Height = 16
          Caption = 'rodap'#233':'
        end
        object Label25: TLabel
          Left = 131
          Top = 106
          Width = 46
          Height = 16
          Caption = 'C'#243'pias:'
        end
        object Label26: TLabel
          Left = 69
          Top = 136
          Width = 108
          Height = 16
          Caption = 'Altura extra (pixel):'
        end
        object Label27: TLabel
          Left = 94
          Top = 196
          Width = 83
          Height = 16
          Caption = 'Nome interno:'
        end
        object Label28: TLabel
          Left = 88
          Top = 226
          Width = 89
          Height = 16
          Caption = 'C'#243'pias interno:'
        end
        object Label29: TLabel
          Left = 88
          Top = 256
          Width = 88
          Height = 16
          Caption = 'Intervalo (seg):'
        end
        object cbPrev: TCheckBox
          Left = 238
          Top = 106
          Width = 149
          Height = 17
          Caption = 'Preview impress'#227'o'
          TabOrder = 7
        end
        object cbDialog: TCheckBox
          Left = 405
          Top = 106
          Width = 139
          Height = 17
          Caption = 'Dialogo impress'#227'o'
          TabOrder = 8
        end
        object cbPrCons: TCheckBox
          Left = 238
          Top = 136
          Width = 203
          Height = 17
          Caption = 'Preview impress'#227'o consulta'
          TabOrder = 10
        end
        object cbIntern: TCheckBox
          Left = 182
          Top = 166
          Width = 174
          Height = 17
          Caption = 'Imprime pedido interno'
          TabOrder = 11
        end
        object edPrinter: TEdit
          Left = 182
          Top = 12
          Width = 329
          Height = 24
          TabOrder = 0
          Text = 'edPrinter'
        end
        object edTamMax: TEdit
          Left = 183
          Top = 42
          Width = 49
          Height = 24
          TabOrder = 1
          Text = 'edTamMax'
        end
        object edMEsq: TEdit
          Left = 182
          Top = 72
          Width = 33
          Height = 24
          TabOrder = 2
          Text = 'edMEsq'
        end
        object edMDir: TEdit
          Left = 270
          Top = 72
          Width = 28
          Height = 24
          TabOrder = 3
          Text = 'edMDir'
        end
        object edMTop: TEdit
          Left = 351
          Top = 72
          Width = 28
          Height = 24
          TabOrder = 4
          Text = 'edMTop'
        end
        object edMRod: TEdit
          Left = 454
          Top = 72
          Width = 28
          Height = 24
          TabOrder = 5
          Text = 'edMRod'
        end
        object edExtra: TEdit
          Left = 183
          Top = 132
          Width = 33
          Height = 24
          TabOrder = 9
          Text = 'edExtra'
        end
        object edCopias: TEdit
          Left = 182
          Top = 102
          Width = 32
          Height = 24
          TabOrder = 6
          Text = 'edCopias'
        end
        object edInterno: TEdit
          Left = 183
          Top = 192
          Width = 121
          Height = 24
          TabOrder = 12
          Text = 'edInterno'
        end
        object edCopIntern: TEdit
          Left = 183
          Top = 222
          Width = 33
          Height = 24
          TabOrder = 13
          Text = 'edCopIntern'
        end
        object edIntervalo: TEdit
          Left = 182
          Top = 252
          Width = 39
          Height = 24
          TabOrder = 14
          Text = 'edIntervalo'
        end
        object GroupBox1: TGroupBox
          Left = 351
          Top = 174
          Width = 502
          Height = 139
          Caption = 'Layout de impress'#227'o'
          TabOrder = 15
          object Label36: TLabel
            Left = 12
            Top = 20
            Width = 387
            Height = 16
            Caption = 'Posi'#231#227'o do nome do cliente e endere'#231'o  e altura de linha detalhe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsUnderline]
            ParentFont = False
          end
          object Label37: TLabel
            Left = 12
            Top = 48
            Width = 47
            Height = 16
            Alignment = taRightJustify
            Caption = 'Pedido:'
          end
          object Label38: TLabel
            Left = 16
            Top = 80
            Width = 43
            Height = 16
            Alignment = taRightJustify
            Caption = 'Interno:'
          end
          object Label39: TLabel
            Left = 12
            Top = 112
            Width = 119
            Height = 16
            Caption = 'Formato Data/Hora:'
          end
          object cbLOPedido: TComboBox
            Left = 65
            Top = 44
            Width = 145
            Height = 24
            TabOrder = 0
            Text = 'cbLOPedido'
            Items.Strings = (
              'Topo'
              'Rodape')
          end
          object cbLOInterno: TComboBox
            Left = 65
            Top = 76
            Width = 145
            Height = 24
            TabOrder = 3
            Text = 'cbLOInterno'
            Items.Strings = (
              'Topo'
              'Rodape')
          end
          object cbAltFixaPed: TCheckBox
            Left = 220
            Top = 48
            Width = 88
            Height = 17
            Caption = 'Altura fixa '
            TabOrder = 1
          end
          object cbAltFixaInt: TCheckBox
            Left = 220
            Top = 80
            Width = 88
            Height = 17
            Caption = 'Altura fixa '
            TabOrder = 4
          end
          object cbVlrUnit: TCheckBox
            Left = 314
            Top = 48
            Width = 159
            Height = 17
            Caption = 'Imprimir valor unit'#225'rio'
            TabOrder = 2
          end
          object cbDataHora: TComboBox
            Left = 137
            Top = 108
            Width = 164
            Height = 24
            TabOrder = 5
            Text = 'cbDataHora'
            Items.Strings = (
              'DD/MM/AAAA  HR:MI'
              'DD/MM/AA  HR:MI'
              '')
          end
          object cbImpTN: TCheckBox
            Left = 312
            Top = 112
            Width = 177
            Height = 17
            Caption = 'Imprime Turno && N'#250'mero'
            TabOrder = 6
          end
        end
      end
    end
    object TSDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 3
      object PanDados: TPanel
        Left = 0
        Top = 0
        Width = 865
        Height = 382
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 322
        object Label30: TLabel
          Left = 99
          Top = 24
          Width = 76
          Height = 16
          Alignment = taRightJustify
          Caption = 'Localiza'#231#227'o:'
        end
        object Label31: TLabel
          Left = 19
          Top = 54
          Width = 156
          Height = 16
          Alignment = taRightJustify
          Caption = 'Denomina'#231#227'o de clientes:'
        end
        object Label32: TLabel
          Left = 40
          Top = 84
          Width = 135
          Height = 16
          Alignment = taRightJustify
          Caption = 'Denomina'#231#227'o antigos:'
        end
        object Label33: TLabel
          Left = 12
          Top = 114
          Width = 163
          Height = 16
          Alignment = taRightJustify
          Caption = 'Denomina'#231#227'o de produtos:'
        end
        object Label34: TLabel
          Left = 45
          Top = 174
          Width = 130
          Height = 16
          Alignment = taRightJustify
          Caption = 'Ordem inicial clientes:'
        end
        object cbCarga: TCheckBox
          Left = 180
          Top = 147
          Width = 97
          Height = 17
          Caption = 'Carga XML'
          TabOrder = 4
        end
        object edPathDados: TEdit
          Left = 180
          Top = 20
          Width = 297
          Height = 24
          TabOrder = 0
          Text = 'edPathDados'
        end
        object edArqClie: TEdit
          Left = 180
          Top = 50
          Width = 153
          Height = 24
          TabOrder = 1
          Text = 'edArqClie'
        end
        object edArqOld: TEdit
          Left = 181
          Top = 80
          Width = 153
          Height = 24
          TabOrder = 2
          Text = 'edArqOld'
        end
        object edArqProd: TEdit
          Left = 181
          Top = 110
          Width = 153
          Height = 24
          TabOrder = 3
          Text = 'edArqProd'
        end
        object cbInic: TComboBox
          Left = 180
          Top = 170
          Width = 145
          Height = 24
          TabOrder = 5
          Text = 'cbInic'
          Items.Strings = (
            'Sequencial'
            'Telefone'
            'Nome'
            'Endere'#231'o'
            'Nome/Endere'#231'o'
            'Ultima compra')
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 417
    Width = 873
    Height = 56
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 357
    object btSalvar: TBitBtn
      Left = 192
      Top = 6
      Width = 132
      Height = 37
      Caption = '&Salvar'
      Glyph.Data = {
        76040000424D7604000000000000760000002800000040000000200000000100
        0400000000000004000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDFFFFDDDDDDDDDDDDDDDDDDDDDDDDDDD22
        22DDDDDDDDDDDDDDDDDDDDDDDDDDDD8888FDDDDDDDDDDDDDDDDDDDDDDDDDDD22
        222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDDD22
        222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDDD22
        222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDDDDDDDDDDDDDD222
        2222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDDDDDDDDDDD222
        2222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDDDDDDDDDDD222
        22222DDDDDDDDDDDDDDDDDDDDDDDD88888888FDDDDDDDDDDDDDDDDDDDDDD2222
        22222DDDDDDDDDDDDDDDDDDDDDDD888888888FDDDDDDDDDDDDDDDDDDDDDD2222
        D2222DDDDDDDDDDDDDDDDDDDDDDD8888F8888FDDDDDDDDDDDDDDDDDDDDDD2222
        DD2222DDDDDDDDDDDDDDDDDDDDDD8888FD8888FDDDDDDDDDDDDDDDDDDDD22222
        DD2222DDDDDDDDDDDDDDDDDDDDD88888DD8888FDDDDDDDDDDDDDDDDDDDD2222D
        DD22222DDDDDDDDDDDDDDDDDDDD8888DDD88888FDDDDDDDDDDDDDDDDDD22222D
        DDD22222DDDDDDDDDDDDDDDDDD88888DDDD88888FDDDDDDDDDDDDDDDDD2222DD
        DDD22222DDDDDDDDDDDDDDDDDD8888DDDDD88888FDDDDDDDDDDDDDDDD22222DD
        DDDD22222DDDDDDDDDDDDDDDD88888DDDDDD88888FDDDDDDDDDDDDDD22222DDD
        DDDDD22222DDDDDDDDDDDDDD88888DDDDDDDD88888FDDDDDDDDDDDD222222DDD
        DDDDD222222DDDDDDDDDDDD888888DDDDDDDD888888FDDDDDDDDD2222222DDDD
        DDDDDD222222DDDDDDDDD8888888DDDDDDDDDD888888FDDDDDDDDD22222DDDDD
        DDDDDDD222222DDDDDDDDD88888DDDDDDDDDDDD888888FDDDDDDDDD222DDDDDD
        DDDDDDDD222222DDDDDDDDD888DDDDDDDDDDDDDD888888FFDDDDDDDDDDDDDDDD
        DDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDDDD
        DDDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FFDDDDDDDDDDDDD
        DDDDDDDDDDD2222222DDDDDDDDDDDDDDDDDDDDDDDDD8888888FDDDDDDDDDDDDD
        DDDDDDDDDDDDD22222DDDDDDDDDDDDDDDDDDDDDDDDDDD88888FDDDDDDDDDDDDD
        DDDDDDDDDDDDDD2222DDDDDDDDDDDDDDDDDDDDDDDDDDDD8888FDDDDDDDDDDDDD
        DDDDDDDDDDDDDDD222DDDDDDDDDDDDDDDDDDDDDDDDDDDDD888DDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btSalvarClick
    end
    object btCancelar: TBitBtn
      Left = 412
      Top = 8
      Width = 132
      Height = 37
      Caption = '&Cancelar'
      Glyph.Data = {
        76040000424D7604000000000000760000002800000040000000200000000100
        0400000000000004000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666666666666666666666666666666666FFF6666666666666666666
        666666666699966666666666666666666666666666888F666666666666666666
        666666666999996666666666FFF6666666666666688888F66666666999666666
        66666669999999666666666888FF666666666668888888666666669999966666
        666666999999966666666688888F666666666688888886666666669999966666
        666699999999666666666688888F666666668888888866666666669999996666
        6669999999966666666666888888F66666688888888666666666666999999666
        66999999966666666666666888888F6666888888866666666666666699999966
        699999996666666666666666888888F668888888666666666666666669999996
        6999996666666666666666666888888FF8888866666666666666666666999999
        9999966666666666666666666688888888888666666666666666666666699999
        999966666666666666666666666888888888F666666666666666666666669999
        999966666666666666666666666688888888F666666666666666666666666999
        999966666666666666666666666668888888F666666666666666666666669999
        9999966666666666666666666666888888888F66666666666666666666669999
        99999966666666666666666666668888888888FF666666666666666666699999
        9999999966666666666666666668888888888888F66666666666666666699999
        69999999966666666666666666688888688888888F6666666666666666999996
        669999999966666666666666668888866688888888FF66666666666669999996
        66669999999966666666666668888886666688888888F6666666666669999966
        666666999999966666666666688888666666668888888FFF6666666669999966
        66666669999999966666666668888866666666688888888F6666666669999966
        66666666699999966666666668888866666666666888888F6666666666999666
        6666666666999996666666666688866666666666668888866666666666666666
        6666666666669966666666666666666666666666666688666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666}
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btCancelarClick
    end
  end
end
