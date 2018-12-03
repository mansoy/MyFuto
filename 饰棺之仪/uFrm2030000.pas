unit uFrm2030000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouchBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2030000 = class(TFrmTouchBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2030000: TFrm2030000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2030000);

finalization
  UnRegisterClass(TFrm2030000);

end.
