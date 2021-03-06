unit ufrmAssemblyLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicPrn, PropFilerEh, DB, ADODB, PrnDbgeh, Menus,
  PropStorageEh, ActnList, ImgList, GridsEh, DBGridEh, PrViewEh, StdCtrls,
  DBCtrls, ComCtrls, ToolWin, ExtCtrls;

type
  TfrmAssemblyLine = class(TfrmDBBasicPrn)
    adt_activeAssemblyLineID: TAutoIncField;
    adt_activeLine: TStringField;
    adt_activeLineNumber: TStringField;
    adt_activeLineCode: TStringField;
    adt_activeConsumesMaterials: TBooleanField;
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

{ TfrmAssemblyLine }

procedure TfrmAssemblyLine.SetData;
begin
  DM.DataSetQuery(adt_active, 'EXEC usp_GetAssemblyLine');
end;

procedure TfrmAssemblyLine.SetUI;
begin
  inherited;

end;

procedure TfrmAssemblyLine.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    1:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
    3:
      begin
        DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          + [nbInsert, nbPost, nbEdit, nbDelete, nbCancel];
        gridData.ReadOnly := false;
      end;
  end;
end;

end.
