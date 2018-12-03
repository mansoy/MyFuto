unit uFrm4030000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTouch01Base, System.Actions,
  FMX.ActnList, FMX.Objects, FMX.TabControl;

type
  TFrm4030000 = class(TFrmTouch01Base)
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm4030000: TFrm4030000;

implementation

{$R *.fmx}

initialization
  RegisterClass(TFrm4030000);

finalization
  UnRegisterClass(TFrm4030000);

end.
