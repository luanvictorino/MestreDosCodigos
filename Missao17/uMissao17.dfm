object fMissao17: TfMissao17
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Miss'#227'o 17'
  ClientHeight = 357
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbInformeValor: TLabel
    Left = 7
    Top = 13
    Width = 86
    Height = 13
    Caption = 'Informe um valor:'
  end
  object edtValor: TEdit
    Left = 99
    Top = 10
    Width = 219
    Height = 21
    TabOrder = 0
    OnKeyPress = edtValorKeyPress
  end
  object btConsultar: TButton
    Left = 324
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 1
    OnClick = btConsultarClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 773
    Height = 310
    DataSource = dsMissao17
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object RESTClient: TRESTClient
    BaseURL = 'https://api.github.com/'
    Params = <>
    Left = 449
    Top = 8
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <
      item
        Kind = pkURLSEGMENT
        Name = 'busca'
        Options = [poAutoCreated]
      end
      item
        Name = 'id'
        Options = [poAutoCreated]
      end>
    Resource = 'search/repositories?q={busca}'
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 529
    Top = 8
  end
  object RESTResponse: TRESTResponse
    Left = 614
    Top = 8
  end
  object dsMissao17: TDataSource
    DataSet = cdsMissao17
    Left = 521
    Top = 72
  end
  object cdsMissao17: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 616
    Top = 72
  end
end
