inherited frmDBBasicTree: TfrmDBBasicTree
  Caption = 'frmDBBasicTree'
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 135
    Top = 25
    Height = 376
    Color = clActiveCaption
    ParentColor = False
  end
  inherited pnlBody: TPanel
    Left = 138
    Width = 542
    inherited PageControl1: TPageControl
      Width = 542
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Width = 534
          inherited gridData: TDBGridEh
            Width = 530
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  object pnlBodyLeft: TPanel [4]
    Left = 0
    Top = 25
    Width = 135
    Height = 376
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object TreeView1: TTreeView
      Left = 0
      Top = 32
      Width = 135
      Height = 344
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnChange = TreeView1Change
    end
    object pnlBodyLeftTop: TPanel
      Left = 0
      Top = 0
      Width = 135
      Height = 32
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 1
      object sbtnRefresh: TSpeedButton
        Left = 105
        Top = 6
        Width = 23
        Height = 22
        Caption = '...'
        OnClick = sbtnRefreshClick
      end
      object cbbTreeType: TComboBox
        Left = 6
        Top = 6
        Width = 95
        Height = 21
        BevelInner = bvLowered
        BevelKind = bkFlat
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbbTreeTypeChange
      end
    end
  end
  inherited ds_active: TDataSource
    Left = 186
    Top = 1
  end
  inherited PopupMenu1: TPopupMenu
    object N2: TMenuItem
      Caption = '-'
    end
  end
  inherited adt_active: TADODataSet
    Left = 146
    Top = 3
  end
end
