unit uFrmLastPage;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl;

type
  TFrmLastPage = class(TFrmTouch01Base)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLastPage: TFrmLastPage;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrmLastPage);

finalization
  UnRegisterClass(TFrmLastPage);

end.
