object frmQuestionnaires: TfrmQuestionnaires
  Left = 0
  Top = 0
  Caption = 'Questionnaires  Sent'
  ClientHeight = 589
  ClientWidth = 881
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  DesignSize = (
    881
    589)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCount: TLabel
    Left = 8
    Top = 8
    Width = 123
    Height = 26
    Caption = 'Sent Today: 0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Palatino Linotype'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object lblThisMonth: TLabel
    Left = 168
    Top = 8
    Width = 159
    Height = 26
    Caption = 'Sent This Month: 0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Palatino Linotype'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object lblTotalSent: TLabel
    Left = 168
    Top = 49
    Width = 313
    Height = 23
    Caption = 'Total Sent Since Inception (10-02-2022): 0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 712
    Top = 44
    Width = 160
    Height = 16
    Caption = 'Number Format: 254xxxxxxxxx'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Sitka Text'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 96
    Width = 417
    Height = 485
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSource1
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Palatino Linotype'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
  end
  object txtSearch: TEdit
    Left = 712
    Top = 11
    Width = 161
    Height = 30
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    MaxLength = 15
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
    TextHint = 'Search Mobile No'
    OnChange = txtSearchChange
  end
  object DBGrid2: TDBGrid
    Left = 440
    Top = 96
    Width = 433
    Height = 485
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DataSource2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Palatino Linotype'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Palatino Linotype'
    TitleFont.Style = [fsBold]
    OnDrawColumnCell = DBGrid2DrawColumnCell
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.FDQueryMessages
    Left = 576
    Top = 208
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 752
    Top = 96
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.FDQuerySummary
    Left = 592
    Top = 384
  end
end
