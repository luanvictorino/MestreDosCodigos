object fMissao16: TfMissao16
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Miss'#227'o 16'
  ClientHeight = 407
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbPropriedades: TLabel
    Left = 11
    Top = 33
    Width = 63
    Height = 13
    Caption = 'Propriedades'
  end
  object lbMetodos: TLabel
    Left = 239
    Top = 33
    Width = 41
    Height = 13
    Caption = 'M'#233'todos'
  end
  object lbClasse: TLabel
    Left = 11
    Top = 8
    Width = 46
    Height = 16
    Caption = 'Classe: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbNomeClasse: TLabel
    Left = 60
    Top = 8
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object mmPropriedades: TMemo
    Left = 8
    Top = 49
    Width = 220
    Height = 348
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object mmMetodos: TMemo
    Left = 236
    Top = 49
    Width = 220
    Height = 348
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
