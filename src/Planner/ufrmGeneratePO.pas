unit ufrmGeneratePO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBasic, StdCtrls, ComCtrls, ActnList, ImgList, ToolWin,
  ExtCtrls;

type
  TfrmGeneratePO = class(TfrmBasic)
    GroupBox1: TGroupBox;
    ProgressBar1: TProgressBar;
    btnGeneratePOJIT: TButton;
    btnClose: TButton;
    btnGeneratePO: TButton;
    procedure btnGeneratePOJITClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGeneratePOClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses uPurchaseOrder;

procedure TfrmGeneratePO.FormCreate(Sender: TObject);
begin
  inherited;
  Height := 170;
  Width := 390;
end;

procedure TfrmGeneratePO.btnGeneratePOClick(Sender: TObject);
var
  po: TPurchaseOrder;
begin
  if MessageDlg('Is generate PO?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Self.Enabled := false;
    po := TPurchaseOrder.Create;
    try       
      if po.CalculateSchedule then
      begin
        ProgressBar1.Position := 30;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.CalculateMRP then
      begin
        ProgressBar1.Position := 45;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.CalculatePO then
      begin
        ProgressBar1.Position := 75;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.ProcessPOToDB then
      begin
        ProgressBar1.Position := 90;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.ReleasePO then
      begin
        ProgressBar1.Position := 100;
        Application.ProcessMessages;
        sleep(10);
      end;
    finally
      if MessageDlg('Finished,Is Exit?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Close;
      end;
      po.Free;
      Self.Enabled := True;
    end;
  end;
end;

procedure TfrmGeneratePO.btnGeneratePOJITClick(Sender: TObject);
var
  po: TPurchaseOrder;
begin
  if MessageDlg('Is generate PO(JIT)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Self.Enabled := false;
    //Screen.Cursor := crHourGlass;
    po := TPurchaseOrder.Create;
    try
      //po.mjGeneratePO;
      if po.JITCalculateActualConsumption then
      begin
        ProgressBar1.Position := 15;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.JITCalculateSchedule2Hours then
      begin
        ProgressBar1.Position := 30;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.JITCalculateMRP24Hours then
      begin
        ProgressBar1.Position := 45;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.JITCalculateMRP2Hours then
      begin
        ProgressBar1.Position := 60;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.JITCalculatePO then
      begin
        ProgressBar1.Position := 75;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.JITProcessPOToDB then
      begin
        ProgressBar1.Position := 90;
        Application.ProcessMessages;
        sleep(10);
      end;
      if po.JITReleasePO then
      begin
        ProgressBar1.Position := 100;
        Application.ProcessMessages;
        sleep(10);
      end;
      {
      ProgressBar1.Min := 0; ProgressBar1.Max := 100;
      for i := 1 to 100 do
      begin
        ProgressBar1.Position := i;
        Application.ProcessMessages;
        sleep(10);
      end; }
    finally
      if MessageDlg('Finished,Is Exit?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Close;
      end;
      po.Free;
      Self.Enabled := True;
      //Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmGeneratePO.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
