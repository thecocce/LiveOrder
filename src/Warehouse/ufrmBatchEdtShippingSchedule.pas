unit ufrmBatchEdtShippingSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, StdCtrls, DBCtrlsEh, Mask, ComCtrls, ADODB,
  uDMEntity, UDMManager, StrUtils;

type
  TfrmBatchEdtShippingSchedule = class(TfrmBasic)
    gboxLogisticOut: TGroupBox;
    chkForwarderPickupDateAct: TCheckBox;
    chkDeliveryETDEst: TCheckBox;
    chkDeliveryOnboardAct: TCheckBox;
    chkDeliveryETAAct: TCheckBox;
    chkDeliveryPlanToWHDate: TCheckBox;
    chkExportSheetNo: TCheckBox;
    chkLogisticRemark: TCheckBox;
    chkWarehouseRemark: TCheckBox;
    chkPackingList: TCheckBox;
    chkIncoterms: TCheckBox;
    btnSave: TButton;
    dtpForwarderPickupDateAct: TDateTimePicker;
    dtpDeliveryETDEst: TDateTimePicker;
    dtpDeliveryOnboardAct: TDateTimePicker;
    dtpDeliveryETAAct: TDateTimePicker;
    dtpDeliveryPlanToWHDate: TDateTimePicker;
    edtSheetNumber: TEdit;
    edtLogisticRemark: TEdit;
    edtWarehouseRemark: TEdit;
    cbbPackingList: TComboBox;
    cbbIncoterms: TComboBox;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    COID: WideString;
    slParam: TStringList;
    objMgrSS: TMgrShippingSchedule;
  protected
    procedure InitializeForm; override;
    procedure DestoryForm; override;
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
  public
    { Public declarations }
    class procedure EdtFromList(SelectCOID: string);
  end;

implementation

{$R *.dfm}

{ TfrmBatchEdtShippingSchedule }

procedure TfrmBatchEdtShippingSchedule.InitializeForm;
begin
  inherited;
  slParam := TStringList.Create;
  objMgrSS := TMgrShippingSchedule.Create;
end;

procedure TfrmBatchEdtShippingSchedule.DestoryForm;
begin
  inherited;
  slParam.Free;
  objMgrSS.Free;
end;

procedure TfrmBatchEdtShippingSchedule.SetData;
begin
  inherited;

end;

procedure TfrmBatchEdtShippingSchedule.SetUI;
begin
  inherited;
  dtpForwarderPickupDateAct.DateTime := now;
  dtpDeliveryPlanToWHDate.DateTime := now;
  dtpDeliveryETDEst.DateTime := now;
  dtpDeliveryOnboardAct.DateTime := now;
  dtpDeliveryETAAct.DateTime := now;
end;

procedure TfrmBatchEdtShippingSchedule.SetAccess;
begin
  inherited;

end;

class procedure TfrmBatchEdtShippingSchedule.EdtFromList(SelectCOID: string);
begin
  with TfrmBatchEdtShippingSchedule.Create(Application) do
  try
    COID := SelectCOID;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmBatchEdtShippingSchedule.btnSaveClick(Sender: TObject);
begin
  inherited;
  slParam.Clear;
  if chkForwarderPickupDateAct.Checked then
    slParam.Append('ForwarderPickupDateAct=' + FormatDateTime('YYYY-mm-dd', dtpForwarderPickupDateAct.DateTime));
  if chkDeliveryPlanToWHDate.Checked then
    slParam.Append('DeliveryPlanToWarehouseDate=' + FormatDateTime('YYYY-mm-dd', dtpDeliveryPlanToWHDate.DateTime));
  if chkDeliveryETDEst.Checked then
    slParam.Append('DeliveryETDEst=' + FormatDateTime('YYYY-mm-dd', dtpDeliveryETDEst.DateTime));
  if chkDeliveryOnboardAct.Checked then
    slParam.Append('DeliveryOnboardAct=' + FormatDateTime('YYYY-mm-dd', dtpDeliveryOnboardAct.DateTime));
  if chkDeliveryETAAct.Checked then
    slParam.Append('DeliveryETAAct=' + FormatDateTime('YYYY-mm-dd', dtpDeliveryETAAct.DateTime));
  if chkExportSheetNo.Checked then
    slParam.Append('LogisticExportSheetNo=' + Trim(edtSheetNumber.Text));
  if chkLogisticRemark.Checked then
    slParam.Append('LogisticRemark=' + Trim(edtLogisticRemark.Text));
  if chkWarehouseRemark.Checked then
    slParam.Append('WarehouseRemark=' + Trim(edtWarehouseRemark.Text));
  if chkPackingList.Checked then
    slParam.Append('PackingList=' + Trim(cbbPackingList.Text));
    //ShowMessage(ifthen(VarIsNull(Trim(cbbIncoterms.Text)), '', Trim(cbbIncoterms.Text)));
  if chkIncoterms.Checked then
  begin
    slParam.Append('Incoterms=' + Trim(cbbIncoterms.Text));
  end;
  if slParam.Count <> 0 then
  begin
    slParam.Append('BatchCustomerOrderID=' + COID);
    slParam.Append('Col=BatchCustomerOrderID');
    objMgrSS.UpdateShippingSchedule(slParam);
  end;
  close;
end;

end.

