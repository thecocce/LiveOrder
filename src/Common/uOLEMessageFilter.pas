unit uOLEMessageFilter;

interface

uses ActiveX, Classes, Windows;

type
  IOleMessageFilter = class(TInterfacedObject, IMessageFilter)
  public
    function HandleInComingCall(dwCallType: Longint; htaskCaller: HTask;
      dwTickCount: Longint; lpInterfaceInfo: PInterfaceInfo): Longint; stdcall;
    function RetryRejectedCall(htaskCallee: HTask; dwTickCount: Longint;
      dwRejectType: Longint): Longint; stdcall;
    function MessagePending(htaskCallee: HTask; dwTickCount: Longint;
      dwPendingType: Longint): Longint; stdcall;
    procedure RegisterFilter();
    procedure RevokeFilter();
  end;

implementation

{ TOleMessageFilter }

function IOleMessageFilter.HandleInComingCall(dwCallType: Integer;
  htaskCaller: HTask; dwTickCount: Integer;
  lpInterfaceInfo: PInterfaceInfo): Longint;
begin
  Result := 0;
end;

function IOleMessageFilter.MessagePending(htaskCallee: HTask; dwTickCount,
  dwPendingType: Integer): Longint;
begin
  Result := 2 //PENDINGMSG_WAITDEFPROCESS
end;

procedure IOleMessageFilter.RegisterFilter;
var
  OldFilter, NewFilter: IMessageFilter;
begin
  OldFilter := nil;
  NewFilter := IOleMessageFilter.Create;
  CoRegisterMessageFilter(NewFilter, OldFilter);
end;

function IOleMessageFilter.RetryRejectedCall(htaskCallee: HTask;
  dwTickCount, dwRejectType: Integer): Longint;
begin
  Result := -1;
  if dwRejectType = 2 then
  begin
    Result := 99;
  end;
end;

procedure IOleMessageFilter.RevokeFilter;
var
  OldFilter, NewFilter: IMessageFilter;
begin
  OldFilter := nil;
  NewFilter := nil;
  CoRegisterMessageFilter(NewFilter, OldFilter);
end;

end.
