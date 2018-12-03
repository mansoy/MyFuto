unit uFrm2000000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmSingleBase, System.Actions,
  FMX.ActnList, FMX.Objects;

type
  TFrm2000000 = class(TFrmSingleBase)
    raPriorPage: TRectangle;
    raNextPage: TRectangle;
    raGoBack: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm2000000: TFrm2000000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm2000000);

finalization
  UnRegisterClass(TFrm2000000);

end.
