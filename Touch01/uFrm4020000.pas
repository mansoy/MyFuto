unit uFrm4020000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.TabControl;

type
  TFrm4020000 = class(TFrmTouch01Base)
    TabItem2: TTabItem;
    TabItem3: TTabItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm4020000: TFrm4020000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm4020000);

finalization
  UnRegisterClass(TFrm4020000);

end.
