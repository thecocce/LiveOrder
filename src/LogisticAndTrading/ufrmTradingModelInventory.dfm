inherited frmTradingModelInventory: TfrmTradingModelInventory
  Caption = 'frmTradingModelInventory'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ModelDescription'
                Footers = <>
                Title.Caption = 'Model Description'
              end
              item
                EditButtons = <>
                FieldName = 'ModelChineseDescription'
                Footers = <>
                Title.Caption = 'Model Chinese Description'
                Width = 113
              end
              item
                EditButtons = <>
                FieldName = 'IsBonded'
                Footers = <>
                Title.Caption = 'Is Bonded'
              end
              item
                EditButtons = <>
                FieldName = 'TotalQuantity'
                Footers = <>
                Title.Caption = 'Total Quantity'
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'FrozenQuantity'
                Footers = <>
                Title.Caption = 'Frozen Quantity'
                Width = 86
              end
              item
                EditButtons = <>
                FieldName = 'AvailableQuantity'
                Footers = <>
                Title.Caption = 'Available Quantity'
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'AssignedQuantity'
                Footers = <>
                Title.Caption = 'Assigned Quantity'
                Width = 95
              end
              item
                EditButtons = <>
                FieldName = 'UpdateTime'
                Footers = <>
                Title.Caption = 'Update Time'
                Width = 87
              end>
          end
        end
      end
    end
  end
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        ButtonWidth = 91
        inherited ToolButton2: TToolButton
          Left = 91
        end
        inherited DBNavigator1: TDBNavigator
          Left = 99
          Hints.Strings = ()
        end
        inherited ToolButton3: TToolButton
          Left = 329
        end
        inherited tbtnFilter: TToolButton
          Left = 337
        end
        object ToolButton1: TToolButton
          Left = 428
          Top = 0
          Caption = 'Get Inventory'
          ImageIndex = 18
          OnClick = ToolButton1Click
        end
        object tbtnRefresh: TToolButton
          Left = 519
          Top = 0
          Caption = 'Refresh'
          ImageIndex = 19
          OnClick = tbtnRefreshClick
        end
      end
    end
  end
  inherited adt_active: TADODataSet
    CommandText = 'select * from ViewTradingModelInventory'
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
end
