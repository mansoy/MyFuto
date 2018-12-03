unit uFrm2060000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouchBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2060000 = class(TFrmTouchBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2060000: TFrm2060000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2060000);

finalization
  UnRegisterClass(TFrm2060000);

end.
