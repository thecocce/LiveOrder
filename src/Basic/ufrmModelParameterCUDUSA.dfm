inherited frmModelParameterCUDUSA: TfrmModelParameterCUDUSA
  Left = 228
  Top = 214
  Caption = 'frmModelParameterCUDUSA'
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
  inherited pnlBody: TPanel
    inherited PageControl1: TPageControl
      inherited tbsBody1: TTabSheet
        inherited GroupBox1: TGroupBox
          inherited gridData: TDBGridEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ModelParameterCUDUSAID'
                Footers = <>
                Title.Caption = 'ID'
                Width = 38
              end
              item
                EditButtons = <>
                FieldName = 'Model2'
                Footers = <>
                Title.Caption = 'Model'
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeightUnit'
                Footers = <>
                Width = 97
              end
              item
                EditButtons = <>
                FieldName = 'ProductWeight'
                Footers = <>
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'ProductGrossWeight'
                Footers = <>
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'ProductSizeUnit'
                Footers = <>
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'ProductSize'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Application'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'Refrigant'
                Footers = <>
              end
              item
                EditButtons = <>
                FieldName = 'CrankcaseHeaterPower'
                Footers = <>
                Width = 117
              end
              item
                EditButtons = <>
                FieldName = 'DesignPressureHigh'
                Footers = <>
                Width = 131
              end
              item
                EditButtons = <>
                FieldName = 'DesignPressureLow'
                Footers = <>
                Width = 119
              end
              item
                EditButtons = <>
                FieldName = 'CompressorVoltage'
                Footers = <>
                Width = 117
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorPH'
                Footers = <>
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorHZ'
                Footers = <>
                Width = 108
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorRLA'
                Footers = <>
                Width = 118
              end
              item
                EditButtons = <>
                FieldName = 'CompressorMotorLRA'
                Footers = <>
                Width = 92
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanQty'
                Footers = <>
                Width = 116
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanVoltage'
                Footers = <>
                Width = 122
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanPH'
                Footers = <>
                Width = 101
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanHZ'
                Footers = <>
                Width = 107
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanFLA'
                Footers = <>
                Width = 98
              end
              item
                EditButtons = <>
                FieldName = 'CondenserFanWattb'
                Footers = <>
                Width = 103
              end
              item
                EditButtons = <>
                FieldName = 'UnitPowerSupplyVoltage'
                Footers = <>
                Width = 129
              end
              item
                EditButtons = <>
                FieldName = 'UnitPowerSupplyPH'
                Footers = <>
                Width = 107
              end
              item
                EditButtons = <>
                FieldName = 'UnitPowerSupplyHZ'
                Footers = <>
                Width = 123
              end
              item
                EditButtons = <>
                FieldName = 'MinCircuitAmpacity'
                Footers = <>
                Width = 105
              end
              item
                EditButtons = <>
                FieldName = 'AmpsMaxBranchCircuitFuse'
                Footers = <>
                Width = 93
              end>
          end
        end
      end
    end
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
    CommandText = 
      'select d.* from ModelParameterCUDUSA d'#13#10'      left outer join Mo' +
      'del m on d.ModelID=m.ModelID'
    object adt_activeModelParameterCUDUSAID: TAutoIncField
      FieldName = 'ModelParameterCUDUSAID'
      ReadOnly = True
    end
    object adt_activeModelID: TIntegerField
      FieldName = 'ModelID'
    end
    object adt_activeProductWeightUnit: TStringField
      FieldName = 'ProductWeightUnit'
      Size = 5
    end
    object adt_activeProductWeight: TFloatField
      FieldName = 'ProductWeight'
    end
    object adt_activeProductGrossWeight: TFloatField
      FieldName = 'ProductGrossWeight'
    end
    object adt_activeProductSizeUnit: TStringField
      FieldName = 'ProductSizeUnit'
      Size = 5
    end
    object adt_activeProductSize: TStringField
      FieldName = 'ProductSize'
    end
    object adt_activeApplication: TStringField
      FieldName = 'Application'
    end
    object adt_activeRefrigant: TStringField
      DisplayWidth = 30
      FieldName = 'Refrigant'
      Size = 30
    end
    object adt_activeCrankcaseHeaterPower: TStringField
      FieldName = 'CrankcaseHeaterPower'
      Size = 10
    end
    object adt_activeDesignPressureHigh: TStringField
      FieldName = 'DesignPressureHigh'
      Size = 10
    end
    object adt_activeDesignPressureLow: TStringField
      FieldName = 'DesignPressureLow'
      Size = 10
    end
    object adt_activeCompressorVoltage: TStringField
      FieldName = 'CompressorVoltage'
      Size = 10
    end
    object adt_activeCompressorMotorPH: TStringField
      FieldName = 'CompressorMotorPH'
      Size = 10
    end
    object adt_activeCompressorMotorHZ: TStringField
      FieldName = 'CompressorMotorHZ'
      Size = 10
    end
    object adt_activeCompressorMotorRLA: TStringField
      FieldName = 'CompressorMotorRLA'
      Size = 10
    end
    object adt_activeCompressorMotorLRA: TStringField
      FieldName = 'CompressorMotorLRA'
      Size = 10
    end
    object adt_activeCondenserFanQty: TStringField
      FieldName = 'CondenserFanQty'
      Size = 10
    end
    object adt_activeCondenserFanVoltage: TStringField
      FieldName = 'CondenserFanVoltage'
      Size = 10
    end
    object adt_activeCondenserFanPH: TStringField
      FieldName = 'CondenserFanPH'
      Size = 10
    end
    object adt_activeCondenserFanHZ: TStringField
      FieldName = 'CondenserFanHZ'
      Size = 10
    end
    object adt_activeCondenserFanFLA: TStringField
      FieldName = 'CondenserFanFLA'
      Size = 10
    end
    object adt_activeCondenserFanWattb: TStringField
      FieldName = 'CondenserFanWattb'
      Size = 10
    end
    object adt_activeUnitPowerSupplyVoltage: TStringField
      FieldName = 'UnitPowerSupplyVoltage'
      Size = 10
    end
    object adt_activeUnitPowerSupplyPH: TStringField
      FieldName = 'UnitPowerSupplyPH'
      Size = 10
    end
    object adt_activeUnitPowerSupplyHZ: TStringField
      FieldName = 'UnitPowerSupplyHZ'
      Size = 10
    end
    object adt_activeMinCircuitAmpacity: TStringField
      FieldName = 'MinCircuitAmpacity'
      Size = 10
    end
    object adt_activeAmpsMaxBranchCircuitFuse: TStringField
      FieldName = 'AmpsMaxBranchCircuitFuse'
      Size = 10
    end
    object adt_activeModel: TStringField
      FieldName = 'Model'
      Size = 25
    end
    object adt_activeModel2: TStringField
      FieldKind = fkLookup
      FieldName = 'Model2'
      LookupDataSet = adt_model
      LookupKeyFields = 'modelid'
      LookupResultField = 'model'
      KeyFields = 'ModelID'
      Size = 30
      Lookup = True
    end
  end
  object adt_model: TADODataSet
    Connection = DM.ADOConnection1
    CommandText = 
      'select model,modelid from Model'#13#10'where (lower(substring(model,1,' +
      '3))='#39'zx0'#39#13#10'or lower(substring(model,1,3))='#39'zxl'#39#13#10'or lower(substr' +
      'ing(model,1,2))='#39'gp'#39#13#10'or lower(substring(model,1,4))='#39'xjam'#39#13#10'or ' +
      'lower(substring(model,1,4))='#39'xjal'#39')'
    Parameters = <>
    Left = 177
    Top = 8
  end
end
