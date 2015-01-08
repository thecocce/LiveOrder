unit ufrmPurchaseOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmDBBasicTree, PropFilerEh, DB, ADODB, Menus, PropStorageEh,
  ActnList, ImgList, StdCtrls, Buttons, ComCtrls, GridsEh, DBGridEh,
  DBCtrls, ToolWin, ExtCtrls, WordXP, OleServer;

type
  TfrmPurchaseOrder = class(TfrmDBBasicTree)
    adt_activePurchaseOrderID: TAutoIncField;
    adt_activePurchaseOrderNumber: TStringField;
    adt_activeVendorID: TIntegerField;
    adt_activeComponentID: TIntegerField;
    adt_activePurchaseOrderQuantity: TIntegerField;
    adt_activeRTA: TDateTimeField;
    adt_activeConfirmedPurchaseOrderQuantity: TIntegerField;
    adt_activeETA: TDateTimeField;
    adt_activeConfirmedPurchaseOrderComments: TStringField;
    adt_activeActualReceiptsQuantity: TIntegerField;
    adt_activeATA: TDateTimeField;
    adt_activePurchaseOrderStatesID: TIntegerField;
    adt_activeComponentItem: TStringField;
    adt_activePurchaseOrderStatesName: TStringField;
    adt_activeVendorNumber: TStringField;
    adt_activeVendorName: TStringField;
    adt_activePOGenerateTime: TDateTimeField;
    adt_activeRTD: TDateTimeField;
    adt_activeETD: TDateTimeField;
    adt_activePOConfirmedTime: TDateTimeField;
    MenuGeneratePickUpForm: TMenuItem;
    WordDocument1: TWordDocument;
    WordApplication1: TWordApplication;
    WordFont1: TWordFont;
    adt_activePackageWeightUnit: TStringField;
    adt_activePackageWeight: TFloatField;
    adt_activePackageSizeUnit: TStringField;
    adt_activePackageSize: TFloatField;
    adt_activePackage: TIntegerField;
    adt_activeIsChanged: TBooleanField;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure adt_activeBeforePost(DataSet: TDataSet);
    procedure MenuGeneratePickUpFormClick(Sender: TObject);
    procedure gridDataGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
   // ftn_root: TTreeNode;
  protected
    procedure SetData; override;
    procedure SetUI; override;
    procedure SetAccess; override;
    procedure LoadTreeView(nodeName: string); override;
   // procedure LoadDataByTreeNode; override;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses DataModule, uMJ;

{ TfrmPurchaseOrder }

procedure TfrmPurchaseOrder.SetData;
begin
  //DM.DataSetQuery(adt_active, format(sQueryPurchaseOrderSQL, ['']));
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPurchaseOrder');
end;

procedure TfrmPurchaseOrder.SetUI;
begin
  inherited;
  cbbTreeType.Items.Add('PO States(Data keep 2 days)');
  cbbTreeType.Items.Add('PO ETD(Only Confirmed PO)');
  cbbTreeType.ItemIndex := 0;
  gridData.FieldColumns['PackageSize'].Footer.ValueType := fvtSum;
  gridData.FieldColumns['PackageWeight'].Footer.ValueType := fvtSum;
end;

procedure TfrmPurchaseOrder.SetAccess;
begin
  inherited;
  case gVars.CurUserLevel of
    6:
      cbbTreeType.ItemIndex := 1;
    7:
      cbbTreeType.ItemIndex := 1;
  end;
end;

procedure TfrmPurchaseOrder.LoadTreeView(nodeName: string);
var
  ftn_type: TTreeNode;
  adt_select: TADODataSet;
  aNodeName, orderCount, sqlConst: string;
begin
  inherited;
  ftn_type := TreeView1.Items.AddChild(nil, nodeName);
  adt_select := TADODataSet.Create(nil);
  try
    case cbbTreeType.ItemIndex of
      0:
        begin
          DM.DataSetQuery(adt_select, 'EXEC usp_GetPurchaseOrderStates @PurchaseOrderStatesID=1');
          while not adt_select.Eof do
          begin
            aNodeName := adt_select.FieldByName('PurchaseOrderStatesName').AsString;
            TreeView1.Items.AddChild(ftn_type, aNodeName);
            adt_select.Next;
          end;
        end;
      1:
        begin
          ftn_type.DeleteChildren;
          sqlConst := 'select convert(varchar(16),ETD,120) as ETD,count(*) as orderCount from PurchaseOrder where 0=0';
          sqlConst := sqlConst + ' and PurchaseOrderStatesID=3';
          sqlConst := sqlConst + ' group by ETD';
          sqlConst := sqlConst + ' order by ETD DESC';
          DM.DataSetQuery(adt_select, sqlConst);
          while not adt_select.Eof do
          begin
            aNodeName := adt_select.FieldByName('ETD').AsString;
            orderCount := adt_select.FieldByName('orderCount').AsString;
            TreeView1.Items.AddChild(ftn_type, aNodeName + '(' + orderCount + ')');
            adt_select.Next;
          end;
        end;
    end;
  finally
    adt_select.Free;
    ftn_type.Expanded := true;
  end;
end;

procedure TfrmPurchaseOrder.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
var
  sqlConst: string;
  i: integer;
begin
  inherited;
  if Node = nil then exit;

  //sqlConst := ' and ISNull(ISNull(ATA,ETD),RTD)>=getdate()-2';
  sqlConst := ' @IsProcess=1';
  case cbbTreeType.ItemIndex of
    0:
      begin
        case TreeView1.Selected.Level of
          0:
            begin
            end;
          1:
            begin
              sqlConst := sqlConst + ',@PurchaseOrderStatesName=''' + Node.Text + '''';
              if gVars.CurUserLevel = 4 then
              begin
                if Node.Text = 'Open Order' then
                begin
                  DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
                    + [nbPost, nbDelete, nbCancel];
                  gridData.ReadOnly := false;
                  for i := 0 to gridData.Columns.Count - 1 do
                  begin
                    if gridData.Fields[i].FieldName = 'RTA' then
                      gridData.Fields[i].ReadOnly := false
                    else
                      gridData.Fields[i].ReadOnly := true;
                  end;
                end;
              end;
            end;
        end;
      end;
    1:
      begin
        sqlConst := sqlConst + ',@PurchaseOrderStatesID=3';
        case TreeView1.Selected.Level of
          0:
            begin
            end;
          1:
            begin
              //sqlConst := sqlConst + ' and convert(varchar(16),ETD,120)=''' + Copy(Node.Text, 1, 16) + '''';
              sqlConst := sqlConst + ',@ETD=''' + Copy(Node.Text, 1, 16) + '''';
            end;
        end;
      end;
  end;
  DM.DataSetQuery(adt_active, 'EXEC usp_GetPurchaseOrder ' + sqlConst);
end;

procedure TfrmPurchaseOrder.gridDataGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if gridData.DataSource.DataSet.FieldByName('IsChanged').AsBoolean then
    Background := clGray;
end;

procedure TfrmPurchaseOrder.adt_activeBeforePost(DataSet: TDataSet);
begin
  try
    gridData.DataSource.DataSet.DisableControls;
    if not (gridData.DataSource.DataSet.State in [dsEdit]) then
      gridData.DataSource.DataSet.Edit;
    if (gridData.SelectedField.FieldName = 'RTA')
      and (gridData.SelectedField.OldValue <> gridData.SelectedField.Value) then
    begin
      gridData.DataSource.DataSet.FieldByName('RTD').ReadOnly := false;
      gridData.DataSource.DataSet.FieldByName('RTD').Value := gridData.DataSource.DataSet.FieldByName('RTA').AsDateTime - 1 / 24;
      gridData.DataSource.DataSet.FieldByName('RTD').ReadOnly := true;
    end;
    gridData.DataSource.DataSet.FieldByName('IsChanged').Value := 1;
    gridData.DataSource.DataSet.EnableControls;
  except
    exit;
  end;
end;

procedure TfrmPurchaseOrder.MenuGeneratePickUpFormClick(Sender: TObject);
var
  oTable: WordXP.Table;
  a, b, c: OleVariant;
  Template, NewTemplate, DocumentType, isVisible, ItemIndex: OleVariant;
  VendorName, PackageSize, PackageWeight: string;
  orderRecordCount, y: integer;
begin
  orderRecordCount := gridData.DataSource.DataSet.RecordCount;
  gridData.DataSource.DataSet.First;
  VendorName := gridData.DataSource.DataSet.fieldbyname('VendorName').AsString;

  try
    try
      WordApplication1.Connect;
    except
      Beep;
      MessageDlg('无法连接，没有安装Word', mtError, [mbOK], 0);
      Abort;
    end;
    WordApplication1.Visible := true;
    Template := ExtractFilePath(application.ExeName) + 'FormTemplate\Planner\mrp.dot';
    NewTemplate := False;
    DocumentType := wdNewBlankDocument;
    isVisible := true;
    WordApplication1.Documents.Add(Template, NewTemplate, DocumentType, isVisible);
    itemIndex := 1;
    WordDocument1.ConnectTo(WordApplication1.Documents.Item(itemIndex));

    a := 'mDate';
    b := 'mVendorName';
    c := 'mMRP';
    WordDocument1.Bookmarks.Item(a).Range.Text := FormatDateTime('YYYY-mm-dd hh:mm', now);
    WordDocument1.Bookmarks.Item(b).Range.Text := VendorName;

    oTable := WordDocument1.Tables.Add(WordDocument1.Bookmarks.Item(c).Range,
      orderRecordCount + 2, 7, EmptyParam, EmptyParam);
    oTable.Cell(1, 1).Range.Text := '物料号';
    oTable.Cell(1, 2).Range.Text := '数量';
    oTable.Cell(1, 3).Range.Text := '数量确认';
    oTable.Cell(1, 4).Range.Text := '箱数';
    oTable.Cell(1, 5).Range.Text := '总体积';
    oTable.Cell(1, 6).Range.Text := '重量';
    oTable.Cell(1, 7).Range.Text := '备注';
    gridData.DataSource.DataSet.First;
    for y := 1 to orderRecordCount do
    begin
      PackageSize := gridData.DataSource.DataSet.FieldByName('PackageSize').AsString;
      PackageWeight := gridData.DataSource.DataSet.FieldByName('PackageWeight').AsString;
      oTable.Cell(1 + y, 1).Range.Text := gridData.DataSource.DataSet.FieldByName('ComponentItem').AsString;
      oTable.Cell(1 + y, 2).Range.Text := gridData.DataSource.DataSet.FieldByName('PurchaseOrderQuantity').AsString;
      oTable.Cell(1 + y, 3).Range.Text := gridData.DataSource.DataSet.FieldByName('ConfirmedPurchaseOrderQuantity').AsString;
      oTable.Cell(1 + y, 4).Range.Text := gridData.DataSource.DataSet.FieldByName('Package').AsString;
      oTable.Cell(1 + y, 5).Range.Text := PackageSize;
      oTable.Cell(1 + y, 6).Range.Text := PackageWeight;
      oTable.Cell(1 + y, 7).Range.Text := '';
      gridData.DataSource.DataSet.Next;
    end;
    oTable.Cell(3 + orderRecordCount, 1).Range.Text := '';
    oTable.Cell(3 + orderRecordCount, 2).Range.Text := VarToStr(gridData.FieldColumns['PurchaseOrderQuantity'].Footer.SumValue);
    oTable.Cell(3 + orderRecordCount, 3).Range.Text := VarToStr(gridData.FieldColumns['ConfirmedPurchaseOrderQuantity'].Footer.SumValue);
    oTable.Cell(3 + orderRecordCount, 4).Range.Text := VarToStr(gridData.FieldColumns['Package'].Footer.SumValue);
    oTable.Cell(3 + orderRecordCount, 5).Range.Text := VarToStr(gridData.FieldColumns['PackageSize'].Footer.SumValue);
    oTable.Cell(3 + orderRecordCount, 6).Range.Text := VarToStr(gridData.FieldColumns['PackageWeight'].Footer.SumValue);
    oTable.Cell(3 + orderRecordCount, 7).Range.Text := '';

    oTable.Range.Select;
    oTable.Range.Font.Size := 10;
    oTable.Range.Font.Bold := 1;

    WordApplication1.Disconnect;
  except on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplication1.Disconnect;
    end;
  end;
end;
 {         sqlConst := ' and PurchaseOrderStatesID<>1';
          sqlConst := sqlConst + ' order by PurchaseOrderStatesID';
          DM.DataSetQuery(adt_select, format(sQueryPOStatesSQL, [sqlConst]));
}

end.

