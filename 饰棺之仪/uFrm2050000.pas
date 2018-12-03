unit uFrm2050000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouchBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2050000 = class(TFrmTouchBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2050000: TFrm2050000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2050000);

finalization
  UnRegisterClass(TFrm2050000);

end.
