unit ufrmPrtLabel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, ActnList, ImgList, ComCtrls, ToolWin, ExtCtrls, StdCtrls,
  uMJ, ADODB, DB, Mask, DBCtrlsEh, DBCtrls, DBGridEh, DBLookupEh, uDMEntity, uDMManager;

type
  TfrmPrtLabel = class(TfrmBasic)
    lblName: TLabel;
    PageControl1: TPageControl;
    tbsPrtCUDLabel: TTabSheet;
    gboxVol: TGroupBox;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    gboxPower: TGroupBox;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    gboxOthers: TGroupBox;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText13: TStaticText;
    BtnPrtCUDLabel: TButton;
    gboxPressure: TGroupBox;
    StaticText14: TStaticText;
    StaticText16: TStaticText;
    gboxCapacity: TGroupBox;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    tbsPrtCUDLabelUSA: TTabSheet;
    Panel1: TPanel;
    StaticText15: TStaticText;
    EdtPrtPort: TEdit;
    BtnPrtCUDUSALabel: TButton;
    Button1: TButton;
    gboxModel2: TGroupBox;
    Label7: TLabel;
    Label6: TLabel;
    gboxApp2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label11: TLabel;
    gboxDesPressure2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    gboxComp2: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    gboxCondenser2: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label1: TLabel;
    Label20: TLabel;
    gboxPower2: TGroupBox;
    Label32: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    gboxAmpa2: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    gboxOrder2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    edtProductQty2: TEdit;
    edtSupplierCode2: TEdit;
    edtCountry2: TEdit;
    Button3: TButton;
    Button4: TButton;
    Label26: TLabel;
    edtOriginalLeft: TEdit;
    Label31: TLabel;
    edtOriginalTop: TEdit;
    ds_active: TDataSource;
    adt_model: TADODataSet;
    ds_model: TDataSource;
    dbedtProductSN2: TDBEditEh;
    dbedtApplication2: TDBEditEh;
    dbedtRefigant2: TDBEditEh;
    dbedtPower2: TDBEditEh;
    dbedtHigh2: TDBEditEh;
    dbedtLow2: TDBEditEh;
    dbedtAmpacity2: TDBEditEh;
    dbedtFuse2: TDBEditEh;
    dbedtPowerVol2: TDBEditEh;
    dbedtPowerPH2: TDBEditEh;
    dbedtPowerHZ2: TDBEditEh;
    dbedtComVol2: TDBEditEh;
    dbedtCOmPH2: TDBEditEh;
    dbedtComHZ2: TDBEditEh;
    dbedtComRLA2: TDBEditEh;
    dbedtComLRA2: TDBEditEh;
    dbedtConQty2: TDBEditEh;
    dbedtConVol2: TDBEditEh;
    dbedtConPH2: TDBEditEh;
    dbedtConHZ2: TDBEditEh;
    dbedtConFLA2: TDBEditEh;
    dbedtConWattb2: TDBEditEh;
    dbedtCustomerPONum2: TDBEditEh;
    adt_paramUSA: TADODataSet;
    ds_paramUSA: TDataSource;
    dbcbbModel2: TDBLookupComboboxEh;
    adt_paramCUD: TADODataSet;
    ds_paramCUD: TDataSource;
    dbedtCapacity: TDBEditEh;
    dbedtCop: TDBEditEh;
    dbedtVoltage: TDBEditEh;
    dbedtPhase: TDBEditEh;
    dbedtFrequency: TDBEditEh;
    dbedtMaxInputPower: TDBEditEh;
    dbedtCompLRA: TDBEditEh;
    dbedtCompRLA: TDBEditEh;
    dbedtHighSide: TDBEditEh;
    dbedtLowSide: TDBEditEh;
    dbedtCompLubricant: TDBEditEh;
    dbedtWeight: TDBEditEh;
    dbedtStandApply: TDBEditEh;
    dbedtRefrigerant: TDBEditEh;
    gboxModel: TGroupBox;
    dbedtModel: TDBEditEh;
    dbedtProductSn: TDBEditEh;
    StaticText12: TStaticText;
    StaticText1: TStaticText;
    Button2: TButton;
    Memo2: TMemo;
    btnPrnEuroLabel: TButton;
    dbedtMaxOperatingCurrent: TDBEditEh;
    StaticText23: TStaticText;
    StaticText22: TStaticText;
    dbedtMaxWorkingPressure: TDBEditEh;
    StaticText24: TStaticText;
    dbedtApplication: TDBEditEh;
    dbedtPower: TDBEditEh;
    StaticText20: TStaticText;
    dbedtRatingCondition: TDBEditEh;
    StaticText21: TStaticText;
    StaticText19: TStaticText;
    dbedtEvaporatingTempRange: TDBEditEh;
    StaticText2: TStaticText;
    dbedtFan: TDBEditEh;
    StaticText25: TStaticText;
    dtpProDate: TDBDateTimeEditEh;
    Panel2: TPanel;
    DBNavigator1: TDBNavigator;
    procedure BtnPrtCUDLabelClick(Sender: TObject);
    procedure BtnPrtCUDUSALabelClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure adt_activeAfterScroll(DataSet: TDataSet);
    procedure btnPrnEuroLabelClick(Sender: TObject);
  private
    { Private declarations }
    function GetCUDLabelBarCodeString: string;
    function GetBarCodeStrAmericaLabel1: string;
    function GetBarCodeStrAmericaLabel2: string;
    function GetBarCodeStrEurope: string;
    procedure UpdateCUDParameterAsiaAndEuropeLog;
    procedure UpdateCUDParameterUSALog;
   // procedure ClearEditBox;
  protected
    procedure SetData; override;
    procedure SetUI; override;
  public
    { Public declarations }
    class procedure EdtFromList(adt_from: TADODataSet);
  end;


implementation

uses DataModule;

{$R *.dfm}

{ TfrmPrtLabel }

procedure TfrmPrtLabel.SetData;
begin
  DM.DataSetQuery(adt_model, 'Select * from Model');
end;

procedure TfrmPrtLabel.SetUI;
begin
  inherited;
  gboxModel.Enabled := false;
  gboxCapacity.Enabled := false;
  gboxVol.Enabled := false;
  gboxPower.Enabled := false;
  gboxPressure.Enabled := false;
  gboxOthers.Enabled := false;
  gboxModel2.Enabled := false;
  gboxComp2.Enabled := false;
  gboxCondenser2.Enabled := false;
  gboxApp2.Enabled := false;
  gboxDesPressure2.Enabled := false;
  gboxPower2.Enabled := false;
  gboxAmpa2.Enabled := false;
  gboxOrder2.Enabled := false;
end;

class procedure TfrmPrtLabel.EdtFromList(adt_from: TADODataSet);
var
  model: string;
  modelID: integer;
begin
  with TfrmPrtLabel.Create(Application) do
  try
    //ds_active.DataSet.AfterScroll := nil;
    ds_active.DataSet := adt_from;
    model := ds_active.DataSet.FieldByName('Model').AsString;
    modelID := ds_active.DataSet.FieldByName('ModelID').AsInteger;
    if (LowerCase(copy(model, 1, 4)) = 'xjam')
      or (LowerCase(copy(model, 1, 4)) = 'xjal') then //USA market
    begin
 //     tbsPrtCUDLabel.TabVisible := false;
//      tbsPrtCUDLabelUSA.TabVisible := true;
      edtOriginalLeft.Text := '155';
      edtOriginalTop.Text := '110';
      DM.DataSetQuery(adt_paramUSA, 'EXEC usp_GetModelParameterCUDUSA @ModelID=' + IntToStr(modelID));
    end
    else if not ds_active.DataSet.FieldByName('IsChn').AsBoolean then //Europe and asia market
    begin
   //   tbsPrtCUDLabel.TabVisible := true;
  //    tbsPrtCUDLabelUSA.TabVisible := false;
     //BtnPrtCUDLabel.Visible := false;
      edtOriginalLeft.Text := '90';
      edtOriginalTop.Text := '180';
      DM.DataSetQuery(adt_paramCUD, 'EXEC usp_GetModelParameterCUD @ModelID=' + IntToStr(modelID));
    end
    else //China market
    begin
  //    tbsPrtCUDLabel.TabVisible := true;
  //    tbsPrtCUDLabelUSA.TabVisible := false;
      //btnPrnEuroLabel.Visible := false;
      edtOriginalLeft.Text := '60';
      edtOriginalTop.Text := '195';
      DM.DataSetQuery(adt_paramCUD, 'EXEC usp_GetModelParameterCUD @ModelID=' + IntToStr(modelID));
    end;
    ds_active.DataSet.AfterScroll := adt_activeAfterScroll;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfrmPrtLabel.adt_activeAfterScroll(DataSet: TDataSet);
var
  model: string;
  modelID: integer;
begin
  model := ds_active.DataSet.FieldByName('Model').AsString;
  modelID := ds_active.DataSet.FieldByName('ModelID').AsInteger;
  if LowerCase(copy(model, 1, 4)) = 'xjam' then
  begin
//    tbsPrtCUDLabel.TabVisible := false;
//    tbsPrtCUDLabelUSA.TabVisible := true;
    DM.DataSetQuery(adt_paramUSA, 'EXEC usp_GetModelParameterCUDUSA @ModelID=' + IntToStr(modelID));
  end
  else
  begin
//    tbsPrtCUDLabel.TabVisible := true;
//    tbsPrtCUDLabelUSA.TabVisible := false;
    DM.DataSetQuery(adt_paramCUD, 'EXEC usp_GetModelParameterCUD @ModelID=' + IntToStr(modelID));
  end;
end;

procedure TfrmPrtLabel.BtnPrtCUDLabelClick(Sender: TObject);
var
  f: textfile;
  barStr: string;
  adt1: TADODataSet;
begin
  adt1 := TADODataSet.Create(nil);
  DM.DataSetQuery(adt1, 'EXEC usp_GetModelParameterCUD @ModelID=' + ds_active.DataSet.FieldByName('ModelID').AsString);
  if VarToStr(dbedtCompLubricant.Value) <> adt1.FieldByName('oil').AsString then
  begin
    ShowMessage('Oil is wrong.');
    exit;
  end
  else if VarToStr(dbedtRefrigerant.Value) <> ds_paramCUD.DataSet.FieldByName('Refrigerant').AsString then
  begin
    ShowMessage('Refrigerant is wrong.');
    exit;
  end;
  barStr := GetCUDLabelBarCodeString;
  assignfile(f, trim(EdtPrtPort.Text));
  rewrite(f);
  Write(f, chr(27) + '@');
  writeln(f, barStr);
  flush(f);
  closefile(f);
  UpdateCUDParameterAsiaAndEuropeLog;
 // ClearEditBox;

  adt1.Free;
  MessageDlg('Print Successfully!', mtInformation, [mbOk], 0);
end;

procedure TfrmPrtLabel.btnPrnEuroLabelClick(Sender: TObject);
var
  f: textfile;
  barStr: string;
  adt1: TADODataSet;
begin
  adt1 := TADODataSet.Create(nil);
  DM.DataSetQuery(adt1, 'EXEC usp_GetModelParameterCUD @ModelID=' + ds_active.DataSet.FieldByName('ModelID').AsString);
  if VarToStr(dbedtCompLubricant.Value) <> adt1.FieldByName('oil').AsString then
  begin
    ShowMessage('Oil is wrong.');
    exit;
  end
  else if VarToStr(dbedtRefrigerant.Value) <> ds_paramCUD.DataSet.FieldByName('Refrigerant').AsString then
  begin
    ShowMessage('Refrigerant is wrong.');
    exit;
  end;
  barStr := GetBarCodeStrEurope;
  assignfile(f, trim(EdtPrtPort.Text));
  rewrite(f);
  Write(f, chr(27) + '@');
  writeln(f, barStr);
  flush(f);
  closefile(f);
  UpdateCUDParameterAsiaAndEuropeLog;
 // ClearEditBox;

  MessageDlg('Print Successfully!', mtInformation, [mbOk], 0);
end;
{
procedure TfrmPrtLabel.ClearEditBox;
begin
  dbedtModel.Text := '';
  dbedtProductSn.Text := '';
  dbedtVoltage.Text := '';
  dbedtPhase.Text := '';
  dbedtFrequency.Text := '';
  dbedtFan.Text := '';
  dbedtEvaporatingTempRange.Text := '';
  dbedtCompLRA.Text := '';
  dbedtCompRLA.Text := '';
  dbedtCapacity.Text := '';
  dbedtPower.Text := '';
  dbedtCop.Text := '';
  dbedtRatingCondition.Text := '';
  dbedtLowSide.Text := '';
  dbedtHighSide.Text := '';
  dbedtCompLubricant.Text := '';
  dbedtRefrigerant.Text := '';
  dbedtWeight.Text := '';
  dbedtStandApply.Text := '';
  dbedtMaxOperatingCurrent.Text := '';
  dbedtApplication.Text := '';
end;
}

procedure TfrmPrtLabel.UpdateCUDParameterAsiaAndEuropeLog;
begin
  DM.DataSetModify('insert into PrintCUDParameterLog(ProductSerialNumber,'
    + 'Model,ProductDate,Voltage,Ph,Hz,Capacity,COP,L_R_A,R_L_A,high_pressure,low_pressure,'
    + 'oil,Refrigerant,Fan,EvaporatingTempRange,Power,RatingCondition,ProductWeight,update_by)'
    + ' values(''' + VarToStr(dbedtProductSn.Value) + ''','
    + '''' + VarToStr(dbedtModel.Value) + ''','
    + '''' + VarToStr(dtpProDate.Value) + ''','
    + '''' + VarToStr(dbedtVoltage.Value) + ''','
    + '''' + VarToStr(dbedtPhase.Value) + ''','
    + '''' + VarToStr(dbedtFrequency.Value) + ''','
    + '''' + VarToStr(dbedtCapacity.Value) + ''','
    + '''' + VarToStr(dbedtCop.Value) + ''','
    + '''' + VarToStr(dbedtCompLRA.Value) + ''','
    + '''' + VarToStr(dbedtCompRLA.Value) + ''','
    + '''' + VarToStr(dbedtHighSide.Value) + ''','
    + '''' + VarToStr(dbedtLowSide.Value) + ''','
    + '''' + VarToStr(dbedtCompLubricant.Value) + ''','
    + '''' + VarToStr(dbedtRefrigerant.Value) + ''','
    + '''' + VarToStr(dbedtFan.Value) + ''','
    + '''' + VarToStr(dbedtEvaporatingTempRange.Value) + ''','
    + '''' + VarToStr(dbedtPower.Value) + ''','
    + '''' + VarToStr(dbedtRatingCondition.Value) + ''','
    + '''' + VarToStr(dbedtWeight.Value) + ''','
    + '''' + gvars.CurUser + ''')');
end;

procedure TfrmPrtLabel.UpdateCUDParameterUSALog;
begin
  DM.DataSetModify('insert into PrintCUDParameterUSALog(ProductSerialNumber,Model,Application,Refrigant,'
    + 'CrankcaseHeaterPower,DesignPressureLow,DesignPressureHigh,CompressorVoltage,CompressorMotorPH,'
    + 'CompressorMotorHZ,CompressorMotorRLA,CompressorMotorLRA,CondenserFanQty,CondenserFanVoltage,'
    + 'CondenserFanPH,CondenserFanHZ,CondenserFanFLA,CondenserFanWattb,UnitPowerSupplyVoltage,'
    + 'UnitPowerSupplyPH,UnitPowerSupplyHZ,MinCircuitAmpacity,AmpsMaxBranchCircuitFuse,update_by)'
    + ' values(''' + VarToStr(dbedtProductSN2.Value) + ''','
    + '''' + dbcbbModel2.Text + ''','
    + '''' + VarToStr(dbedtApplication2.Value) + ''','
    + '''' + VarToStr(dbedtRefigant2.Value) + ''','
    + '''' + VarToStr(dbedtPower2.Value) + ''','
    + '''' + VarToStr(dbedtLow2.Value) + ''','
    + '''' + VarToStr(dbedtHigh2.Value) + ''','
    + '''' + VarToStr(dbedtComVol2.Value) + ''','
    + '''' + VarToStr(dbedtCOmPH2.Value) + ''','
    + '''' + VarToStr(dbedtComHZ2.Value) + ''','
    + '''' + VarToStr(dbedtComRLA2.Value) + ''','
    + '''' + VarToStr(dbedtComLRA2.Value) + ''','
    + '''' + VarToStr(dbedtConQty2.Value) + ''','
    + '''' + VarToStr(dbedtConVol2.Value) + ''','
    + '''' + VarToStr(dbedtConPH2.Value) + ''','
    + '''' + VarToStr(dbedtConHZ2.Value) + ''','
    + '''' + VarToStr(dbedtConFLA2.Value) + ''','
    + '''' + VarToStr(dbedtConWattb2.Value) + ''','
    + '''' + VarToStr(dbedtPowerVol2.Value) + ''','
    + '''' + VarToStr(dbedtPowerPH2.Value) + ''','
    + '''' + VarToStr(dbedtPowerHZ2.Value) + ''','
    + '''' + VarToStr(dbedtAmpacity2.Value) + ''','
    + '''' + VarToStr(dbedtFuse2.Value) + ''','
    + '''' + gvars.CurUser + ''')');
end;


{
//----- old print cud label-------------
function TfrmPrtLabel.GetCUDLabelBarCodeString: string;
var
  barStr, OriginalTop, OriginalWidth, strVoltage, strPhase, strFrequency: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    OriginalTop := '10'
  else
    OriginalTop := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    OriginalWidth := '10'
  else
    OriginalWidth := Trim(edtOriginalTop.Text);

  barStr := barStr + '^XA';
 // if UpperCase(ds_active.DataSet.FieldByName('Country').AsString) = 'CHN' then
 //   barStr := barStr + Memo1.Text;
  //barStr := barStr + '^LH300,180';
  barStr := barStr + '^LH' + OriginalTop + ',' + OriginalWidth;
  //barStr := barStr + '^FO20,5' + Memo1.Text;
  //barStr := barStr + '^CFD,36,20';
  barStr := barStr + '^FO15,60' + '^A0,25,15' + '^FDModel: ' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO15,90' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO15,130' + '^A0,25,15' + '^FDSerial No: ' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO15,155' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
  if VarToStr(dbedtVoltage.Value) = '' then
    strVoltage := VarToStr(dbedtVoltage.Value)
  else
    strVoltage := VarToStr(dbedtVoltage.Value) + '/';
  if VarToStr(dbedtPhase.Value) = '' then
    strPhase := VarToStr(dbedtPhase.Value)
  else
    strPhase := VarToStr(dbedtPhase.Value) + '/';
  //if VarToStr(dbedtFrequency.Value) = '' then
    strFrequency := VarToStr(dbedtFrequency.Value);
 // else
 //   strFrequency := VarToStr(dbedtFrequency.Value) + '/';
  barStr := barStr + '^FO15,210' + '^A0,25,20' + '^FD' + strVoltage + strPhase + strFrequency + '^FS';
  barStr := barStr + '^FO15,250' + '^A0,25,20' + '^FD' + VarToStr(dbedtCapacity.value) + '^FS';
  barStr := barStr + '^FO15,300' + '^A0,25,20' + '^FD' + VarToStr(dbedtCop.value) + '^FS';
  barStr := barStr + '^FO15,350' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLRA.value) + '^FS';
  barStr := barStr + '^FO15,400' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompRLA.value) + '^FS';
  barStr := barStr + '^FO15,500' + '^A0,25,20' + '^FD' + VarToStr(dbedtHighSide.value) + '^FS';
  barStr := barStr + '^FO220,500' + '^A0,25,20' + '^FD' + VarToStr(dbedtLowSide.value) + '^FS';
  barStr := barStr + '^FO15,550' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLubricant.value) + '^FS';
  barStr := barStr + '^FO15,600' + '^A0,25,20' + '^FD' + VarToStr(dbedtRefrigerant.value) + '^FS';
  barStr := barStr + '^FO15,650' + '^A0,25,20' + '^FD' + VarToStr(dbedtWeight.value) + 'kg' + '^FS';
  barStr := barStr + '^FO15,700' + '^A0,25,20' + '^FD' + VarToStr(dbedtStandApply.value) + '^FS';
  barStr := barStr + '^XZ';

  result := barStr;
end;
 }

function TfrmPrtLabel.GetCUDLabelBarCodeString: string;
var
  barStr, OriginalTop, OriginalWidth, strVoltage, strPhase, strFrequency: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    ShowMessage('please input OriginalTop.')
  else
    OriginalTop := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    ShowMessage('please input OriginalWidth.')
  else
    OriginalWidth := Trim(edtOriginalTop.Text);

  barStr := barStr + '^XA';
 // if UpperCase(ds_active.DataSet.FieldByName('Country').AsString) = 'CHN' then
 //   barStr := barStr + Memo1.Text;
  //barStr := barStr + '^LH300,180';
  barStr := barStr + '^LH' + OriginalTop + ',' + OriginalWidth;
  //barStr := barStr + '^FO20,5' + Memo1.Text;
  //barStr := barStr + '^CFD,36,20';
  //barStr := barStr + '^FO315,47' + '^A0,25,15' + '^FDModel: ' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO235,47' + '^A3,25,15' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
//  barStr := barStr + '^FO315,77' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO515,60' + '^BQN,2,2' + '^FD   '
    + VarToStr(dbedtModel.Value) + ','
    + VarToStr(dbedtProductSn.Value) + ','
    + CUDWebsiteChina + '^FS';
  //barStr := barStr + '^FO315,77' + '^b3o,N,30,N,N' + VarToStr(dbedtModel.Value) + '^FS';
  //barStr := barStr + '^FO315,117' + '^A0,25,15' + '^FDSerial No: ' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO235,117' + '^A3,25,15' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
//  barStr := barStr + '^FO315,142' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
  //barStr := barStr + '^FO315,142' + '^BQN,2,4' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO315,190' + '^A0,25,15' + '^FD' + FormatDateTime('YYYY-mm-dd', dtpProDate.Value) + '^FS';
  if VarToStr(dbedtVoltage.Value) = '' then
    strVoltage := VarToStr(dbedtVoltage.Value)
  else
    strVoltage := VarToStr(dbedtVoltage.Value) + '/';
  if VarToStr(dbedtPhase.Value) = '' then
    strPhase := VarToStr(dbedtPhase.Value)
  else
    strPhase := VarToStr(dbedtPhase.Value) + '/';
  //if VarToStr(dbedtFrequency.Value) = '' then
  strFrequency := VarToStr(dbedtFrequency.Value);
 // else
 //   strFrequency := VarToStr(dbedtFrequency.Value) + '/';

  //barStr := barStr + '^FO120,345' + '^A0,25,20' + '^FD'
  barStr := barStr + '^FO70,345' + '^A0,25,20' + '^FD'
    + VarToStr(dbedtVoltage.Value) + '-' + VarToStr(dbedtPhase.Value) + '-' + VarToStr(dbedtFrequency.Value)
    + '               ' + VarToStr(dbedtFan.Value) + '^FS';
  barStr := barStr + '^FO315,440' + '^A0,25,20' + '^FD' + VarToStr(dbedtEvaporatingTempRange.Value) + '^FS';
  barStr := barStr + '^FO315,490' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLRA.Value) + '^FS';
  barStr := barStr + '^FO315,540' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompRLA.Value) + '^FS';
  barStr := barStr + '^FO315,590' + '^A0,25,20' + '^FD' + VarToStr(dbedtCapacity.Value) + '^FS';
  barStr := barStr + '^FO315,640' + '^A0,25,20' + '^FD' + VarToStr(dbedtPower.Value) + '^FS';
  barStr := barStr + '^FO315,690' + '^A0,25,20' + '^FD' + VarToStr(dbedtCop.Value) + '^FS';
  barStr := barStr + '^FO315,750' + '^A0,25,20' + '^FD' + VarToStr(dbedtRatingCondition.Value) + '^FS';
  barStr := barStr + '^FO315,870' + '^A0,25,20' + '^FD' + VarToStr(dbedtLowSide.Value) + '                  ' + VarToStr(dbedtHighSide.Value) + '^FS';
  barStr := barStr + '^FO315,920' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLubricant.Value) + '^FS';
  barStr := barStr + '^FO315,970' + '^A0,25,20' + '^FD' + VarToStr(dbedtRefrigerant.Value) + '^FS';
  barStr := barStr + '^FO315,1020' + '^A0,25,20' + '^FD' + VarToStr(dbedtWeight.Value) + '^FS';
  barStr := barStr + '^FO440,1130' + '^A0,25,20' + '^FD' + ' MADE IN CHINA' + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;

{
function TfrmPrtLabel.GetCUDLabelBarCodeString: string;
var
  barStr, OriginalLeft, OriginalTop, strVoltage, strPhase, strFrequency: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    ShowMessage('please input OriginalTop.')
  else
    OriginalLeft := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    ShowMessage('please input OriginalWidth.')
  else
    OriginalTop := Trim(edtOriginalTop.Text);

  barStr := barStr + '^XA';
 // if UpperCase(ds_active.DataSet.FieldByName('Country').AsString) = 'CHN' then
 //   barStr := barStr + Memo1.Text;
  //barStr := barStr + '^LH300,180';
  barStr := barStr + '^LH' + OriginalLeft + ',' + OriginalTop;
  //barStr := barStr + '^FO20,5' + Memo1.Text;
  //barStr := barStr + '^CFD,36,20';
  barStr := barStr + '^FO315,47' + '^A0,25,15' + '^FDModel: ' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO315,77' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO315,117' + '^A0,25,15' + '^FDSerial No: ' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO315,142' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO315,190' + '^A0,25,15' + '^FD' + '2011-12-24' + '^FS';
  if VarToStr(dbedtVoltage.Value) = '' then
    strVoltage := VarToStr(dbedtVoltage.Value)
  else
    strVoltage := VarToStr(dbedtVoltage.Value) + '/';
  if VarToStr(dbedtPhase.Value) = '' then
    strPhase := VarToStr(dbedtPhase.Value)
  else
    strPhase := VarToStr(dbedtPhase.Value) + '/';
  //if VarToStr(dbedtFrequency.Value) = '' then
  strFrequency := VarToStr(dbedtFrequency.Value);
 // else
 //   strFrequency := VarToStr(dbedtFrequency.Value) + '/';

  barStr := barStr + '^FO120,345' + '^A0,25,20' + '^FD'
    + '380/420V-3-50HZ' + '               ' + '220/240V-1-50HZ' + '^FS';
  barStr := barStr + '^FO315,440' + '^A0,25,20' + '^FD' + Edit1.Text + '^FS';
  barStr := barStr + '^FO315,490' + '^A0,25,20' + '^FD' + '51.5A' + '^FS';
  barStr := barStr + '^FO315,540' + '^A0,25,20' + '^FD' + '8.8A' + '^FS';
  barStr := barStr + '^FO315,590' + '^A0,25,20' + '^FD' + '6020W' + '^FS';
  barStr := barStr + '^FO315,640' + '^A0,25,20' + '^FD' + '3420W' + '^FS';
  barStr := barStr + '^FO315,690' + '^A0,25,20' + '^FD' + '1.76' + '^FS';
  barStr := barStr + '^FO315,750' + '^A0,25,20' + '^FD' + Edit2.Text + '^FS';
  barStr := barStr + '^FO315,870' + '^A0,25,20' + '^FD' + '0.7MPa                  3.0MPa' + '^FS';
  barStr := barStr + '^FO315,920' + '^A0,25,20' + '^FD' + 'Mineral Oil' + '^FS';
  barStr := barStr + '^FO315,970' + '^A0,25,20' + '^FD' + 'R22' + '^FS';
  barStr := barStr + '^FO315,1020' + '^A0,25,20' + '^FD' + '106kg' + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;
}

function TfrmPrtLabel.GetBarCodeStrEurope: string;
var
  barStr, OriginalLeft, OriginalTop, strVoltage, strPhase, strFrequency: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    ShowMessage('please input OriginalTop.')
  else
    OriginalLeft := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    ShowMessage('please input OriginalWidth.')
  else
    OriginalTop := Trim(edtOriginalTop.Text);

  barStr := barStr + '^XA';
 // if UpperCase(ds_active.DataSet.FieldByName('Country').AsString) = 'CHN' then
 //   barStr := barStr + Memo1.Text;
  //barStr := barStr + '^LH300,180';
  barStr := barStr + '^LH' + OriginalLeft + ',' + OriginalTop;
  //barStr := barStr + '^FO20,5' + Memo1.Text;
  //barStr := barStr + '^CFD,36,20';
  barStr := barStr + '^FO220,47' + '^A3,25,15' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
//  barStr := barStr + '^FO315,77' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO515,60' + '^BQN,2,2' + '^FD   '
    + VarToStr(dbedtModel.Value) + ','
    + VarToStr(dbedtProductSn.Value) + ','
    + CUDWebsiteAsia + '^FS';
  barStr := barStr + '^FO220,117' + '^A3,25,15' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
//  barStr := barStr + '^FO315,142' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
//  barStr := barStr + '^FO315,142' + '^BQN,2,4' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO315,190' + '^A0,25,15' + '^FD' + FormatDateTime('YYYY-mm-dd', dtpProDate.Value) + '^FS';
  if VarToStr(dbedtVoltage.Value) = '' then
    strVoltage := VarToStr(dbedtVoltage.Value)
  else
    strVoltage := VarToStr(dbedtVoltage.Value) + '/';
  if VarToStr(dbedtPhase.Value) = '' then
    strPhase := VarToStr(dbedtPhase.Value)
  else
    strPhase := VarToStr(dbedtPhase.Value) + '/';
  //if VarToStr(dbedtFrequency.Value) = '' then
  strFrequency := VarToStr(dbedtFrequency.Value);
 // else
 //   strFrequency := VarToStr(dbedtFrequency.Value) + '/';


  barStr := barStr + '^FO110,345' + '^A0,25,20' + '^FD'
    + VarToStr(dbedtVoltage.Value) + '-' + VarToStr(dbedtPhase.Value) + '-' + VarToStr(dbedtFrequency.Value)
    + '               ' + VarToStr(dbedtFan.Value) + '^FS';
  barStr := barStr + '^FO315,440' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLRA.Value) + '^FS';
  barStr := barStr + '^FO315,490' + '^A0,25,20' + '^FD' + VarToStr(dbedtMaxOperatingCurrent.Value) + '^FS';
  //barStr := barStr + '^FO315,540' + '^A0,25,20' + '^FD' + '8.8A'VarToStr(dbedtCompLRA.Value) + '^FS';
  barStr := barStr + '^FO315,590' + '^A0,25,20' + '^FD' + {'6020W'} VarToStr(dbedtLowSide.Value) + '                  ' + VarToStr(dbedtHighSide.Value) + '^FS';
  barStr := barStr + '^FO315,640' + '^A0,25,20' + '^FD' + {'3420W'} VarToStr(dbedtApplication.Value) + '^FS';
  barStr := barStr + '^FO315,690' + '^A0,25,20' + '^FD' + {'1.76'} VarToStr(dbedtCompLubricant.Value) + '^FS';
  barStr := barStr + '^FO315,740' + '^A0,25,20' + '^FD' + {Edit2.Text} VarToStr(dbedtRefrigerant.Value) + '^FS';
  barStr := barStr + '^FO315,830' + '^A0,25,20' + '^FD' + {'0.7MPa                  3.0MPa'} VarToStr(dbedtWeight.Value) + '^FS';
//  barStr := barStr + '^FO315,920' + '^A0,25,20' + '^FD' + 'Mineral Oil' + '^FS';
//  barStr := barStr + '^FO315,970' + '^A0,25,20' + '^FD' + 'R22' + '^FS';
//  barStr := barStr + '^FO315,1020' + '^A0,25,20' + '^FD' + '106kg' + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;
{
function TfrmPrtLabel.GetBarCodeStrEurope: string;
var
  barStr, OriginalLeft, OriginalWidth, strVoltage, strPhase, strFrequency: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    ShowMessage('please input OriginalTop.')
  else
    OriginalLeft := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    ShowMessage('please input OriginalWidth.')
  else
    OriginalWidth := Trim(edtOriginalTop.Text);

  barStr := barStr + '^XA';
  barStr := barStr + '^LH' + OriginalLeft + ',' + OriginalWidth;
  barStr := barStr + '^FO315,47' + '^A0,25,15' + '^FDModel: ' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO315,77' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtModel.Value) + '^FS';
  barStr := barStr + '^FO315,117' + '^A0,25,15' + '^FDSerial No: ' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO315,142' + '^B1N,N,30,N,N' + '^FD' + VarToStr(dbedtProductSn.Value) + '^FS';
  barStr := barStr + '^FO315,190' + '^A0,25,15' + '^FD' + FormatDateTime('YYYY-mm-dd', now())  + '^FS';
  if VarToStr(dbedtVoltage.Value) = '' then
    strVoltage := VarToStr(dbedtVoltage.Value)
  else
    strVoltage := VarToStr(dbedtVoltage.Value) + '/';
  if VarToStr(dbedtPhase.Value) = '' then
    strPhase := VarToStr(dbedtPhase.Value)
  else
    strPhase := VarToStr(dbedtPhase.Value) + '/';
  //if VarToStr(dbedtFrequency.Value) = '' then
  strFrequency := VarToStr(dbedtFrequency.Value);
 // else
 //   strFrequency := VarToStr(dbedtFrequency.Value) + '/';

  barStr := barStr + '^FO120,345' + '^A0,25,20' + '^FD'
    + VarToStr(dbedtVoltage.Value) + '-' + VarToStr(dbedtPhase.Value) + '-' + VarToStr(dbedtFrequency.Value)
    + '               ' + VarToStr(dbedtFan.Value) + '^FS';
  barStr := barStr + '^FO315,490' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLRA.Value) + '^FS';
  barStr := barStr + '^FO315,440' + '^A0,25,20' + '^FD' + VarToStr(dbedtMaxOperatingCurrent.Value) + '^FS';
  //barStr := barStr + '^FO315,540' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompRLA.Value) + '^FS';
  barStr := barStr + '^FO315,870' + '^A0,25,20' + '^FD' + VarToStr(dbedtLowSide.Value) + '                  ' + VarToStr(dbedtHighSide.Value) + '^FS';
  barStr := barStr + '^FO315,920' + '^A0,25,20' + '^FD' + 'application' + '^FS';
  barStr := barStr + '^FO315,920' + '^A0,25,20' + '^FD' + VarToStr(dbedtCompLubricant.Value) + '^FS';
  barStr := barStr + '^FO315,970' + '^A0,25,20' + '^FD' + VarToStr(dbedtRefrigerant.Value) + '^FS';
  barStr := barStr + '^FO315,1020' + '^A0,25,20' + '^FD' + VarToStr(dbedtWeight.Value) + '^FS';

//  barStr := barStr + '^FO315,590' + '^A0,25,20' + '^FD' + VarToStr(dbedtCapacity.Value) + '^FS';
//  barStr := barStr + '^FO315,640' + '^A0,25,20' + '^FD' + VarToStr(dbedtPower.Value) + '^FS';
//  barStr := barStr + '^FO315,690' + '^A0,25,20' + '^FD' + VarToStr(dbedtCop.Value) + '^FS';
//  barStr := barStr + '^FO315,750' + '^A0,25,20' + '^FD' + VarToStr(dbedtRatingCondition.Value) + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;
}

procedure TfrmPrtLabel.BtnPrtCUDUSALabelClick(Sender: TObject);
var
  f: textfile;
  barStr1, barStr2: string;
begin
  barStr1 := GetBarCodeStrAmericaLabel1;
  assignfile(f, trim(EdtPrtPort.Text));
  rewrite(f);
  Write(f, chr(27) + '@');
  writeln(f, barStr1);
  flush(f);
  closefile(f);

  barStr2 := GetBarCodeStrAmericaLabel2;
  assignfile(f, trim(EdtPrtPort.Text));
  rewrite(f);
  Write(f, chr(27) + '@');
  writeln(f, barStr2);
  flush(f);
  closefile(f);
  UpdateCUDParameterUSALog;

  MessageDlg('Print Successfully!', mtInformation, [mbOk], 0);
end;
{
function TfrmPrtLabel.GetBarCodeStrAmericaLabel1: string;
var
  barStr, OriginalTop, OriginalWidth: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    OriginalTop := '10'
  else
    OriginalTop := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    OriginalWidth := '10'
  else
    OriginalWidth := Trim(edtOriginalTop.Text);
  barStr := barStr + '^XA';
  barStr := barStr + '^LH' + OriginalTop + ',' + OriginalWidth;
  //model
  barStr := barStr + '^FO600,420' + '^A2R,25,15' + '^FD' + dbcbbModel2.Text + '^FS';
  barStr := barStr + '^FO550,420' + '^B1R,N,30,N,N' + '^FD' + dbcbbModel2.Text + '^FS';
  //serial number
  barStr := barStr + '^FO500,420' + '^A2R,25,15' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS'; //+ ' (' + Trim(EdtSn3.Text) + ')'
  barStr := barStr + '^FO450,420' + '^B1R,N,30,N,N' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS';
  //application info
  barStr := barStr + '^FO350,120' + '^A0R,25,20' + '^FD' + VarToStr(dbedtApplication2.Value) + '^FS';
            //barStr := barStr + '^FO350,300' + '^A0R,25,20' + '^FD' + VarToStr(dbedtRefigant2.Value) + '^FS';
  barStr := barStr + '^FO350,280' + '^A0R,25,20' + '^FD' + VarToStr(dbedtRefigant2.Value) + '^FS';

  barStr := barStr + '^FO350,500' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPower2.Value) + '^FS';
  barStr := barStr + '^FO350,820' + '^A0R,25,20' + '^FD' + VarToStr(dbedtLow2.Value) + '^FS';
  barStr := barStr + '^FO350,910' + '^A0R,25,20' + '^FD' + VarToStr(dbedtHigh2.Value) + '^FS';
  //Compressor Motor
  barStr := barStr + '^FO250,300' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComVol2.Value) + '^FS';
  barStr := barStr + '^FO250,470' + '^A0R,25,20' + '^FD' + VarToStr(dbedtCOmPH2.Value) + '^FS';
  barStr := barStr + '^FO250,520' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComHZ2.Value) + '^FS';
  barStr := barStr + '^FO250,630' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComRLA2.Value) + '^FS';
  barStr := barStr + '^FO250,750' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComLRA2.Value) + '^FS';
  //Condenser Fan(s)
  barStr := barStr + '^FO190,250' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConQty2.Value) + '^FS';
  barStr := barStr + '^FO190,300' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConVol2.Value) + '^FS';
  barStr := barStr + '^FO190,470' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConPH2.Value) + '^FS';
  barStr := barStr + '^FO190,520' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConHZ2.Value) + '^FS';
  barStr := barStr + '^FO190,630' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConFLA2.Value) + '^FS';
  barStr := barStr + '^FO190,750' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConWattb2.Value) + '^FS';
  //Unit Power Supply
  barStr := barStr + '^FO120,300' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPowerVol2.Value) + '^FS';
  barStr := barStr + '^FO120,470' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPowerPH2.Value) + '^FS';
  barStr := barStr + '^FO120,520' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPowerHZ2.Value) + '^FS';

  barStr := barStr + '^FO50,300' + '^A0R,25,20' + '^FD' + VarToStr(dbedtAmpacity2.Value) + '^FS';
  barStr := barStr + '^FO50,880' + '^A0R,25,20' + '^FD' + VarToStr(dbedtFuse2.Value) + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;
 }

function TfrmPrtLabel.GetBarCodeStrAmericaLabel1: string;
var
  barStr, OriginalLeft, OriginalTop: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    OriginalLeft := '160'
  else
    OriginalLeft := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    OriginalTop := '110'
  else
    OriginalTop := Trim(edtOriginalTop.Text);
  barStr := barStr + '^XA';
  barStr := barStr + '^LH' + OriginalLeft + ',' + OriginalTop;
  barStr := barStr + '^FO540,310' + '^A2R,25,15' + '^FD' + dbcbbModel2.Text + '^FS';
//  barStr := barStr + '^FO510,310' + '^B1R,N,30,N,N' + '^FD' + dbcbbModel2.Text + '^FS';
  //serial number
  barStr := barStr + '^FO450,310' + '^A2R,25,15' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS'; //+ ' (' + Trim(EdtSn3.Text) + ')'
//  barStr := barStr + '^FO440,500' + '^BQN,2,4' + '^FD   ' + dbcbbModel2.Text + ',' + VarToStr(dbedtProductSN2.Value) + '^FS';
  barStr := barStr + '^FO440,500' + '^BQN,2,2' + '^FD   '
    + dbcbbModel2.Text + ','
    + VarToStr(dbedtProductSN2.Value) + ','
    + CUDWebsiteUSA + '^FS'; //  barStr := barStr + '^FO420,340' + '^B1R,N,30,N,N' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS';
  //model
{  barStr := barStr + '^FO520,150' + '^A2R,25,15' + '^FD' + dbcbbModel2.Text + '^FS';
  barStr := barStr + '^FO510,310' + '^B1R,N,30,N,N' + '^FD' + dbcbbModel2.Text + '^FS';
//  barStr := barStr + '^FO440,500' + '^BQN,2,4' + '^FD   ' + dbcbbModel2.Text + ',' + VarToStr(dbedtProductSN2.Value) + '^FS';
  //serial number
  barStr := barStr + '^FO420,150' + '^A2R,25,15' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS'; //+ ' (' + Trim(EdtSn3.Text) + ')'
  barStr := barStr + '^FO410,340' + '^B1R,N,30,N,N' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS';
 }//application info
  barStr := barStr + '^FO310,20' + '^A0R,25,20' + '^FD' + VarToStr(dbedtApplication2.Value) + '^FS';
            //barStr := barStr + '^FO350,300' + '^A0R,25,20' + '^FD' + VarToStr(dbedtRefigant2.Value) + '^FS';
  //barStr := barStr + '^FO300,180' + '^A0R,25,20' + '^FD' + VarToStr(dbedtRefigant2.Value) + '^FS';

  barStr := barStr + '^FO305,400' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPower2.Value) + '^FS';
  barStr := barStr + '^FO295,695' + '^A0R,25,20' + '^FD' + VarToStr(dbedtLow2.Value) + '^FS';
  barStr := barStr + '^FO295,810' + '^A0R,25,20' + '^FD' + VarToStr(dbedtHigh2.Value) + '^FS';
  //Compressor Motor
  barStr := barStr + '^FO210,200' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComVol2.Value) + '^FS';
  barStr := barStr + '^FO210,370' + '^A0R,25,20' + '^FD' + VarToStr(dbedtCOmPH2.Value) + '^FS';
  barStr := barStr + '^FO210,420' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComHZ2.Value) + '^FS';
  barStr := barStr + '^FO210,530' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComRLA2.Value) + '^FS';
  barStr := barStr + '^FO210,650' + '^A0R,25,20' + '^FD' + VarToStr(dbedtComLRA2.Value) + '^FS';
  //Condenser Fan(s)
  barStr := barStr + '^FO150,150' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConQty2.Value) + '^FS';
  barStr := barStr + '^FO150,200' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConVol2.Value) + '^FS';
  barStr := barStr + '^FO150,370' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConPH2.Value) + '^FS';
  barStr := barStr + '^FO150,420' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConHZ2.Value) + '^FS';
  barStr := barStr + '^FO150,530' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConFLA2.Value) + '^FS';
  barStr := barStr + '^FO150,650' + '^A0R,25,20' + '^FD' + VarToStr(dbedtConWattb2.Value) + '^FS';
  //Unit Power Supply
  barStr := barStr + '^FO80,200' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPowerVol2.Value) + '^FS';
  barStr := barStr + '^FO80,370' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPowerPH2.Value) + '^FS';
  barStr := barStr + '^FO80,420' + '^A0R,25,20' + '^FD' + VarToStr(dbedtPowerHZ2.Value) + '^FS';

  barStr := barStr + '^FO10,200' + '^A0R,25,20' + '^FD' + VarToStr(dbedtAmpacity2.Value) + '^FS';
  barStr := barStr + '^FO10,780' + '^A0R,25,20' + '^FD' + VarToStr(dbedtFuse2.Value) + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;

function TfrmPrtLabel.GetBarCodeStrAmericaLabel2: string;
var
  barStr, OriginalLeft, OriginalTop: string;
begin
  barStr := '';
  if Trim(edtOriginalLeft.Text) = '' then
    OriginalLeft := '155'
  else
    OriginalLeft := Trim(edtOriginalLeft.Text);
  if Trim(edtOriginalTop.Text) = '' then
    OriginalTop := '110'
  else
    OriginalTop := Trim(edtOriginalTop.Text);
  barStr := barStr + '^XA';
  //barStr := barStr + '^LH10,10';
  barStr := barStr + '^LH' + OriginalLeft + ',' + OriginalTop;
  //part no.
  barStr := barStr + '^FO570,5' + '^A4R,25,15' + '^FD' + 'PART No.(P) ' + dbcbbModel2.Text + '^FS';
  barStr := barStr + '^FO520,5' + '^B3R,N,50,N,N' + '^FDP' + dbcbbModel2.Text + '^FS';
{  barStr := barStr + '^FO480,730' + '^BQN,2,3' + '^FD   ' + dbcbbModel2.Text
    + ',' + Trim(edtProductQty2.Text)
    + ',' + VarToStr(dbedtCustomerPONum2.Value)
    + ',' + Trim(edtSupplierCode2.Text)
    + ',' + VarToStr(dbedtProductSN2.Value)
    + '^FS';
}  //qty & customer PO No.
  barStr := barStr + '^FO420,5' + '^A4R,25,15' + '^FD' + 'QUANTITY(Q) 1' + '^FS';
  barStr := barStr + '^FO370,5' + '^B3R,N,50,N,N' + '^FDQ' + Trim(edtProductQty2.Text) + '^FS';
  barStr := barStr + '^FO420,365' + '^A4R,25,15' + '^FD' + 'PO NUMBER(K) ' + VarToStr(dbedtCustomerPONum2.Value) + '^FS';
  barStr := barStr + '^FO370,365' + '^B3R,N,50,N,N' + '^FDK' + VarToStr(dbedtCustomerPONum2.Value) + '^FS';
  //supplier code & name & date
  barStr := barStr + '^FO270,5' + '^A4R,25,15' + '^FD' + 'SUPPLIER(V) ' + Trim(edtSupplierCode2.Text) + '^FS';
  barStr := barStr + '^FO220,5' + '^B3R,N,50,N,N' + '^FDV' + Trim(edtSupplierCode2.Text) + '^FS';
  barStr := barStr + '^FO270,365' + '^A4R,25,15' + '^FD' + 'SUPPLIER INFO' + '^FS';
  barStr := barStr + '^FO220,365' + '^A1R,25,15' + '^FD' + 'Emerson Climate' + '^FS';
  barStr := barStr + '^FO190,365' + '^A1R,25,15' + '^FD' + 'Technologies' + '^FS';
  barStr := barStr + '^FO160,365' + '^A1R,25,15' + '^FD' + '(Suzhou) Co.,Ltd' + '^FS';
  barStr := barStr + '^FO270,705' + '^A4R,25,15' + '^FD' + 'DATE' + '^FS';
  barStr := barStr + '^FO220,705' + '^A2R,25,15' + '^FD' + FormatDateTime('YYYY-mm-dd', dtpProDate.Value) + '^FS';
  //product sn. & ship to & country
  //barStr := barStr + '^FO60,5' + '^A4R,25,15' + '^FDSerial No.(S)' + VarToStr(dbedtProductSN2.Value) + '^FS';
  //barStr := barStr + '^FO10,5' + '^B3R,N,50,N,N' + '^FDS' + VarToStr(dbedtProductSN2.Value) + '^FS';
  barStr := barStr + '^FO60,5' + '^A4R,25,15' + '^FDSerial No.' + VarToStr(dbedtProductSN2.Value) + '^FS';
  barStr := barStr + '^FO10,5' + '^B3R,N,50,N,N' + '^FD' + VarToStr(dbedtProductSN2.Value) + '^FS';
  barStr := barStr + '^FO60,455' + '^A4R,25,15' + '^FD' + 'SHIP TO' + '^FS';
  barStr := barStr + '^FO10,455' + '^A2R,25,15' + '^FD' + 'PLANT 2' + '^FS';
  barStr := barStr + '^FO60,705' + '^A4R,25,15' + '^FD' + 'COUNTRY' + '^FS';
  barStr := barStr + '^FO10,705' + '^A2R,25,15' + '^FD' + 'USA' + '^FS';

  barStr := barStr + '^XZ';

  result := barStr;
end;


procedure TfrmPrtLabel.Button3Click(Sender: TObject);
var
  f: textfile;
  lpt: string;
  barCodeStr1: string;
begin
  lpt := EdtPrtPort.Text;
  barCodeStr1 := GetBarCodeStrAmericaLabel1;
  assignfile(f, lpt);
  rewrite(f);
  Write(f, chr(27) + '@');
  writeln(f, barCodeStr1);
  flush(f);
  closefile(f);
{  if VarToStr(dbedtCompLubricant.Value) <> ds_paramUSA.DataSet.FieldByName('oil').AsString then
  begin
    ShowMessage('Oil is wrong.');
    exit;
  end
  else if VarToStr(dbedtRefrigerant.Value) <> ds_paramUSA.DataSet.FieldByName('Refrigerant').AsString then
  begin
    ShowMessage('Refrigerant is wrong.');
    exit;
  end;      }
  UpdateCUDParameterUSALog;

  MessageDlg('Print Successfully!', mtInformation, [mbOk], 0);
end;

procedure TfrmPrtLabel.Button4Click(Sender: TObject);
var
  f: textfile;
  lpt: string;
  barCodeStr2: string;
begin
  lpt := EdtPrtPort.Text;

  barCodeStr2 := GetBarCodeStrAmericaLabel2;
  assignfile(f, lpt);
  rewrite(f);
  Write(f, chr(27) + '@');
  writeln(f, barCodeStr2);
  flush(f);
  closefile(f);

  MessageDlg('Print Successfully!', mtInformation, [mbOk], 0);
end;

procedure TfrmPrtLabel.Button1Click(Sender: TObject);
begin
  inherited;
  close;
end;

{
   // sqlConst := sQueryModelParameterCUDSQL;
   // DM.DataSetQuery(adt_paramCUD, format(sqlConst, [' and d.ModelID=' + IntToStr(modelID)]));
   // sqlConst := sQueryModelParameterCUDUSASQL;
   // DM.DataSetQuery(adt_paramUSA, format(sqlConst, [' and d.ModelID=' + IntToStr(modelID)]));
     // sqlConst := sQueryModelParameterCUDUSASQL;
     // DM.DataSetQuery(adt_paramUSA, format(sqlConst, [' and d.ModelID=' + IntToStr(modelID)]));
     // sqlConst := sQueryModelParameterCUDSQL;
    //  DM.DataSetQuery(adt_paramCUD, format(sqlConst, [' and d.ModelID=' + IntToStr(modelID)]));
procedure TfrmPrtLabel.InitalizeParameters;
var
  sqlConst: string;
  adt_modelCUD: TADODataSet;
begin
  adt_modelCUD := TADODataSet.Create(nil);
  try
    sqlConst := ' and m.Model=''' + Trim(EdtModel.Text) + '''';
    DM.DataSetQuery(adt_modelCUD, Format(sQueryModelParameterCUDSQL, [sqlConst]));
    EdtVoltage.Text := adt_modelCUD.FieldByName('Voltage').AsString;
    EdtPhase.Text := adt_modelCUD.FieldByName('Ph').AsString;
    EdtFrequency.Text := adt_modelCUD.FieldByName('Hz').AsString;
    EdtCapacity.Text := adt_modelCUD.FieldByName('Capacity').AsString;
    EdtCOP.Text := adt_modelCUD.FieldByName('COP').AsString;
    EdtCompLRA.Text := adt_modelCUD.FieldByName('L_R_A').AsString;
    EdtCompRLA.Text := adt_modelCUD.FieldByName('R_L_A').AsString;
    EdtHighSide.Text := adt_modelCUD.FieldByName('high_pressure').AsString;
    EdtLowSide.Text := adt_modelCUD.FieldByName('low_pressure').AsString;
    EdtCompLubricant.Text := adt_modelCUD.FieldByName('oil').AsString;
    EdtRefrigerant.Text := adt_modelCUD.FieldByName('Refrigerant').AsString;
    EdtWeight.Text := adt_modelCUD.FieldByName('ProductWeight').AsString;
    EdtStandApply.Text := adt_modelCUD.FieldByName('standard').AsString;
  finally
    adt_modelCUD.Free;
  end;
end;
   }



end.

