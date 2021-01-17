object fmTesting: TfmTesting
  Left = 0
  Top = 0
  Caption = 'TypeB_Messaging_To_JSON ***TEST MODULE***'
  ClientHeight = 706
  ClientWidth = 1127
  Color = clBtnFace
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1127
    Height = 113
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 216
      Height = 111
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object rb_internal: TRadioButton
        Left = 8
        Top = 44
        Width = 121
        Height = 25
        Caption = 'Internal'
        TabOrder = 0
        OnClick = rb_internalClick
      end
      object rb_server: TRadioButton
        Left = 8
        Top = 68
        Width = 121
        Height = 25
        Caption = 'Server'
        TabOrder = 1
      end
    end
  end
end
