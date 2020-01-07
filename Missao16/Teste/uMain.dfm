object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Mission 16'
  ClientHeight = 449
  ClientWidth = 633
  Color = clBtnFace
  Constraints.MaxHeight = 488
  Constraints.MaxWidth = 649
  Constraints.MinHeight = 488
  Constraints.MinWidth = 649
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbMethods: TLabel
    Left = 8
    Top = 8
    Width = 41
    Height = 13
    Caption = 'Methods'
  end
  object lbProperties: TLabel
    Left = 319
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Properties'
  end
  object mmMethods: TMemo
    Left = 8
    Top = 27
    Width = 305
    Height = 412
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object mmProperties: TMemo
    Left = 319
    Top = 27
    Width = 305
    Height = 412
    ScrollBars = ssVertical
    TabOrder = 1
  end
end
