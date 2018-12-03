unit uFrmTouch01Base;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmTabBase, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.TabControl;

type
  TFrmTouch01Base = class(TFrmTabBase)
    raGoBack: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTouch01Base: TFrmTouch01Base;

implementation

{$R *.fmx}

end.
