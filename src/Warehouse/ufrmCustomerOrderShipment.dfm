inherited frmCustomerOrderShipment: TfrmCustomerOrderShipment
  Width = 845
  Caption = 'frmCustomerOrderShipment'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBottom: TPanel
    Width = 829
  end
  inherited pnlBody: TPanel
    Width = 829
    inherited PageControl1: TPageControl
      Width = 829
      ActivePage = TabSheet1
      OnEnter = PageControl1Enter
      inherited tbsBody1: TTabSheet
        Caption = 'Summary'
        inherited GroupBox1: TGroupBox
          Width = 821
          inherited PreviewSetupPanel: TPanel
            Width = 817
          end
          inherited PreviewBox1: TPreviewBox
            Width = 817
          end
          inherited gridData: TDBGridEh
            Width = 817
            OnEnter = gridDataEnter
            Columns = <
              item
                EditButtons = <>
                FieldName = 'CustomerOrderNumber'
                Footers = <>
                Title.Caption = 'Customer Order Number'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'ETD'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ATD'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerName'
                Footers = <>
                Title.Caption = 'Customer Name'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'CustomerOrderQuantity'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Customer Order Qty.'
                Width = 56
              end
              item
                EditButtons = <>
                FieldName = 'qty'
                Footer.ValueType = fvtSum
                Footers = <>
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'RemainQty'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = 'Remain Qty.'
              end>
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Detail'
        ImageIndex = 1
        object gridDetail: TDBGridEh
          Left = 0
          Top = 0
          Width = 821
          Height = 345
          Align = alClient
          DataSource = ds_ct
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clYellow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          RowHeight = 2
          RowLines = 1
          ShowHint = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          VertScrollBar.Tracking = True
          OnColWidthsChanged = gridDataColWidthsChanged
          OnEnter = gridDetailEnter
          OnGetCellParams = gridDataGetCellParams
          OnGetFooterParams = gridDataGetFooterParams
          OnKeyDown = gridDataKeyDown
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'UnScanned'
        ImageIndex = 2
        object gridUnScan: TDBGridEh
          Left = 0
          Top = 0
          Width = 821
          Height = 345
          Align = alClient
          DataSource = ds1
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clYellow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = [fsBold]
          FooterRowCount = 1
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          RowHeight = 2
          RowLines = 1
          ShowHint = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          VertScrollBar.Tracking = True
          OnColWidthsChanged = gridDataColWidthsChanged
          OnGetCellParams = gridDataGetCellParams
          OnGetFooterParams = gridDataGetFooterParams
          OnKeyDown = gridDataKeyDown
        end
      end
    end
  end
  inherited PnlTop: TPanel
    Width = 829
    inherited CoolBar1: TCoolBar
      Width = 829
      Bands = <
        item
          Control = ToolBar1
          ImageIndex = -1
          Width = 829
        end>
      inherited ToolBar1: TToolBar
        Width = 816
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewCustomerOrder_Shipment_Sum'
  end
  inherited PrintDBGridEh1: TPrintDBGridEh
    BeforeGridText_Data = {
      7B5C727466315C616E73695C64656666305C6465666C616E67313033337B5C66
      6F6E7474626C7B5C66305C66737769737320417269616C3B7D7B5C66315C6673
      77697373204D532053616E732053657269663B7D7D0D0A5C766965776B696E64
      345C7563315C706172645C71635C625C66305C66733238205269636820746578
      74206265666F726520677269642E5C6C616E67313034395C62305C6673313620
      0D0A5C706172205C70617264200D0A5C706172205C625C667331382054507269
      6E74444247726964456820636F6D706F6E656E7420616C6C6F777320796F7520
      746F206472617720726963682074657874206265666F726520677269642E0D0A
      5C706172205C62305C66733136200D0A5C706172205C756C5C625C695C667331
      3820557365204265666F726547726964546578742070726F706572747920746F
      207479706520746578742E0D0A5C706172205C756C6E6F6E655C62305C69305C
      66315C66733136200D0A5C706172207D0D0A00}
    AfterGridText_Data = {
      7B5C727466315C616E73695C64656666305C6465666C616E67313033337B5C66
      6F6E7474626C7B5C66305C66737769737320417269616C3B7D7B5C66315C6673
      77697373204D532053616E732053657269663B7D7D0D0A5C766965776B696E64
      345C7563315C706172645C625C66305C66733230200D0A5C7061722052696368
      207465787420616674657220677269640D0A5C706172205C6C616E6731303439
      5C62305C66733136200D0A5C706172205C6220255B546F6461795D5C7461625C
      7461625C7461625C7461625C7461625C7461625C7461625C7461622044617461
      2066726F6D20444244454D4F532064617461626173655C62305C6631200D0A5C
      706172207D0D0A00}
  end
  object adt_ct: TADODataSet
    Connection = DM.ADOConnection1
    AfterPost = adt_activeAfterPost
    AfterDelete = adt_activeAfterDelete
    OnDeleteError = adt_activeDeleteError
    OnEditError = adt_activeEditError
    OnPostError = adt_activePostError
    CommandText = 'select * from ViewCustomerOrder_Shipment'
    Parameters = <>
    Left = 162
    Top = 10
  end
  object ds_ct: TDataSource
    DataSet = adt_ct
    Left = 202
    Top = 11
  end
  object adt1: TADODataSet
    AfterPost = adt_activeAfterPost
    AfterDelete = adt_activeAfterDelete
    OnDeleteError = adt_activeDeleteError
    OnEditError = adt_activeEditError
    OnPostError = adt_activePostError
    Parameters = <>
    Left = 282
    Top = 10
  end
  object ds1: TDataSource
    DataSet = adt1
    Left = 322
    Top = 11
  end
end
