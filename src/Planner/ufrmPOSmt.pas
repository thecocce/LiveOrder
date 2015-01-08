unit ufrmPOSmt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmPOSmt = class(TfrmDBBasicPrn)
    adt_activePurchaseOrderID: TAutoIncField;
    adt_activePurchaseOrderNumber: TStringField;
    adt_activeVendorID: TIntegerField;
    adt_activeComponentID: TIntegerField;
    adt_activePurchaseOrderQuantity: TIntegerField;
    adt_activeRTA: TDateTimeField;
    adt_activeConfirmedPurchaseOrderQuantity: TIntegerField;
    adt_activeETA: TDateTimeField;
    adt_activeConfirmedPurchaseOrderComments: TStringField;
    adt_activeActualReceiptsQuantity: TIntegerField;
    adt_activeATA: TDateTimeField;
    adt_activePurchaseOrderStatesID: TIntegerField;
    adt_activeComponentItem: TStringField;
    adt_activePurchaseOrderStatesName: TStringField;
    adt_activeVendorNumber: TStringField;
    adt_activeVendorName: TStringField;
    adt_component: TADODataSet;
    adt_componentComponentID: TAutoIncField;
    adt_componentComponentItem: TStringField;
    adt_componentComponentDescription: TStringField;
    adt_componentCalculatedPhysicalInventory: TFloatField;
    adt_componentPhysicalInventoryCount: TFloatField;
    adt_componentPhysicalInventoryDate: TDateTimeField;
    adt_componentStartPointConsumption: TFloatField;
    adt_componentStartPointConsumptionDate: TDateTimeField;
    adt_componentStartPointPurchaseOrders: TFloatField;
    adt_componentStartPointPurchaseOrdersDate: TDateTimeField;
    adt_componentCurrentInventoryCount: TFloatField;
    adt_componentCurrentInventoryDate: TDateTimeField;
    adt_componentLoginID: TIntegerField;
    adt_componentMinimumLevel: TFloatField;
    adt_componentMaximumLevel: TFloatField;
    adt_componentPackageQuantity: TIntegerField;
    adt_componentManufacturingItemID: TIntegerField;
    adt_componentManufacturingItemDays: TIntegerField;
    adt_componentRequiredItemID: TIntegerField;
    adt_componentRequiredItemDays: TIntegerField;
    adt_componentLedgerID: TIntegerField;
    adt_componentWarehouseScheduledComponent: TBooleanField;
    adt_componentLeadTime: TIntegerField;
    adt_componentConsignment: TBooleanField;
    adt_componentStandardCost: TFloatField;
    adt_componentStandardCostDate: TDateTimeField;
    adt_componentFinanceInventoryCount: TFloatField;
    adt_activeComponentItem2: TStringField;
    adt_activeRTD: TDateTimeField;
    adt_activeETD: TDateTimeField;
    adt_activePOGenerateTime: TDateTimeField;
    procedure adt_activeBeforePost(DataSet: TDataSet);
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

uses DataModule, uMJ;

{$R *.dfm}

{ TfrmPOSmt }

procedure TfrmPOSmt.SetData;
begin
  DM.DataSetQuery(adt_component, 'EXEC usp_GetComponent @VendorID=17'
    + ',@ComponentID=''40,374,73,74,64''');
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPurchaseOrderJIT @PurchaseOrderStatesID=2,@IsSummit=1');
end;

procedure TfrmPOSmt.SetUI;
begin
  inherited;
end;

procedure TfrmPOSmt.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    4: //planner
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

procedure TfrmPOSmt.adt_activeBeforePost(DataSet: TDataSet);
begin
  inherited;
  try
    gridData.DataSource.DataSet.DisableControls;
    if not (gridData.DataSource.DataSet.State in [dsEdit]) then
      gridData.DataSource.DataSet.Edit;
    if (gridData.SelectedField.OldValue <> gridData.SelectedField.Value) then
    begin
      gridData.DataSource.DataSet.FieldByName('RTD').Value := gridData.DataSource.DataSet.FieldByName('RTA').AsDateTime - 1 / 24;
      gridData.DataSource.DataSet.FieldByName('VendorID').Value := 17;
      gridData.DataSource.DataSet.FieldByName('PurchaseOrderStatesID').Value := 2;
      gridData.DataSource.DataSet.FieldByName('POGenerateTime').Value := now;
    end;
    gridData.DataSource.DataSet.EnableControls;
  except
    exit;
  end;
end;

{
  sqlConst := ' and PurchaseOrderStatesID=2';
  sqlConst := sqlConst + ' and ComponentID in (''40'',''374'',''73'',''74'',''64'')';
  DM.DataSetQuery(adt_active, format(sQueryPurchaseOrderSQL, [sqlConst]));
  }

{
  sqlConst := ' and ComponentID in (''40'',''374'',''73'',''74'',''64'')';
  DM.DataSetQuery(adt_component, format(sQueryComponentAmteckSQL, [sqlConst]));
 }
end.
