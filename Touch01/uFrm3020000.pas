unit uFrm3020000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.TabControl;

type
  TFrm3020000 = class(TFrmTouch01Base)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm3020000: TFrm3020000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm3020000);

finalization
  UnRegisterClass(TFrm3020000);

end.
