unit ufrmComponent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmComponent = class(TfrmDBBasicPrn)
    adt_activeComponentID: TAutoIncField;
    adt_activeComponentItem: TStringField;
    adt_activeComponentDescription: TStringField;
    adt_activeCalculatedPhysicalInventory: TFloatField;
    adt_activePhysicalInventoryCount: TFloatField;
    adt_activePhysicalInventoryDate: TDateTimeField;
    adt_activeStartPointConsumption: TFloatField;
    adt_activeStartPointConsumptionDate: TDateTimeField;
    adt_activeStartPointPurchaseOrders: TFloatField;
    adt_activeStartPointPurchaseOrdersDate: TDateTimeField;
    adt_activeCurrentInventoryCount: TFloatField;
    adt_activeCurrentInventoryDate: TDateTimeField;
    adt_activeLoginID: TIntegerField;
    adt_activeMinimumLevel: TFloatField;
    adt_activeMaximumLevel: TFloatField;
    adt_activePackageQuantity: TIntegerField;
    adt_activeManufacturingItemID: TIntegerField;
    adt_activeManufacturingItemDays: TIntegerField;
    adt_activeRequiredItemID: TIntegerField;
    adt_activeRequiredItemDays: TIntegerField;
    adt_activeLedgerID: TIntegerField;
    adt_activeWarehouseScheduledComponent: TBooleanField;
    adt_activeLeadTime: TIntegerField;
    adt_activeConsignment: TBooleanField;
    adt_activeStandardCost: TFloatField;
    adt_activeStandardCostDate: TDateTimeField;
    adt_activeFinanceInventoryCount: TFloatField;
    N2: TMenuItem;
    MenuReset: TMenuItem;
    adt_activePackageWeightUnit: TStringField;
    adt_activePackageWeight: TFloatField;
    adt_activePackageSizeUnit: TStringField;
    adt_activePackageSize: TFloatField;
    adt_activeComponentSeriesName: TStringField;
    btnUpdate: TButton;
    adt_ComponetSeries: TADODataSet;
    adt_ComponetSeriesComponentSeriesID: TAutoIncField;
    adt_ComponetSeriesComponentSeriesName: TStringField;
    adt_ComponetSeriesPlantID: TIntegerField;
    adt_ComponetSeriesPlantCode: TStringField;
    adt_activeComponentSeriesID: TIntegerField;
    adt_activeRemark: TStringField;
    adt_activeCreateTime: TDateTimeField;
    adt_activePlantID: TAutoIncField;
    adt_activePlantCode: TStringField;
    adt_activeComponentSeriesName2: TStringField;
    procedure adt_activeBeforePost(DataSet: TDataSet);
    procedure MenuResetClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
  end;


implementation

uses DataModule, uMJ, ufrmDBBasic;

{$R *.dfm}

{ TfrmComponent }

procedure TfrmComponent.SetData;
begin
  DM.DataSetQuery(adt_ComponetSeries, 'EXEC usp_GetComponentSeries');
  if gVars.CurUserLevel = 1 then
    DM.DataSetQuery(adt_active, 'EXEC usp_GetComponent')
  else
    DM.DataSetQuery(adt_active, 'EXEC usp_GetComponent @LoginID=' + IntToStr(objCurUser.LoginID));
end;

procedure TfrmComponent.SetUI;
begin
  inherited;
  gridData.FrozenCols := 3;
end;

procedure TfrmComponent.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    4:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbPost, nbCancel];
        gridData.ReadOnly := false;
        gridData.FieldColumns['ComponentItem'].ReadOnly := true;
        gridData.FieldColumns['ComponentDescription'].ReadOnly := true;
        gridData.FieldColumns['PhysicalInventoryDate'].ReadOnly := true;
        gridData.FieldColumns['CurrentInventoryCount'].ReadOnly := true;
        gridData.FieldColumns['CurrentInventoryDate'].ReadOnly := true;
        gridData.FieldColumns['StartPointConsumption'].ReadOnly := true;
        gridData.FieldColumns['StartPointConsumptionDate'].ReadOnly := true;
        gridData.FieldColumns['StartPointPurchaseOrders'].ReadOnly := true;
        gridData.FieldColumns['StartPointPurchaseOrdersDate'].ReadOnly := true;
        gridData.FieldColumns['ComponentSeriesName2'].ReadOnly := true;
      end;
    5: //warehouse
      begin
        MenuReset.Visible := false;
      end;
    22:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
  if objCurUser.LoginID = 77 then
  begin
    pnlBottom.Visible := true;
  end;
end;

procedure TfrmComponent.adt_activeBeforePost(DataSet: TDataSet);
begin
  try
    gridData.DataSource.DataSet.DisableControls;
    if not (adt_active.State in [dsEdit]) then
      adt_active.Edit;
    if (gridData.SelectedField.FieldName = 'PhysicalInventoryCount')
      and (gridData.SelectedField.OldValue <> gridData.SelectedField.Value) then
    begin
      adt_active.FieldByName('PhysicalInventoryDate').Value := now;
      adt_active.FieldByName('CurrentInventoryCount').Value := 0;
      adt_active.FieldByName('CurrentInventoryDate').Value := now;
      adt_active.FieldByName('StartPointConsumption').Value := 0;
      adt_active.FieldByName('StartPointConsumptionDate').Value := now;
      adt_active.FieldByName('StartPointPurchaseOrders').Value := 0;
      adt_active.FieldByName('StartPointPurchaseOrdersDate').Value := now;
    end;
    adt_active.FieldByName('CurrentInventoryCount').Value := adt_active.FieldByName('PhysicalInventoryCount').AsFloat
      + adt_active.FieldByName('StartPointPurchaseOrders').AsFloat
      - adt_active.FieldByName('StartPointConsumption').AsFloat;
    gridData.DataSource.DataSet.EnableControls;
  except
    exit;
  end;
end;

procedure TfrmComponent.MenuResetClick(Sender: TObject);
var
  i: integer;
begin
  if gridData.DataSource.DataSet.RecordCount = 0 then exit;
  gridData.DataSource.DataSet.DisableControls;
  for i := 0 to gridData.SelectedRows.Count - 1 do
  begin
    gridData.DataSource.DataSet.Bookmark := gridData.SelectedRows.items[I];
    if not (adt_active.State in [dsEdit]) then
      adt_active.Edit;
    adt_active.FieldByName('PhysicalInventoryDate').Value := now;
    adt_active.FieldByName('StartPointPurchaseOrdersDate').Value := now;
    adt_active.FieldByName('StartPointPurchaseOrders').Value := 0;
    adt_active.FieldByName('CurrentInventoryDate').Value := now;
    adt_active.FieldByName('CurrentInventoryCount').Value := 0;
    adt_active.FieldByName('StartPointConsumptionDate').Value := now;
    adt_active.FieldByName('StartPointConsumption').Value := 0;
    adt_active.Post;
    adt_active.UpdateBatch();
  end;
  gridData.DataSource.DataSet.EnableControls;
end;

procedure TfrmComponent.btnUpdateClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Is update?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.DataSetModify3('EXEC cs_usp_UpdatePhysicalInventory ');
  end;
end;

end.

