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
    Top = 497
    Width = 1127
    Height = 153
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 216
      Height = 151
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object rb_internal: TRadioButton
        Left = 16
        Top = 92
        Width = 121
        Height = 25
        Caption = 'Internal'
        TabOrder = 0
      end
      object rb_server: TRadioButton
        Left = 16
        Top = 116
        Width = 121
        Height = 25
        Caption = 'Server'
        TabOrder = 1
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 1127
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 7
      Top = 14
      Width = 20
      Height = 13
      Caption = 'Port'
    end
    object bt_runServer: TButton
      Left = 78
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Run server'
      TabOrder = 0
      OnClick = bt_runServerClick
    end
    object bt_port: TEdit
      Left = 32
      Top = 11
      Width = 38
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '8080'
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 1127
    Height = 456
    Align = alTop
    TabOrder = 2
    object me_log: TMemo
      Left = 7
      Top = 6
      Width = 586
      Height = 435
      Lines.Strings = (
        '')
      TabOrder = 0
    end
  end
end
