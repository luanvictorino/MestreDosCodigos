object fMissao19: TfMissao19
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Miss'#227'o 19'
  ClientHeight = 504
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmXml: TMemo
    Left = 8
    Top = 40
    Width = 593
    Height = 455
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btCarregarXml: TButton
    Left = 232
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Carregar XML'
    TabOrder = 0
    OnClick = btCarregarXmlClick
  end
end
