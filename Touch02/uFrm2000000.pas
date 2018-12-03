unit uFrm2000000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTabBase, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl, FMX.Gestures;

type
  TFrm2000000 = class(TFrmTabBase)
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    TabItem8: TTabItem;
    TabItem9: TTabItem;
    TabItem10: TTabItem;
    TabItem11: TTabItem;
    TabItem12: TTabItem;
    TabItem13: TTabItem;
    TabItem14: TTabItem;
    TabItem15: TTabItem;
    TabItem16: TTabItem;
    TabItem17: TTabItem;
    TabItem18: TTabItem;
    TabItem19: TTabItem;
    TabItem20: TTabItem;
    TabItem21: TTabItem;
    Timer1: TTimer;
    imgPriorPage: TImage;
    imgGoBack: TImage;
    imgNextPage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    FTickCount: TDateTime;
  protected
    procedure DoPriorPage; override;
    procedure DoNextPage; override;
    procedure DoGoBack; override;
    procedure DoAfterPageChange; override;
  public
    { Public declarations }
  end;

var
  Frm2000000: TFrm2000000;

implementation

uses QJSON, System.DateUtils, uFrmEditorText, uCfg;

{$R *.fmx}

procedure TFrm2000000.DoAfterPageChange;
begin
  inherited;
  imgNextPage.Visible := tcPage.TabIndex < tcPage.TabCount - 1;
  imgPriorPage.Visible := tcPage.TabIndex > 0;
end;

procedure TFrm2000000.DoGoBack;
begin
  inherited;
  FTickCount := Now;
end;

procedure TFrm2000000.DoNextPage;
begin
  //inherited;
  try
    FTickCount := Now;
    if tcPage.TabIndex >= tcPage.TabCount - 1 then Exit;
    PageIndex := tcPage.TabIndex + 1;
  except
  end;
end;

procedure TFrm2000000.DoPriorPage;
begin
  //inherited;
  try
    FTickCount := Now;
    if tcPage.TabIndex <= 0 then Exit;
    PageIndex := tcPage.TabIndex - 1;
  except
  end;

end;

procedure TFrm2000000.FormCreate(Sender: TObject);
begin
  inherited;
//  raPriorPage.Width := raImage.Width / 2;
  {$IFDEF DEBUG}
//  Timer1.Enabled := False;
  {$ENDIF}
//  tcPage.TabPosition := TTabPosition.Dots;
end;

procedure TFrm2000000.Timer1Timer(Sender: TObject);
begin
  inherited;
  //Timer1.Enabled := False;
//  try
//    if MilliSecondsBetween(Now, FTickCount) > {$IFDEF DEBUG}10000{$ELSE}60000{$ENDIF} then
//    begin
//      ShowMessage('Frm3000000创建了窗口');
//      uFrm3000000.fnOpenThisForm(Self);
//      FTickCount := Now;
//    end;
//  finally
//    Timer1.Enabled := True;
//  end;
end;

initialization
  RegisterClass(TFrm2000000);

finalization
  UnRegisterClass(TFrm2000000);

end.
