unit MainframeOLE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComObj, StdCtrls, shellapi, variants;

type

  TMainframeOLEEvent = procedure(Row, Col: Integer; Keys: string) of object;

  TMainframeOLE = class(TComponent)
  private
    FUseActiveSession: Boolean;
    FActive: Boolean;
    FSystemTimeout: Integer;
    FWaitTime: Integer;
    mysystem, mysession, myscreen: Variant;
    FOnSendkeysEvent: TMainframeOLEEvent;
    FOnGetStringEvent: TMainframeOLEEvent;
    FOnActiveEvent: TNotifyEvent;
    FOnBeforeWaithostQuiet: TNotifyEvent;
    FOnAfterWaithostQuiet: TNotifyEvent;
    FSessionFile: string;
    function GetRow: Integer;
    procedure SetRow(Value: Integer);
    function GetCol: Integer;
    procedure SetCol(Value: Integer);
    function GetRows: Integer;
    function GetCols: Integer;
    procedure SetActive(Value: Boolean);
    { Private declarations }
  protected
    procedure Connect;
    procedure DisConnect;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Active: Boolean read FActive write SetActive;
    property Row: Integer read GetRow write SetRow;
    property Col: Integer read GetCol write SetCol;
    property Rows: Integer read GetRows;
    property Cols: Integer read GetCols;
    procedure Moveto(Row, Col: Integer);
    function GetString(Row, Col, Size: Integer): string;
    procedure Sendkeys(Keys: string);
    procedure WaithostQuiet(WaitTime: Integer); overload;
    procedure WaithostQuiet; overload;
    { Public declarations }
  published
    property UseActiveSession: Boolean read FUseActiveSession write FUseActiveSession;
    property SessionName: string read FSessionFile write FSessionFile;
    property SystemTimeout: Integer read FSystemTimeout write FSystemTimeout;
    property WaitTime: Integer read FWaitTime write FWaitTime;
    property OnAfterSendKeys: TMainframeOLEEvent
      read FOnSendKeysEvent write FOnSendkeysEvent;
    property OnAfterGetString: TMainframeOLEEvent
      read FonGetStringEvent write FonGetStringEvent;
    property OnActive: TNotifyEvent
      read FonActiveEvent write FOnActiveEvent;
    property OnBeforeWaithostQuiet: TNotifyEvent
      read FOnBeforeWaithostQuiet write FOnBeforeWaithostQuiet;
    property OnAfterWaithostQuiet: TNotifyEvent
      read FOnAfterWaithostQuiet write FOnAfterWaithostQuiet;

    { Published declarations }
  end;

procedure Register;

implementation

constructor TMainframeOLE.Create(AOwner: TComponent);
begin
  inherited;
  FActive := False;
  FWaitTime := 4000;
  FSystemtimeout := 60000;
  FUseActiveSession := false;
end;

procedure TMainframeOLE.Connect;
var
  i: integer;
  find: Boolean;
begin
  if FActive then exit;
  try
    mysystem := CreateOleObject('EXTRA.System');
    //Application.MessageBox( 'Extra Personal Client Object Created', 'Success',MB_OK);
  except
    Application.MessageBox('Extra Personal Client Not Installed', 'Error', MB_OK);
    Halt;
  end;
  find := false;

  if (Uppercase(Fsessionfile) = 'CURRENTSESSION') or FUseActiveSession then
  begin
    mysession := mysystem.ActiveSession;
    find := true;
  end
  else
    for i := 1 to mysystem.sessions.count do
    begin
      if uppercase(Fsessionfile) = uppercase(mysystem.sessions[i].fullname) then
        if fileexists(fsessionfile) then
        begin
          mysession := mysystem.sessions[i];
          find := true;
        end;
    end;

  if not find then
    if fileexists(fsessionfile) then
      if messagedlg('Session:' + fsessionfile + ' has not been opened, Do you want to open it?',
        mtConfirmation, [MBYES, MBNO], 0) = mrOk then
        ShellExecute(0, '', PChar(fsessionfile), '', '', SW_SHOW)
      else
        exit
    else if messagedlg('Session:' + fsessionfile + ' has not been found, Do you want to use Active Session instead of it?',
      mtConfirmation, [MBYES, MBNO], 0) = mrOk then
      mysession := mysystem.ActiveSession
    else
      exit
  else
  begin
    myscreen := mysession.Screen;
    FActive := True;
    if Assigned(FOnActiveEvent) then FOnActiveEvent(Self);
  end;
end;

destructor TMainframeOLE.Destroy;
begin
  DisConnect;
  inherited;
end;


procedure TMainframeOLE.DisConnect;
begin
  if FActive then
    FActive := False;
  mysystem := null;
end;

procedure TMainframeOLE.SetActive(Value: Boolean);
begin
  FActive := Value;
  if Value then
    Connect
  else
    Disconnect;
end;

procedure TMainframeOLE.Sendkeys(keys: string);
begin
  Connect;
  myscreen.SendKeys(keys);
  if Assigned(FOnSendkeysEvent) then
    FOnSendkeysEvent(Row, Col, Keys);
end;

procedure TMainframeOLE.Moveto(Row, Col: Integer);
begin
  MyScreen.Col := Col;
  MyScreen.Row := Row;
end;

function TMainframeOLE.GetString(Row, Col, Size: Integer): string;
begin
  Connect;
  Result := myscreen.GetString(Row, Col, Size);
  if Assigned(FOnGetStringEvent) then
    FOnGetStringEvent(Row, Col, Result);
end;

function TMainframeOLE.GetRow: Integer;
begin
  Connect;
  Result := MyScreen.Row;
end;

procedure TMainframeOLE.SetRow(Value: Integer);
begin
  Connect;
  MyScreen.Row := Value;
end;

function TMainframeOLE.GetCol: Integer;
begin
  Connect;
  Result := MyScreen.Col;
end;

procedure TMainframeOLE.SetCol(Value: Integer);
begin
  Connect;
  MyScreen.Col := Value;
end;

function TMainframeOLE.GetRows: Integer;
begin
  Connect;
  Result := Myscreen.Rows;
end;

function TMainframeOLE.GetCols: Integer;
begin
  Connect;
  Result := Myscreen.Cols;
end;

procedure TMainframeOLE.WaithostQuiet(Waittime: Integer);
begin
  Connect;
  Application.ProcessMessages;
  if Assigned(FOnBeforeWaitHostQuiet) then
    FOnBeforeWaitHostQuiet(Self);
  myscreen.WaithostQuiet(Waittime);
  if Assigned(FOnAfterWaitHostQuiet) then
    FOnAfterWaitHostQuiet(Self);
  Application.ProcessMessages;
end;

procedure TMainframeOLE.WaithostQuiet;
begin
  WaithostQuiet(FWaittime);
end;

procedure Register;
begin
  RegisterComponents('Allen', [TMainframeOLE]);
end;

end.
