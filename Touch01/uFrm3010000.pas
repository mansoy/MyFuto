unit uFrm3010000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl;

type
  TFrm3010000 = class(TFrmTouch01Base)
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm3010000: TFrm3010000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm3010000);

finalization
  UnRegisterClass(TFrm3010000);

end.
