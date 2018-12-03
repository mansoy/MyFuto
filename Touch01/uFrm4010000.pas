unit uFrm4010000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.TabControl;

type
  TFrm4010000 = class(TFrmTouch01Base)
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    procedure raImagePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm4010000: TFrm4010000;

implementation

{$R *.fmx}

procedure TFrm4010000.raImagePaint(Sender: TObject; Canvas: TCanvas; const ARect: TRectF);
begin
  inherited;
  {$IFDEF DEBUG}
  TabItem1.Text := IntToStr(ID);
  {$ENDIF}
end;

initialization
  RegisterClass(TFrm4010000);

finalization
  UnRegisterClass(TFrm4010000);

end.
