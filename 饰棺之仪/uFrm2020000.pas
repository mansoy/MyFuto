unit uFrm2020000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouchBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2020000 = class(TFrmTouchBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2020000: TFrm2020000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2020000);

finalization
  UnRegisterClass(TFrm2020000);

end.
