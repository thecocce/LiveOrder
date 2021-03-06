unit DataModule;

interface

uses
  SysUtils, Classes, DB, DBGrids, ADODB, IniFiles, Forms, Variants, Dialogs,
  StrUtils; //MemTableDataEh

type
  TSPParam = class
    Name: WideString;
    DataType: TDataType;
    Direction: TParameterDirection;
    Size: Integer;
    Value: OleVariant;
  end;
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADODataSet1: TADODataSet;
    ADOConnection2: TADOConnection;
    ADOStoredProc1: TADOStoredProc;
    ADOConnection3: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ConfigureADOConnection1(iniADOConnectionName: string = 'ADOConnectionString1');
  public
    { Public declarations }
    procedure DataSetQuery(DataSet: TADODataSet; sqlConst: WideString);
    procedure DataSetSPQuery(DataSet: TADODataSet; spProcedureName: string; slSPParam: TStringList = nil);
    procedure DataSetQuery3(DataSet: TADODataSet; sqlConst: WideString);
    //procedure MTTableQuery(MTTable: TMemTableDataEh; sqlConst: WideString);
    procedure DataSetModify(sqlConst: WideString);
    procedure DataSetSPModify(spProcedureName: string; slSPParam: TStringList);
    procedure DataSetModify3(sqlConst: WideString);
    procedure SPQuery(SP: TADOStoredProc; spProcedureName: string;
      slSPParam: TStringList);
    function GetMenuName(menuid: string): string;
    function GetUserPurviewMenu(LoginID: integer): boolean;
    function CCheckID(sql: string): boolean; //传入SQL检测ID是否存在（通用）
    function CheckUserName(username: string): boolean;
    function CheckUserPassword(username, password: string): boolean;
    function ModifyPassword(username, newpass: string): boolean;
//    function SaveUserLongin(username: string; longin: boolean): boolean;
  end;

var
  DM: TDM;
  ApplicationName, CurrPrinterPath, DeliveryNotePath: string;
  CUDWebsiteChina, CUDWebsiteAsia, CUDWebsiteUSA: string;
  cfsSendMailUrl, cfsMailToPlt38, cfsMailToPlt72, cfsMailToPlt80, cfsETDMailContent: string;

implementation

uses uMJ, ufrmMain;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ADOConnection1 := TADOConnection.Create(nil);
  ConfigureADOConnection1();
end;

procedure TDM.ConfigureADOConnection1(iniADOConnectionName: string);
var
  r: TIniFile;
//  k, aCount: integer;
//  FStrList: TStringList;
begin
  ADOConnection1.LoginPrompt := false;
  if ADOConnection1.Connected then
    ADOConnection1.Connected := False;
  r := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    ADOConnection1.ConnectionString := r.ReadString('database', iniADOConnectionName, '');
    if iniADOConnectionName = 'ADOConnectionString1' then
      ADOConnection1.ConnectionString := ADOConnection1.ConnectionString + 'Password=123456;';
      {
    FStrList := TStringList.Create;
    r.ReadSection('MailRecipients', FStrList);
    aCount := mjSymbolCount(FStrList.CommaText) + 1;
    MailRecipients := '';
    for k := 1 to aCount do
    begin
      MailRecipients := MailRecipients + r.ReadString('MailRecipients', 'MailRecipient' + IntToStr(k), '') + ';';
    end;    }
    ApplicationName := r.ReadString('System', 'ApplicationName', '');
  //CurrPrinterPath := r.ReadString('System', 'Printer', '');
    gVars.SetScreenScale := r.ReadString('Setting', 'SetScreenScale', '');
    gVars.ScreenWidth := r.ReadString('Setting', 'ScreenWidth', '1366');
    gVars.ScreenHeight := r.ReadString('Setting', 'ScreenHeight', '768');
    gVars.TfrmProcessTradingOrderFrozenCols := r.ReadString('Setting', 'TfrmProcessTradingOrderFrozenCols', '');
    DeliveryNotePath := r.ReadString('DeliveryNoteSetting', 'AttachmentPath', '');
    CUDWebsiteChina := r.ReadString('CUDWebsite', 'China', '');
    CUDWebsiteAsia := r.ReadString('CUDWebsite', 'Asia', '');
    CUDWebsiteUSA := r.ReadString('CUDWebsite', 'USA', '');
    cfsSendMailUrl := r.ReadString('Setting', 'cfsSendMailUrl', '');
    cfsMailToPlt38 := r.ReadString('Setting', 'cfsMailToPlt38', '');
    cfsMailToPlt72 := r.ReadString('Setting', 'cfsMailToPlt72', '');
    cfsMailToPlt80 := r.ReadString('Setting', 'cfsMailToPlt80', '');
    cfsETDMailContent := r.ReadString('Setting', 'cfsETDMailContent', '');
  finally
    r.Free;
  end;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if ADOConnection1.Connected then
    ADOConnection1.Connected := False;
  if ADOConnection2.Connected then
    ADOConnection2.Connected := False;
end;

procedure TDM.DataSetQuery(DataSet: TADODataSet; sqlConst: WideString);
begin
  if (DataSet <> nil) and (sqlConst <> '') then
  begin
    DataSet.DisableControls;
    try
      try
        DataSet.Connection := ADOConnection1;
        DataSet.Active := False;
        DataSet.CommandType := cmdText;
        DataSet.Parameters.Clear;
        DataSet.CommandText := sqlConst;
        DataSet.Active := True;
      except on E: Exception do
        begin
          ShowMessage(E.Message);
        end;
      end;
    finally
      //Application.ProcessMessages;
      DataSet.EnableControls;
    end;
  end;
end;

procedure TDM.DataSetSPQuery(DataSet: TADODataSet; spProcedureName: string; slSPParam: TStringList);
var
  i: integer;
  sqlConst, spParam: string;
begin
  if (DataSet <> nil) and (spProcedureName <> '') then
  begin
    DataSet.DisableControls;
    try
      spParam := '';
      if slSPParam.Count > 0 then
      begin
        for i := 0 to slSPParam.Count - 1 do
        begin
          spParam := spParam + ',@' + slSPParam.Names[i] + '=''' + slSPParam.ValueFromIndex[i] + '''';
        end;
        spParam := ' ' + Copy(spParam, 2, length(spParam));
      end;
      sqlConst := 'EXEC ' + spProcedureName + spParam;
      DataSet.Connection := ADOConnection1;
      DataSet.Active := False;
      DataSet.CommandType := cmdText;
      DataSet.Parameters.Clear;
      DataSet.CommandText := sqlConst;
      DataSet.Active := True;
    finally
      //Application.ProcessMessages;
      DataSet.EnableControls;
    end;
  end;
end;

procedure TDM.DataSetModify(sqlConst: WideString);
var
  qr: TADOQuery;
begin
  if sqlConst = '' then Abort;
  qr := TADOQuery.Create(Self);
  try
    qr.Connection := ADOConnection1;
    qr.SQL.Text := sqlConst;
    ADOConnection1.BeginTrans;
    try
      qr.ExecSQL;
      ADOConnection1.CommitTrans;
    except
      ADOConnection1.RollbackTrans;
      raise eabort.create(''); // or Abort;
    end;
  finally
    qr.Free;
  end;
end;

procedure TDM.DataSetSPModify(spProcedureName: string; slSPParam: TStringList);
var
  qr: TADOQuery;
  i: integer;
  sqlConst, spParam: string;
begin
  if (spProcedureName = '') or (slSPParam = nil) then Abort;

  spParam := '';
  if slSPParam.Count > 0 then
  begin
    for i := 0 to slSPParam.Count - 1 do
    begin
      if IsNumberic(slSPParam.ValueFromIndex[i]) then
        spParam := spParam + ',@' + slSPParam.Names[i] + '=' + slSPParam.ValueFromIndex[i]
      else
      begin
        if Trim(slSPParam.ValueFromIndex[i]) = '' then
          spParam := spParam + ',@' + slSPParam.Names[i] + '='''''
        else
          spParam := spParam + ',@' + slSPParam.Names[i] + '=''' + slSPParam.ValueFromIndex[i] + '''';
      end;
    end;
    spParam := ' ' + Copy(spParam, 2, length(spParam));
  end;
  sqlConst := 'EXEC ' + spProcedureName + spParam;

  qr := TADOQuery.Create(Self);
  try
    qr.Connection := ADOConnection1;
    qr.SQL.Text := sqlConst;
    ADOConnection1.BeginTrans;
    try
      qr.ExecSQL;
      ADOConnection1.CommitTrans;
    except
      ADOConnection1.RollbackTrans;
      raise eabort.create(''); // or Abort;
    end;
  finally
    qr.Free;
  end;
end;

procedure TDM.DataSetModify3(sqlConst: WideString);
var
  qr: TADOQuery;
begin
  qr := TADOQuery.Create(Self);
  try
    qr.Connection := ADOConnection3;
    qr.SQL.Text := sqlConst;
    ADOConnection3.BeginTrans;
    try
      qr.ExecSQL;
      ADOConnection3.CommitTrans;
    except
      ADOConnection3.RollbackTrans;
      raise eabort.create(''); // or Abort;
    end;
  finally
    qr.Free;
  end;
end;

procedure TDM.DataSetQuery3(DataSet: TADODataSet; sqlConst: WideString);
begin
  DataSet.DisableControls;
  try
    DataSet.Connection := ADOConnection3;
    DataSet.Active := False;
    DataSet.CommandType := cmdText;
    DataSet.Parameters.Clear;
    DataSet.CommandText := sqlConst;
    DataSet.Active := True;
  finally
    Application.ProcessMessages;
    DataSet.EnableControls;
  end;
end;

procedure TDM.SPQuery(SP: TADOStoredProc; spProcedureName: string; slSPParam: TStringList);
var
  i: integer;
begin
  SP.Connection := ADOConnection1;
  if SP.Active then SP.Active := false;
  SP.ProcedureName := spProcedureName;
  SP.Parameters.Clear;
  SP.Parameters.Refresh;
  for i := 0 to slSPParam.Count - 1 do
  begin
    with SP.Parameters.ParamByName(TSPParam(slSPParam.Objects[i]).Name) do
    begin
      DataType := TSPParam(slSPParam.Objects[i]).DataType;
      Direction := TSPParam(slSPParam.Objects[i]).Direction;
      if TSPParam(slSPParam.Objects[i]).Direction = pdInput then
        Value := TSPParam(slSPParam.Objects[i]).Value;
    end;
  end;
  //SP.Prepared := True; //加这句存储过程就只能执行一次，第二次就会报错
  SP.ExecProc;
end;

(*
      SP.Parameters.ParamByName(slParam.Names[i]).Value := slParam.ValueFromIndex[i];
     { SP.Parameters.CreateParameter(spParameters.Parameters[i].Name,
        spParameters.Parameters[i].DataType, spParameters.Parameters[i].Direction,
        spParameters.Parameters[i].Size);  }
procedure TDM.DataSetSP(sqlConst: WideString);
begin
  DataSet.DisableControls;
  try
    DataSet.Connection := ADOConnection1;
    DataSet.Close;
    DataSet.CommandType := cmdText;
    DataSet.Parameters.Clear;
    DataSet.CommandText := '{call   存储过程(参数1,参数2)}'; //调用存储过程
    DataSet.Open;
  finally
    Application.ProcessMessages;
    DataSet.EnableControls;
  end;
end;
*)

//通过菜单ID获得菜单名

function TDM.GetMenuName(menuid: string): string;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := ADOConnection1;
  Query.SQL.Text := 'select menuname from menuinfo where menuid=:id';
  Query.Parameters.ParamByName('id').Value := menuid;
  Query.Open;
  result := trim(Query.FieldValues['menuname']);
  Query.Close;
  Query.Free;
end;

//获得用户权限可使用菜单

function TDM.GetUserPurviewMenu(LoginID: integer): boolean;
var
  Query: TADOQuery;
  tempmenuname: string;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := ADOConnection1;
  Query.SQL.Text := 'select menuid from userpurview where LoginID=:LID';
  Query.Parameters.ParamByName('LID').Value := LoginID;
  Query.Open;
  Query.First;
  while not Query.Eof do
  begin
    tempmenuname := GetMenuName(Query.FieldByName('menuid').AsString);
    mjEnabledMenu(frmMain, tempmenuname);
    Query.Next;
  end;
  result := true;
  Query.Close;
  Query.Free;
end;

//检测用户名

function TDM.CheckUserName(username: string): boolean;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := ADOConnection1;

  Query.SQL.Text := 'select username from user_info where username=:name';
  Query.Parameters.ParamByName('name').Value := username;
  Query.Open;
  if query.RecordCount = 1 then
    result := true
  else
    result := false;
  Query.Close;
  Query.Free;
end;

//检测密码正确性

function TDM.CheckUserPassword(username, password: string): boolean;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := ADOConnection1;

  Query.SQL.Text := 'select userpassword from user_info where username=:name';
  Query.Parameters.ParamByName('name').Value := username;
  Query.Open;
  if trim(Query.FieldByName('userpassword').Value) = password then
    result := true
  else
    result := false;
  Query.Close;
  Query.Free;
end;

//修改用户密码

function TDM.ModifyPassword(username, newpass: string): boolean;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := ADOConnection1;
  try
    ADOConnection1.BeginTrans;

    Query.SQL.Text := 'update user_info set userpassword=:pass where username=:name';
    Query.Parameters.ParamByName('name').Value := username;
    Query.Parameters.ParamByName('pass').Value := newpass;

    Query.ExecSQL;
    Adoconnection1.CommitTrans;
    result := true;
  except
    Adoconnection1.RollbackTrans;
    result := false;
  end;
  Query.Close;
  Query.Free;
end;

//检查ID（通用）

function TDM.CCheckID(sql: string): boolean;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.Connection := ADOConnection1;
  query.SQL.Text := sql;
  query.Open;
  if query.RecordCount > 0 then
    result := true
  else
  begin
    result := false;
  end;
  query.Close;
  query.Free;
end;

//保存登陆日志
         {
function TDM.SaveUserLongin(username: string; longin: boolean): boolean;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(self);
  Query.Connection := ADOConnection1;
  try
    dm.ADOConnection1.BeginTrans;
    if longin then
    begin
      Query.SQL.Text := 'insert into User_LoginLog (username,uptime,downtime)' +
        'values (:username,:uptime,:downtime)';
      Query.Parameters.ParamByName('username').Value := username;
      Query.Parameters.ParamByName('uptime').Value := gvars.CurUserLonginTime;
      Query.Parameters.ParamByName('downtime').Value := gvars.CurUserLonginTime;
    end
    else
    begin
      Query.SQL.Text := 'update User_LoginLog set downtime=:downtime where' +
        ' username=:username and uptime=:uptime';
      Query.Parameters.ParamByName('downtime').Value := now;
      Query.Parameters.ParamByName('username').Value := username;
      Query.Parameters.ParamByName('uptime').Value := gvars.CurUserLonginTime;
    end;
    Query.ExecSQL;
    dm.ADOConnection1.CommitTrans;
    result := true;
  except
    dm.ADOConnection1.RollbackTrans;
    result := false;
  end;
  Query.Free;
end;
     }







end.

