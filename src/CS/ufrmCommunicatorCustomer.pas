unit ufrmCommunicatorCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicDT, PropFilerEh, MemTableDataEh, Db, ADODB,
  DataDriverEh, MemTableEh, Menus, PropStorageEh, ActnList, ImgList,
  GridsEh, DBGridEh, StdCtrls, ExtCtrls, DBCtrls, ComCtrls, ToolWin, Mask,
  DBCtrlsEh, DBLookupEh;

type
  TfrmCommunicatorCustomer = class(TfrmDBBasicDT)
    adt_login: TADODataSet;
    adt_activeCommunicatorID: TAutoIncField;
    adt_activeCommunicatorCode: TStringField;
    adt_activeCommunicatorPhone: TStringField;
    adt_activeCommunicatorFax: TStringField;
    adt_activeCommunicatorMail: TStringField;
    adt_activeLoginID: TIntegerField;
    adt_activeDisplayName: TStringField;
    adt_customer: TADODataSet;
    adt_active2CustomerID: TIntegerField;
    adt_active2CustomerName: TStringField;
    adt_activeDisplayName1: TStringField;
    adt_active2CustomerName1: TStringField;
    adt_active2CustomerNumber: TStringField;
    Label4: TLabel;
    btnSave: TButton;
    dbcbbCustomer: TDBLookupComboboxEh;
    ds_customer: TDataSource;
    adt_activeMainframeDisplayName: TStringField;
    procedure gridDataEnter(Sender: TObject);
    procedure adt_activeBeforeDelete(DataSet: TDataSet);
    procedure adt_active2BeforeDelete(DataSet: TDataSet);
    procedure gridData2Enter(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure adt_activeAfterScroll(DataSet: TDataSet);
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

{ TfrmCommunicatorCustomer }

procedure TfrmCommunicatorCustomer.SetData;
var
  sqlConst: string;
begin
  DM.DataSetQuery(adt_login, 'EXEC usp_GetLogin @AccessLevel=2');
  DM.DataSetQuery(adt_customer, 'EXEC usp_GetCustomer @PlantID='''
    + gVars.CurUserPlantID + ''',@Col=''CustomerName''');
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomer @PlantID=0');
  sqlConst := '';
  if gVars.CurUserLevel = 2 then
    sqlConst := ' @LoginID=' + IntToStr(gVars.CurLoginID);
  DM.DataSetQuery(adt_active, 'EXEC usp_GetCommunicator' + sqlConst);
end;

procedure TfrmCommunicatorCustomer.SetUI;
begin
  inherited;
  GroupBox1.Caption := 'Communicator';
  GroupBox2.Caption := 'Communicator--Customer';
  PageControl1.Align := alTop;
  Splitter1.Align := alTop;
  GroupBox2.Align := alClient;
end;

procedure TfrmCommunicatorCustomer.SetAccess;
begin
  inherited;
  pnlBottom.Visible := true;
  case gVars.CurUserLevel of
    2:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbPost, nbCancel];
        gridData.ReadOnly := false;
        gridData.FieldColumns['CommunicatorCode'].ReadOnly := true;
        gridData.FieldColumns['DisplayName1'].ReadOnly := true;
      end;
    10:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
        gridData2.ReadOnly := false;
      end;
  end;
end;

procedure TfrmCommunicatorCustomer.gridDataEnter(Sender: TObject);
begin
  inherited;
  if gVars.CurUserLevel = 2 then
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbPost, nbCancel];
end;

procedure TfrmCommunicatorCustomer.gridData2Enter(Sender: TObject);
begin
  inherited;
  if gVars.CurUserLevel = 2 then
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      + [nbInsert, nbPost, nbEdit, nbCancel];
end;

procedure TfrmCommunicatorCustomer.adt_activeAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  DM.DataSetQuery(adt_active2, 'EXEC usp_GetCustomer @Roles=''communicator'',@LoginID='
    + IntToStr(gVars.CurLoginID));
end;

procedure TfrmCommunicatorCustomer.adt_activeBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  DM.DataSetModify('EXEC usp_DeleteCommunicator @CommunicatorID='
    + DataSet.fieldbyname('CommunicatorID').AsString);
  DataSet.Active := false;
  DataSet.Active := true;
  gridData2.DataSource.DataSet.Active := false;
  gridData2.DataSource.DataSet.Active := true;
  Abort;
end;

procedure TfrmCommunicatorCustomer.adt_active2BeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  DM.DataSetModify('EXEC usp_DeleteCommunicator @CommunicatorID='
    + DataSet.fieldbyname('CommunicatorID').AsString);
  gridData2.DataSource.DataSet.Active := false;
  gridData2.DataSource.DataSet.Active := true;
  Abort;
end;

procedure TfrmCommunicatorCustomer.btnSaveClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Assign this customer to communicator:' + gvars.CurUserDisplayName, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DM.DataSetModify('EXEC usp_InsertCommunicatorCustomer @LoginID=' + IntToStr(gVars.CurLoginID)
      + ',@CustomerID=' + VarToStr(dbcbbCustomer.Value));
  end;
end;

  //sqlCC := Format(sDeleteCommunicatorCustomerSQL, [' and CommunicatorID=' + DataSet.fieldbyname('CommunicatorID').AsString]);
  //sqlCommunicator := Format(sDeleteCommunicatorSQL, [' and CommunicatorID=' + DataSet.fieldbyname('CommunicatorID').AsString]);
  //DM.DataSetModify(sqlCC + sqlCommunicator);
  //sqlCC := Format(sDeleteCommunicatorCustomerSQL, [' and CommunicatorID=' + DataSet.fieldbyname('CommunicatorID').AsString]);
  //DM.DataSetModify(sqlCC);
  //sqlConst := ' and l.AccessLevel=2';
  //DM.DataSetQuery(adt_login, format(sQueryLoginSQL, [sqlConst]));
 { sqlConst := ' and PlantID in' + gVars.CurUserPlantID;
  sqlConst := sqlConst + ' order by CustomerName';
  DM.DataSetQuery(adt_customer, format(sQueryCustomerSQL, [sqlConst]));
  sqlConst := ' and 0=1';
  DM.DataSetQuery(adt_active2, format(sQueryCustomerSQL, [sqlConst]));  }
 // DM.DataSetQuery(adt_active, format(sQueryCommunicatorSQL, [sqlConst]));
{
procedure TfrmCommunicatorCustomer.gridDataCellClick(Column: TColumnEh);
//var
//  sqlConst: string;
//  CommunicatorID: integer;
begin
  CommunicatorID := gridData.DataSource.DataSet.FieldByName('CommunicatorID').AsInteger;
  if CommunicatorID = 0 then exit;

  case gVars.CurUserLevel of
    2:
      begin
        sqlConst := ' and CustomerID in'
          + ' (select cc.CustomerID from CommunicatorCustomer cc'
          + ' left outer join Communicator r ON cc.CommunicatorID = r.CommunicatorID'
          + ' where r.CommunicatorID=' + IntToStr(CommunicatorID) + ')';
      end;
  end;
  sqlConst := sqlConst + ' and PlantID in' + gVars.CurUserPlantID;
  DM.DataSetQuery(adt_active2, format(sQueryCustomerSQL, [sqlConst]));


  gridData2.DataSource.DataSet.Active := false;
  gridData2.DataSource.DataSet.Active := true;
end;
 }
end.
