unit uFrm3030000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.TabControl;

type
  TFrm3030000 = class(TFrmTouch01Base)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm3030000: TFrm3030000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm3030000);

finalization
  UnRegisterClass(TFrm3030000);

end.
