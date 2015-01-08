inherited frmProductionScheduling1: TfrmProductionScheduling1
  Left = 203
  Top = 135
  Height = 513
  Caption = 'frmProductionScheduling1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlTop: TPanel
    inherited CoolBar1: TCoolBar
      inherited ToolBar1: TToolBar
        inherited DBNavigator1: TDBNavigator
          Hints.Strings = ()
        end
      end
    end
  end
  inherited pnlBottom: TPanel
    Top = 321
    Height = 158
    object gboxModelPriority: TGroupBox
      Left = 8
      Top = 0
      Width = 273
      Height = 155
      Caption = 'Model Priority'
      TabOrder = 0
      object LboxModel: TListBox
        Left = 8
        Top = 16
        Width = 169
        Height = 135
        DragCursor = crVSplit
        DragMode = dmAutomatic
        ItemHeight = 13
        TabOrder = 0
        OnDragDrop = LboxModelDragDrop
        OnDragOver = LboxModelDragOver
      end
      object BtnModelUp: TButton
        Left = 185
        Top = 22
        Width = 75
        Height = 25
        Caption = 'Up'
        TabOrder = 1
        OnClick = BtnModelUpClick
      end
      object BtnModelDown: TButton
        Left = 185
        Top = 72
        Width = 75
        Height = 25
        Caption = 'Down'
        TabOrder = 2
        OnClick = BtnModelDownClick
      end
      object btnSchedulePriority: TButton
        Left = 185
        Top = 118
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 3
        OnClick = btnSchedulePriorityClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 288
      Top = 0
      Width = 241
      Height = 89
      Caption = 'Upload To Production Line'
      TabOrder = 1
      object pbarUpload: TProgressBar
        Left = 8
        Top = 32
        Width = 225
        Height = 17
        TabOrder = 0
      end
      object btnUpload: TButton
        Left = 70
        Top = 56
        Width = 75
        Height = 25
        Caption = 'Upload'
        TabOrder = 1
        OnClick = btnUploadClick
      end
    end
  end
  inherited pnlBody: TPanel
    Height = 296
    inherited PageControl1: TPageControl
      Height = 296
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          Top = 35
          Height = 230
          inherited PreviewBox1: TPreviewBox
            Top = 139
          end
          inherited gridData: TDBGridEh
            Height = 83
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ProductionScheduleID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 37
              end
              item
                EditButtons = <>
                FieldName = 'SchedulePriority'
                Footers = <>
                Title.Caption = 'Schedule Priority'
              end
              item
                EditButtons = <>
                FieldName = 'Line'
                Footers = <>
                Width = 50
              end
              item
                EditButtons = <>
                FieldName = 'Model'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'ScheduleQuantity'
                Footers = <>
                Title.Caption = 'Schedule Qty.'
                Width = 54
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'RTD'
                Footers = <>
                Width = 100
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ScheduleStartTime'
                Footers = <>
                Title.Caption = 'Schedule Start Time'
                Width = 100
              end
              item
                DisplayFormat = 'YYYY-mm-dd'
                EditButtons = <>
                FieldName = 'ScheduleEndTime'
                Footers = <>
                Title.Caption = 'Schedule End Time'
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'PlantCode'
                Footers = <>
                Title.Caption = 'Plant Code'
                Width = 60
              end>
          end
        end
        object pnlQuery: TPanel
          Left = 0
          Top = 0
          Width = 675
          Height = 35
          Align = alTop
          TabOrder = 1
          object Label1: TLabel
            Left = 7
            Top = 11
            Width = 20
            Height = 13
            Caption = 'Line'
          end
          object Label2: TLabel
            Left = 162
            Top = 11
            Width = 71
            Height = 13
            Caption = 'Schedule Date'
          end
          object dtpScheduleDate: TDateTimePicker
            Left = 239
            Top = 6
            Width = 114
            Height = 23
            Date = 38777.000000000000000000
            Time = 38777.000000000000000000
            TabOrder = 0
          end
          object dbcbbLine: TDBLookupComboboxEh
            Left = 33
            Top = 7
            Width = 113
            Height = 21
            EditButtons = <>
            KeyField = 'AssemblyLineID'
            ListField = 'Line'
            ListSource = ds_line
            TabOrder = 1
            Visible = True
          end
          object btnQuery: TButton
            Left = 576
            Top = 5
            Width = 75
            Height = 25
            Caption = 'Query'
            TabOrder = 2
            OnClick = btnQueryClick
          end
        end
      end
    end
  end
  inherited ds_active: TDataSource
    Left = 106
    Top = 65535
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
  inherited adt_active: TADODataSet
    Top = 65535
    object adt_activeProductionScheduleID: TAutoIncField
      FieldName = 'ProductionScheduleID'
      ReadOnly = True
    end
    object adt_activeAssemblyLineID: TIntegerField
      FieldName = 'AssemblyLineID'
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activePlantID: TIntegerField
      FieldName = 'PlantID'
    end
    object adt_activeScheduleQuantity: TIntegerField
      FieldName = 'ScheduleQuantity'
    end
    object adt_activeRTD: TDateTimeField
      FieldName = 'RTD'
    end
    object adt_activeScheduleStartTime: TDateTimeField
      FieldName = 'ScheduleStartTime'
    end
    object adt_activeScheduleEndTime: TDateTimeField
      FieldName = 'ScheduleEndTime'
      ReadOnly = True
    end
    object adt_activeLine: TStringField
      FieldName = 'Line'
      Size = 6
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activePlantCode: TStringField
      FieldName = 'PlantCode'
      Size = 15
    end
    object adt_activeSchedulePriority: TIntegerField
      FieldName = 'SchedulePriority'
    end
  end
  object adt_line: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from AssemblyLine'
    Parameters = <>
    Left = 162
    Top = 65535
  end
  object adt_model: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 'select * from Model'
    Parameters = <>
    Left = 226
    Top = 65535
  end
  object ds_line: TDataSource
    DataSet = adt_line
    Left = 193
    Top = 65535
  end
end
