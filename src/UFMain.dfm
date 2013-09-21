object FMain: TFMain
  Left = 0
  Top = 0
  Caption = #1056#1072#1079#1083#1086#1078#1077#1085#1080#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103' '#1085#1072' '#1073#1080#1085#1072#1088#1085#1099#1077' '#1087#1083#1086#1089#1082#1086#1089#1090#1080
  ClientHeight = 418
  ClientWidth = 1061
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object IOrigin: TImage
    Left = 8
    Top = 8
    Width = 344
    Height = 344
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP0: TImage
    Left = 358
    Top = 8
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP1: TImage
    Left = 533
    Top = 8
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP2: TImage
    Left = 708
    Top = 8
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP3: TImage
    Left = 883
    Top = 8
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP4: TImage
    Left = 358
    Top = 183
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP5: TImage
    Left = 533
    Top = 183
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP6: TImage
    Left = 708
    Top = 183
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object IBP7: TImage
    Left = 883
    Top = 183
    Width = 169
    Height = 169
    Center = True
    Proportional = True
    Stretch = True
    OnDblClick = IOriginDblClick
  end
  object BBitPlanes: TButton
    Left = 8
    Top = 358
    Width = 1045
    Height = 25
    Caption = 'BBitPlanes'
    TabOrder = 0
    OnClick = BBitPlanesClick
  end
  object BGrayBitPlanes: TButton
    Left = 8
    Top = 389
    Width = 1045
    Height = 25
    Caption = 'BGrayBitPlanes'
    TabOrder = 1
    OnClick = BGrayBitPlanesClick
  end
  object OPD: TOpenPictureDialog
    Filter = #1042#1089#1077' '#1087#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1084#1099#1077' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103'|*.jpg;*.jpeg;*.bmp'
    Left = 16
    Top = 16
  end
end
