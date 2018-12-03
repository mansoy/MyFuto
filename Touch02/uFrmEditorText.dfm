object FrmEditorText: TFrmEditorText
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #25551#36848#25991#23383#32534#36753#22120
  ClientHeight = 536
  ClientWidth = 930
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    930
    536)
  PixelsPerInch = 96
  TextHeight = 13
  object spFontColor: TShape
    Left = 487
    Top = 32
    Width = 102
    Height = 21
    OnMouseUp = spFontColorMouseUp
  end
  object spBackColor: TShape
    Left = 661
    Top = 32
    Width = 102
    Height = 21
    OnMouseUp = spFontColorMouseUp
  end
  object lblDescription: TLabel
    Left = 57
    Top = 345
    Width = 63
    Height = 13
    Caption = 'lblDescription'
    Transparent = False
  end
  object Label2: TLabel
    Left = 11
    Top = 36
    Width = 48
    Height = 13
    Caption = #23383#20307#21517#31216
  end
  object Label3: TLabel
    Left = 236
    Top = 36
    Width = 48
    Height = 13
    Caption = #23383#20307#22823#23567
  end
  object Label4: TLabel
    Left = 434
    Top = 36
    Width = 48
    Height = 13
    Caption = #23383#20307#39068#33394
  end
  object Label5: TLabel
    Left = 609
    Top = 36
    Width = 48
    Height = 13
    Caption = #32972#26223#39068#33394
  end
  object cmbFontName: TComboBox
    Left = 65
    Top = 32
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'cmbFontName'
    OnChange = cmbFontNameChange
  end
  object edtFontSize: TSpinEdit
    Left = 290
    Top = 32
    Width = 121
    Height = 22
    MaxValue = 200
    MinValue = 9
    TabOrder = 1
    Value = 0
    OnChange = cmbFontNameChange
  end
  object btnSave: TButton
    Left = 735
    Top = 482
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #20445' '#23384
    TabOrder = 2
    OnClick = btnSaveClick
    ExplicitLeft = 688
    ExplicitTop = 400
  end
  object Button2: TButton
    Left = 823
    Top = 482
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #21462' '#28040
    ModalResult = 2
    TabOrder = 3
    ExplicitLeft = 776
    ExplicitTop = 400
  end
  object memText: TMemo
    Left = 8
    Top = 90
    Width = 913
    Height = 231
    Anchors = [akLeft, akTop, akRight]
    Lines.Strings = (
      'memText')
    ScrollBars = ssBoth
    TabOrder = 4
    OnChange = cmbFontNameChange
  end
  object chkTransparentBackground: TCheckBox
    Left = 65
    Top = 62
    Width = 97
    Height = 17
    Caption = #20351#29992#36879#26126#32972#26223
    TabOrder = 5
    OnClick = cmbFontNameChange
  end
  object ColorDialog1: TColorDialog
    Options = [cdFullOpen]
    Left = 216
    Top = 106
  end
end
