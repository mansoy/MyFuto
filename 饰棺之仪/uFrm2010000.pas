unit uFrm2010000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouchBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2010000 = class(TFrmTouchBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2010000: TFrm2010000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2010000);

finalization
  UnRegisterClass(TFrm2010000);
end.
