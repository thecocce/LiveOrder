inherited frmBatchEdtLogisticIn: TfrmBatchEdtLogisticIn
  Left = 417
  Top = 284
  Width = 660
  Height = 423
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pageControl1: TPageControl
    Left = 8
    Top = 24
    Width = 625
    Height = 345
    ActivePage = tbsLogisticIn
    TabOrder = 0
    object tbsLogisticIn: TTabSheet
      Caption = 'Logistic In'
      object btnSave: TButton
        Left = 256
        Top = 281
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 0
        OnClick = btnSaveClick
      end
      object gbox3: TGroupBox
        Left = 8
        Top = 184
        Width = 601
        Height = 89
        Caption = 'Logistic In - 3'
        TabOrder = 1
        object chkDMMMonth: TCheckBox
          Left = 296
          Top = 34
          Width = 81
          Height = 17
          Caption = 'DMM Month'
          TabOrder = 0
        end
        object chkSalesMonth: TCheckBox
          Left = 8
          Top = 32
          Width = 81
          Height = 17
          Caption = 'Sales Month'
          TabOrder = 1
        end
        object dbedtDMMRemark: TDBEditEh
          Left = 104
          Top = 62
          Width = 425
          Height = 21
          EditButtons = <>
          TabOrder = 2
          Visible = True
        end
        object chkDMMRemark: TCheckBox
          Left = 8
          Top = 64
          Width = 90
          Height = 17
          Caption = 'DMM Remark'
          TabOrder = 3
        end
        object dbedtSalesMonth: TwwDBSpinEdit
          Left = 104
          Top = 32
          Width = 121
          Height = 21
          Increment = 1.000000000000000000
          MaxValue = 2101.000000000000000000
          MinValue = 1301.000000000000000000
          LimitEditRect = True
          TabOrder = 4
          UnboundDataType = wwDefault
        end
        object dbedtDMMMonth: TwwDBSpinEdit
          Left = 408
          Top = 32
          Width = 121
          Height = 21
          Increment = 1.000000000000000000
          MaxValue = 2101.000000000000000000
          MinValue = 1301.000000000000000000
          LimitEditRect = True
          TabOrder = 5
          UnboundDataType = wwDefault
        end
      end
      object gbox2: TGroupBox
        Left = 7
        Top = 125
        Width = 601
        Height = 49
        Caption = 'Logistic In - 2'
        TabOrder = 2
        object chkSortingDate: TCheckBox
          Left = 12
          Top = 22
          Width = 104
          Height = 17
          Caption = 'Sorting Date'
          TabOrder = 0
        end
        object dtpSortingDate: TDBDateTimeEditEh
          Left = 117
          Top = 20
          Width = 185
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 1
          Visible = True
        end
      end
      object gbox1: TGroupBox
        Left = 8
        Top = 12
        Width = 601
        Height = 110
        Caption = 'Logistic In - 1'
        TabOrder = 3
        object edtReceivingQty: TEdit
          Left = 117
          Top = 50
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edtSheetNumber: TEdit
          Left = 117
          Top = 81
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object chkImportSheetNo: TCheckBox
          Left = 11
          Top = 83
          Width = 97
          Height = 17
          Caption = 'Import Sheet No.'
          TabOrder = 2
        end
        object chkOriginPickupDate: TCheckBox
          Left = 244
          Top = 22
          Width = 158
          Height = 17
          Caption = 'Origin Pickup Date'
          TabOrder = 3
        end
        object chkArrWHDate: TCheckBox
          Left = 244
          Top = 53
          Width = 158
          Height = 17
          Caption = 'Act. Arrive Warehouse Date'
          TabOrder = 4
        end
        object chkLogisticInRCED: TCheckBox
          Left = 244
          Top = 85
          Width = 104
          Height = 17
          Caption = 'Logistic In RCED'
          TabOrder = 5
        end
        object chkReceivingQty: TCheckBox
          Left = 11
          Top = 53
          Width = 97
          Height = 17
          Caption = 'Receiving Qty.'
          TabOrder = 6
          OnClick = chkReceivingQtyClick
        end
        object chkPOReceivingQty: TCheckBox
          Left = 12
          Top = 24
          Width = 198
          Height = 17
          Caption = 'Use PO Qty. Update Receiving Qty.'
          TabOrder = 7
          OnClick = chkPOReceivingQtyClick
        end
        object dtpArrWHDate: TDBDateTimeEditEh
          Left = 401
          Top = 53
          Width = 185
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 8
          Visible = True
        end
        object dtpPickupDate: TDBDateTimeEditEh
          Left = 401
          Top = 21
          Width = 185
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 9
          Visible = True
        end
        object dtpLogisticInRCED: TDBDateTimeEditEh
          Left = 401
          Top = 83
          Width = 185
          Height = 21
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 10
          Visible = True
        end
      end
    end
    object tbsSellerInvoice: TTabSheet
      Caption = 'Seller Invoice'
      ImageIndex = 1
      object gbox4: TGroupBox
        Left = 8
        Top = 20
        Width = 601
        Height = 73
        Caption = 'Seller Invoice'
        TabOrder = 0
        object edtInvoiceNumber: TEdit
          Left = 136
          Top = 32
          Width = 129
          Height = 21
          TabOrder = 0
        end
        object chkInvoiceNum: TCheckBox
          Left = 6
          Top = 32
          Width = 126
          Height = 17
          Caption = 'Seller Invoice Number'
          TabOrder = 1
        end
        object chkSellerInvoiceDate: TCheckBox
          Left = 272
          Top = 32
          Width = 113
          Height = 17
          Caption = 'Seller Invoice Date'
          TabOrder = 2
        end
        object dtpInvoiceDate: TDateTimePicker
          Left = 400
          Top = 32
          Width = 186
          Height = 21
          Date = 41723.642970914350000000
          Time = 41723.642970914350000000
          TabOrder = 3
        end
      end
      object btnSaveSeller: TButton
        Left = 232
        Top = 136
        Width = 75
        Height = 25
        Caption = 'Save'
        TabOrder = 1
        OnClick = btnSaveSellerClick
      end
    end
  end
end
