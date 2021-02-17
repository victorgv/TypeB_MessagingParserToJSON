object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 771
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 771
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object me_message: TMemo
      Left = 0
      Top = 37
      Width = 380
      Height = 734
      Margins.Top = 43
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'QD MADAABB'
        '.UTCKM1P BB/290855 6A95A8JC'
        'COR'
        'MVT'
        'CC4567/29.DATUK.DUS'
        'AD0833/0844 EA1307 ACE'
        'DL16/05/0013/0021'
        'PX180'
        'EDL23/0009'
        'DLA//23B'
        'SI 16/SLOW BOARDING D/T COVID 19 REGULATIONS')
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = 8
      ExplicitTop = 43
      ExplicitWidth = 329
      ExplicitHeight = 646
    end
    object Button1: TButton
      Left = 380
      Top = 37
      Width = 97
      Height = 734
      Align = alRight
      Caption = 'Create JSON -->'
      ImageIndex = 0
      TabOrder = 1
      OnClick = Button1Click
      ExplicitHeight = 100
    end
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 477
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitWidth = 472
      object ComboBox1: TComboBox
        Left = 0
        Top = 9
        Width = 281
        Height = 21
        TabOrder = 0
        Text = 'MVT/AD'
        OnChange = ComboBox1Change
        Items.Strings = (
          'MVT/AD'
          'MVT/AA'
          'MVT/ED')
      end
    end
  end
  object Panel2: TPanel
    Left = 477
    Top = 0
    Width = 424
    Height = 771
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 504
    ExplicitTop = 312
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 424
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 320
      ExplicitTop = 656
      ExplicitWidth = 185
    end
    object me_json_result: TMemo
      Left = 0
      Top = 41
      Width = 424
      Height = 730
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      ExplicitLeft = 6
      ExplicitTop = 43
    end
  end
end
