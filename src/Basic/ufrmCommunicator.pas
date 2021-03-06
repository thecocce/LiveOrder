unit ufrmCommunicator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  ComCtrls, DBCtrls, ToolWin, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmCommunicator = class(TfrmDBBasicPrn)
    tbtnRefresh: TToolButton;
    adt_activeCommunicatorID: TAutoIncField;
    adt_activeCommunicatorCode: TStringField;
    adt_activeCommunicatorPhone: TStringField;
    adt_activeCommunicatorFax: TStringField;
    adt_activeCommunicatorMail: TStringField;
    adt_activeLoginID: TIntegerField;
    adt_activeIsValid: TBooleanField;
    adt_activeDisplayName: TStringField;
    N2: TMenuItem;
    MenuEdtCommunicator: TMenuItem;
    procedure adt_activeBeforeInsert(DataSet: TDataSet);
    procedure tbtnRefreshClick(Sender: TObject);
    procedure MenuEdtCommunicatorClick(Sender: TObject);
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

uses DataModule, uMJ, ufrmCommunicatorCustomer;

{$R *.dfm}

{ TfrmDBBasicPrn1 }

procedure TfrmCommunicator.SetData;
begin
  DM.DataSetQuery(adt_active, 'Select * from ViewCommunicator order by CommunicatorID desc');
end;

procedure TfrmCommunicator.SetUI;
begin
  inherited;

end;

procedure TfrmCommunicator.SetAccess;
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert];
    MenuEdtCommunicator.Visible := true;
  end;
end;

procedure TfrmCommunicator.MenuEdtCommunicatorClick(Sender: TObject);
begin
  inherited;
  if adt_active.RecordCount <> 0 then
    TfrmCommunicatorCustomer.EdtFromList(adt_active, false);
end;

procedure TfrmCommunicator.adt_activeBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  TfrmCommunicatorCustomer.EdtFromList(adt_active, true);
  Abort;
end;

procedure TfrmCommunicator.tbtnRefreshClick(Sender: TObject);
begin
  adt_active.Active := false;
  adt_active.Active := true;
end;

end.

