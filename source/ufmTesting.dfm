object fmTesting: TfmTesting
  Left = 0
  Top = 0
  Caption = 'TypeB_Messaging_To_JSON ***TEST MODULE***'
  ClientHeight = 706
  ClientWidth = 1098
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
    Width = 1098
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -35
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 609
      Height = 82
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 132
        Top = 36
        Width = 20
        Height = 13
        Caption = 'Port'
      end
      object Label6: TLabel
        Left = 133
        Top = 60
        Width = 19
        Height = 13
        Caption = 'URL'
      end
      object rb_internal: TRadioButton
        Left = 11
        Top = 31
        Width = 121
        Height = 25
        Caption = 'Internal Server'
        TabOrder = 0
        OnClick = RB_DLLClick
      end
      object rb_server: TRadioButton
        Left = 11
        Top = 55
        Width = 121
        Height = 25
        Caption = 'External Server'
        TabOrder = 1
        OnClick = RB_DLLClick
      end
      object ed_port: TEdit
        Left = 157
        Top = 33
        Width = 38
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        Text = '8080'
      end
      object bt_runServer: TButton
        Left = 200
        Top = 31
        Width = 75
        Height = 25
        Caption = 'Run server'
        TabOrder = 3
        OnClick = bt_runServerClick
      end
      object RB_DLL: TRadioButton
        Left = 11
        Top = 7
        Width = 182
        Height = 25
        Caption = 'No Server (directly DLL)'
        TabOrder = 4
        OnClick = RB_DLLClick
      end
      object ed_url: TEdit
        Left = 157
        Top = 57
        Width = 292
        Height = 21
        NumbersOnly = True
        TabOrder = 5
        Text = 'http://192.168.1.123:8080/api/message_processor'
      end
      object bt_show_dll_info: TButton
        Left = 156
        Top = 6
        Width = 118
        Height = 25
        Caption = 'Show DLL info'
        TabOrder = 6
        OnClick = bt_show_dll_infoClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 82
    Width = 1098
    Height = 609
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 1
    ExplicitTop = 0
    ExplicitWidth = 1127
    object TabSheet1: TTabSheet
      Caption = 'Development Unit Test'
      ExplicitWidth = 1119
      ExplicitHeight = 165
      object Label2: TLabel
        Left = 7
        Top = 32
        Width = 29
        Height = 13
        Caption = 'Token'
      end
      object Label3: TLabel
        Left = 7
        Top = 5
        Width = 35
        Height = 13
        Caption = 'Version'
      end
      object Label4: TLabel
        Left = 7
        Top = 56
        Width = 42
        Height = 13
        Caption = 'Message'
      end
      object bt_process_message: TSpeedButton
        Left = 400
        Top = 152
        Width = 121
        Height = 177
        Caption = '>> Process >>'
        OnClick = bt_process_messageClick
      end
      object Label5: TLabel
        Left = 540
        Top = 37
        Width = 59
        Height = 13
        Caption = 'Result JSON'
      end
      object me_message: TMemo
        Left = 52
        Top = 56
        Width = 333
        Height = 505
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'QD AAABBCC'
          '.XXXYYZZ 111301'
          'MVT'
          'PPP0999/09.ECEXX.PMI'
          'AD1000/1005 EA 1109MAD'
          'PX111')
        ParentFont = False
        TabOrder = 0
      end
      object ed_token: TEdit
        Left = 52
        Top = 29
        Width = 249
        Height = 21
        MaxLength = 30
        TabOrder = 1
        Text = 's782hs8282j3u378dh27ghs27'
      end
      object ed_version: TComboBox
        Left = 52
        Top = 2
        Width = 57
        Height = 21
        TabOrder = 2
        Text = '0'
        Items.Strings = (
          '0')
      end
      object me_json_result: TMemo
        Left = 540
        Top = 56
        Width = 517
        Height = 505
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'QD AAABBCC'
          '.XXXYYZZ 111301'
          'MVT'
          'PPP0999/09.ECEXX.PMI'
          'AD1000/1005 EA 1109MAD'
          'PX111')
        ParentFont = False
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Server Test / Run All Tests'
      ImageIndex = 1
      ExplicitWidth = 1119
      ExplicitHeight = 165
      object Panel4: TPanel
        Left = 0
        Top = 41
        Width = 1090
        Height = 456
        Align = alTop
        TabOrder = 0
        ExplicitTop = -291
        ExplicitWidth = 1119
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
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1090
        Height = 41
        Align = alTop
        TabOrder = 1
        ExplicitLeft = -3
        ExplicitTop = -24
        ExplicitWidth = 1119
      end
    end
  end
end
