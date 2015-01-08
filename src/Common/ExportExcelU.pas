////////////////////////////////
// 单元名：ExportExcelU       //
// 窗体名：ExportExcelF       //
// 单元功能：导出数据到EXCEL  //
// 作者：刘波                 //
////////////////////////////////
unit ExportExcelU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Excel2000, OleServer, ComCtrls, ExcelXP;
type
  TExportExcelF = class(TForm)
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCPaint(var Msg: TWMNCPaint); message WM_NCPAINT;
  public
    { Public declarations }
    procedure ExportExcelValue(templist: TListView); //导出数据到EXCEL
  end;

var
  ExportExcelF: TExportExcelF;

implementation

uses uMJ, ufrmMain;

{$R *.dfm}

procedure TExportExcelF.WMNCPaint(var Msg: TWMNCPaint);
begin
  inherited;
  mjDraw(ExportExcelF);
end;

//导出数据到EXCEL*************************************************

procedure TExportExcelF.ExportExcelValue(templist: TListView);
var
  i, j: integer;
begin
  try
    ExcelApplication1.Connect;
    excelapplication1.Visible[0] := true;
    ExcelWorkbook1.ConnectTo(ExcelApplication1.Workbooks.Add(EmptyParam, 0));
    ExcelWorkSheet1.ConnectTo(excelworkbook1.Worksheets.Add(emptyparam,
      emptyparam, emptyparam, emptyparam, 0) as _worksheet);
    for i := 1 to templist.Columns.Count do
    begin
      EXcelworksheet1.Columns.Cells.Item[1, i] := templist.Column[i - 1].Caption;
    end;
    for i := 2 to templist.Items.Count + 1 do
    begin
      for j := 1 to templist.Columns.Count do
      begin
        if j = 1 then
          EXcelworksheet1.Cells.Item[i, j] := templist.Items.Item[i - 2].Caption
        else
          EXcelworksheet1.Cells.Item[i, j] := templist.Items.Item[i - 2].SubItems.Strings[j - 2];
      end;
    end;
  finally
    ExcelWorkSheet1.Disconnect;
    ExcelWorkbook1.Disconnect;
    ExcelApplication1.Disconnect;
  end;
end;

procedure TExportExcelF.BitBtn2Click(Sender: TObject);
begin
  ExportExcelValue(exportexcelf.Owner.FindComponent(gvars.ExportExcelListView) as tlistview);
  close;
end;

procedure TExportExcelF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  exportexcelf := nil;
  action := cafree;
end;

procedure TExportExcelF.FormCreate(Sender: TObject);
begin
  caption := '订单管理系统--导出数据';
  Icon := frmMain.Icon;
end;

end.

