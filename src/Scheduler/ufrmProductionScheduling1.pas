unit ufrmProductionScheduling1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls, Mask, DBCtrlsEh, DBLookupEh,
  DateUtils, StrUtils;

type
  TfrmProductionScheduling1 = class(TfrmDBBasicPrn)
    adt_line: TADODataSet;
    adt_model: TADODataSet;
    pnlQuery: TPanel;
    dtpScheduleDate: TDateTimePicker;
    dbcbbLine: TDBLookupComboboxEh;
    ds_line: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    adt_activeProductionScheduleID: TAutoIncField;
    adt_activeAssemblyLineID: TIntegerField;
    adt_activeModelID: TIntegerField;
    adt_activePlantID: TIntegerField;
    adt_activeScheduleQuantity: TIntegerField;
    adt_activeRTD: TDateTimeField;
    adt_activeScheduleStartTime: TDateTimeField;
    adt_activeScheduleEndTime: TDateTimeField;
    adt_activeLine: TStringField;
    adt_activeModel: TStringField;
    adt_activePlantCode: TStringField;
    adt_activeSchedulePriority: TIntegerField;
    btnQuery: TButton;
    gboxModelPriority: TGroupBox;
    LboxModel: TListBox;
    BtnModelUp: TButton;
    BtnModelDown: TButton;
    btnSchedulePriority: TButton;
    GroupBox3: TGroupBox;
    pbarUpload: TProgressBar;
    btnUpload: TButton;
    procedure BtnModelUpClick(Sender: TObject);
    procedure BtnModelDownClick(Sender: TObject);
    procedure btnSchedulePriorityClick(Sender: TObject);
    procedure LboxModelDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure LboxModelDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure btnUploadClick(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
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

uses DataModule, uSQLConsts, uMJ, ufrmDBBasic, ufrmBasic;

{$R *.dfm}

{ TfrmProductionScheduling }

procedure TfrmProductionScheduling1.SetData;
begin
  DM.DataSetQuery(adt_line, format(sQueryAssemblyLineSQL, ['']));
  DM.DataSetQuery(adt_active, format(sQueryProductionScheduleSQL,
    [' and 0=1']));
end;

procedure TfrmProductionScheduling1.SetUI;
begin
  inherited;
  dtpScheduleDate.DateTime := (now + 1);
  dbcbbLine.KeyValue := 1;
  LboxModel.MultiSelect := true;
  gridData.FrozenCols := 4;
  gridData.FieldColumns['ScheduleQuantity'].Footer.ValueType := fvtSum;
end;

procedure TfrmProductionScheduling1.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    3:
      begin
        pnlBottom.Visible := true;
        if ([7] <= gVars.CurUserPlantIDSet) then
          dbcbbLine.ListFieldIndex := 3;
      end;
    4:
      pnlBottom.Visible := true;
  end;
end;

procedure TfrmProductionScheduling1.btnQueryClick(Sender: TObject);
var
  sqlConst, sqlCondition: string;

  procedure SetModelForTaxis(sqlCondition1: string);
  var
    adt_scheduleModel: TADODataSet;
    sqlConst1, Model: string;
  begin
    LboxModel.Clear;
    adt_scheduleModel := TADODataSet.Create(nil);
    try
      sqlConst1 := ' and ModelID in ('
        + ' select distinct p.ModelID from ProductionScheduleCUD p'
        + ' where 0=0 ' + sqlCondition1 + ' )';
      DM.DataSetQuery(adt_scheduleModel, Format(sQueryModelSQL, [sqlConst1]));
      LboxModel.Clear;
      while not adt_scheduleModel.Eof do
      begin
        Model := adt_scheduleModel.FieldByName('Model').AsString;
        LboxModel.Items.Add(Model);
        adt_scheduleModel.Next;
      end;
    finally
      adt_scheduleModel.Free;
    end;
  end;

begin
  DM.DataSetModify(sInsertProductionScheduleCUDSQL);
  sqlCondition := ' and PlantID in ' + gVars.CurUserPlantID
    + ' and AssemblyLineID=' + VarToStr(dbcbbLine.KeyValue)
    + ' and Convert(varchar(10),ScheduleStartTime,120)='''
    + FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime) + '''';
    {
    + ' and ScheduleStartTime>='''
    + FormatDateTime('YYYY-mm-dd', dtpScheduleDateFrom.DateTime) + ''''
    + ' and ScheduleStartTime<='''
    + FormatDateTime('YYYY-mm-dd 23:59', dtpScheduleDateTo.DateTime) + '''';}
  sqlConst := sqlCondition + ' order by AssemblyLineID,ScheduleStartTime';
  DM.DataSetQuery(adt_active, format(sQueryProductionScheduleCUDSQL, [sqlConst]));
  SetModelForTaxis(sqlCondition);
end;

procedure TfrmProductionScheduling1.LboxModelDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  Idx: Integer;
  Pos: TPoint;
begin
  if Sender is TListBox then
  begin
    with Sender as TListBox do
    begin
      Pos.X := X;
      Pos.y := Y;
      Idx := ItemAtPos(Pos, True);
      Items.Move(ItemIndex, Idx);
      ItemIndex := Idx;
    end;
  end;
end;

procedure TfrmProductionScheduling1.LboxModelDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
  Idx: Integer;
  Pos: TPoint;
begin
  Accept := False;
  if Sender is TListBox then
    with Sender as TListBox do
    begin
      Pos.X := X;
      Pos.y := Y;
      Idx := ItemAtPos(Pos, True);
      if (Idx > -1) and (idx <> ItemIndex) then
        Accept := True;
    end;
end;

procedure TfrmProductionScheduling1.BtnModelUpClick(Sender: TObject);
begin
  if LboxModel.ItemIndex > 0 then
  begin
    LboxModel.Items.Exchange(LboxModel.ItemIndex, LboxModel.ItemIndex - 1);
    LboxModel.Selected[LboxModel.ItemIndex] := true;
  end;
end;

procedure TfrmProductionScheduling1.BtnModelDownClick(Sender: TObject);
begin
  if LboxModel.ItemIndex < (LboxModel.Items.Count - 1) then
  begin
    LboxModel.Items.Exchange(LboxModel.ItemIndex, LboxModel.ItemIndex + 1);
    LboxModel.Selected[LboxModel.ItemIndex] := true;
  end;
end;

procedure TfrmProductionScheduling1.btnSchedulePriorityClick(Sender: TObject);
var
  i: integer;
begin
  if MessageDlg('Save model priority?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    for i := 0 to LboxModel.Items.Count - 1 do
      DM.DataSetModify(Format(sUpdateScheduleCUDPrioritySQL,
        [i + 1, FormatDateTime('YYYY-mm-dd', dtpScheduleDate.DateTime),
        StrToInt(VarToStr(dbcbbLine.KeyValue)), LboxModel.Items.Strings[i]]));
    adt_active.Active := false;
    adt_active.Active := true;
  end;
end;

procedure TfrmProductionScheduling1.btnUploadClick(Sender: TObject);

  function GetProductSNBeginByProductionDate(ScheduleStartTime: TDateTime): string;
  var
    sqlConst, strDay, MaxProductSN, sn, snBefore, snEnd: string;
    adt_product: TADODataSet;
  begin
    adt_product := TADODataSet.Create(self);
    try
      sqlConst := 'select Max(ProductSerialNumber) as MaxProductSN from ProductTracking';
      sqlConst := sqlConst + ' where Convert(varchar(10),ProductionStartTime,120)='''
        + FormatDateTime('YYYY-mm-dd', ScheduleStartTime) + '''';
      DM.DataSetQuery(adt_product, sqlConst);
      if adt_product.FieldByName('MaxProductSN').AsString <> '' then
      begin
        MaxProductSN := adt_product.FieldByName('MaxProductSN').AsString;
        {
        strDay := IntToStr(DayOfTheYear(dtpProductionDate.Date));
        if Length(strDay) = 1 then
          strDay := '00' + strDay;
        if Length(strDay) = 2 then
          strDay := '0' + strDay;
        snBefore := 'SZ' + RightStr(IntToStr(Yearof(dtpProductionDate.Date)), 1) + strDay;
        if MaxUnitSn <> '' then
          snEnd := IntToStr(strtoint(RightStr(MaxUnitSn, 2)) + 1)
        else
          snEnd := '01';
        if Length(snEnd) = 1 then
          snEnd := '0' + snEnd;
        sn := snBefore + snEnd;
        }
        sn := LeftStr(MaxProductSN, length(MaxProductSN) - 2)
          + Format('%.2d', [strtoint(RightStr(MaxProductSN, 2)) + 1]);
        Result := sn;
      end
      else
      begin
        strDay := IntToStr(DayOfTheYear(ScheduleStartTime));
        if Length(strDay) = 1 then
          strDay := '00' + strDay;
        if Length(strDay) = 2 then
          strDay := '0' + strDay;
        snBefore := 'SZ' + RightStr(IntToStr(Yearof(ScheduleStartTime)), 1) + strDay;
        snEnd := '01';
        sn := snBefore + snEnd;
        Result := sn;
      end;
    finally
      adt_product.Free;
    end;
  end;

  function GetWaCodeBegin: string;
  var
    sqlConst, maxWaCode: string;
    adt_product: TADODataSet;
  begin
    adt_product := TADODataSet.Create(self);
    try
      sqlConst := 'select Max(Cast(WarrentycardCode as int)) as MaxWarrentycardCode from ProductTracking';
      DM.DataSetQuery(adt_product, sqlConst);
      if adt_product.FieldByName('MaxWarrentycardCode').AsString <> '' then
      begin
        maxWaCode := adt_product.fieldbyname('MaxWarrentycardCode').AsString;
        Result := IntToStr(strtoint(maxWaCode) + 1);
      end
      else
        Result := '0';
    finally
      adt_product.Free;
    end;
  end;

var
  sqlDelete, ProductSN, WaCode: string;
  i, j, pbarPos, ModelID, ComponentID, ScheduleID, ScheduleQuantity: integer;
  ScheduleStartTime: TDateTime;
  adt_tracking, adt_bom: TADODataSet;
begin
  if gridData.DataSource.DataSet.RecordCount = 0 then
  begin
    ShowMessage('Please query data by button query.');
    exit;
  end;
  if MessageDlg('Delete these schedule data in production line, then upload schedule to production line agagin?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    PnlTop.Enabled := false;
    pnlBottom.Enabled := false;
    pnlQuery.Enabled := false;
    GroupBox1.Enabled := false;
    adt_tracking := TADODataSet.Create(nil);
    adt_bom := TADODataSet.Create(nil);
    try
      gridData.DataSource.DataSet.First;
      while not gridData.DataSource.DataSet.Eof do
      begin
        ScheduleQuantity := gridData.DataSource.DataSet.fieldbyname('ScheduleQuantity').AsInteger;
        if ScheduleQuantity > 99 then
        begin
          ShowMessage('Quantity can not greater than 99.');
          Exit;
        end;
        ScheduleID := gridData.DataSource.DataSet.fieldbyname('ProductionScheduleID').AsInteger;
        sqlDelete := Format(sDeleteProductComponentTrackingSQL,
          [' and ProductTrackingID in (select ProductTrackingID from ProductTracking'
          + ' where ProductionScheduleID=' + IntToStr(ScheduleID) + ')']);
        sqlDelete := sqlDelete + Format(sDeleteProductTrackingSQL, [' and ProductionScheduleID=' + IntToStr(ScheduleID)]);
        DM.DataSetModify(sqlDelete);
        gridData.DataSource.DataSet.Next;
      end;
      pbarPos := 1;
      gridData.DataSource.DataSet.First;
      for i := 1 to gridData.DataSource.DataSet.RecordCount do
      begin
        ModelID := gridData.DataSource.DataSet.fieldbyname('ModelID').AsInteger;
        ScheduleQuantity := gridData.DataSource.DataSet.fieldbyname('ScheduleQuantity').AsInteger;
        ScheduleID := gridData.DataSource.DataSet.fieldbyname('ProductionScheduleID').AsInteger;
        ScheduleStartTime := gridData.DataSource.DataSet.fieldbyname('ScheduleStartTime').AsDateTime;

        for j := 0 to ScheduleQuantity - 1 do
        begin
          ProductSN := GetProductSNBeginByProductionDate(ScheduleStartTime);
          WaCode := GetWaCodeBegin;
          {
          ProductSNBegin := GetProductSNBeginByProductionDate(ScheduleStartTime);
          WaCodeBegin := GetWaCodeBegin;
          if j = 0 then
          begin
            ProductSN := ProductSNBegin;
            WaCode := WaCodeBegin;
          end
          else
          begin
            ProductSN := LeftStr(ProductSNBegin, length(ProductSNBegin) - 2)
              + Format('%.2d', [strtoint(RightStr(ProductSNBegin, 2)) + i]);
            WaCode := IntToStr(strtoint(WaCodeBegin) + i);
          end;
          }
          DM.DataSetModify(Format(sInsertProductTrackingSQL,
            [ScheduleID, ProductSN, WaCode, FormatDateTime('YYYY-mm-dd', ScheduleStartTime), 1]));

          DM.DataSetQuery(adt_tracking, 'select max(ProductTrackingID) as MaxTrackingID from ProductTracking');
          DM.DataSetQuery(adt_bom, Format(sQueryBOMSQL, [' and ModelID=' + IntToStr(ModelID)]));
          while not adt_bom.Eof do
          begin
            ComponentID := adt_bom.fieldbyname('ComponentID').AsInteger;
            DM.DataSetModify(Format(sInsertProductComponentTrackingSQL,
              [adt_tracking.FieldByName('MaxTrackingID').AsInteger, ComponentID]));
            adt_bom.Next;
            pbarPos := pbarPos + 1;
            pbarUpload.Position := trunc((pbarPos / (gridData.DataSource.DataSet.RecordCount * gridData.FieldColumns['ScheduleQuantity'].Footer.SumValue * adt_bom.RecordCount)) * 100);
          end;
        end;
        gridData.DataSource.DataSet.Next;
      end;
      pbarUpload.Position := 100;
      ShowMessage('Upload finish.');
    finally
      PnlTop.Enabled := true;
      pnlQuery.Enabled := true;
      GroupBox1.Enabled := true;
      pnlBottom.Enabled := true;
      adt_tracking.Free;
      adt_bom.Free;
    end;
  end;
end;

end.

