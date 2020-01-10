object uForm: TuForm
  Left = 0
  Top = 0
  Caption = 'Miss'#227'o 17'
  ClientHeight = 393
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbInformarValor: TLabel
    Left = 8
    Top = 11
    Width = 86
    Height = 13
    Caption = 'Informe um valor:'
  end
  object mmResultado: TMemo
    Left = 8
    Top = 37
    Width = 733
    Height = 348
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 100
    Top = 8
    Width = 126
    Height = 21
    TabOrder = 0
    OnKeyPress = edtValorKeyPress
  end
  object btConsultar: TButton
    Left = 232
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btConsultarClick
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://api.github.com/'
    Params = <>
    Left = 376
    Top = 8
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'busca'
        Options = [poAutoCreated]
      end>
    Resource = 'search/repositories?q={busca}'
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 472
    Top = 8
  end
  object RESTResponse: TRESTResponse
    Left = 568
    Top = 8
  end
end
