unit uFrm2040000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouchBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2040000 = class(TFrmTouchBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2040000: TFrm2040000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2040000);

finalization
  UnRegisterClass(TFrm2040000);

end.
