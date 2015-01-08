unit ufrmWIP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmWIP = class(TfrmDBBasicPrn)
    adt_activecollect_id: TAutoIncField;
    adt_activeline_num: TIntegerField;
    adt_activemodel_code: TStringField;
    adt_activewip_qty: TIntegerField;
    adt_activecollect_time: TDateTimeField;
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

uses DataModule, uSQLConsts, uMJ;

{$R *.dfm}

{ TfrmWIP }

procedure TfrmWIP.SetData;
begin
  DM.DataSetQuery2(adt_active, format(sQueryWIPSQL2, ['']));
end;

procedure TfrmWIP.SetUI;
begin
  inherited;
end;

procedure TfrmWIP.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of    
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
