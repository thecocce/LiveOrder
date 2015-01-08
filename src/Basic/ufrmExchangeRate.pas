unit ufrmExchangeRate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, ActnList, PrnDbgeh, ImgList, DB,
  ADODB, Menus, PropStorageEh, DBCtrls, ComCtrls, ToolWin, GridsEh,
  DBGridEh, PrViewEh, StdCtrls, ExtCtrls, uDMEntity, uDMManager;

type
  TfrmExchangeRate = class(TfrmDBBasicPrn)
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

{ TfrmExchangeRate }

procedure TfrmExchangeRate.SetData;
begin
  DM.DataSetQuery(adt_active, 'Select * from ExchangeRate order by ExchangeDate desc');
end;

procedure TfrmExchangeRate.SetUI;
begin
  inherited;
  if objCurUser.AccessLevel in [1, 2] then
  begin
    DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast,
      nbPost, nbEdit, nbCancel, nbRefresh, nbInsert];
    gridData.ReadOnly := false;
  end;
end;

procedure TfrmExchangeRate.SetAccess;
begin
  inherited;

end;

end.

