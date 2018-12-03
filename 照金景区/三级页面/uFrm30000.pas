unit uFrm30000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmBase, System.Actions, FMX.ActnList,
  FMX.TabControl, FMX.Objects;

type
  TFrm30000 = class(TFrmBase)
    rectPriorPage: TRectangle;
    rectNextPage: TRectangle;
    rectMainPage: TRectangle;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle9: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle10: TRectangle;
    Rectangle12: TRectangle;
    Rectangle16: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm30000: TFrm30000;

implementation

uses uGlobal;

{$R *.fmx}

procedure TFrm30000.FormCreate(Sender: TObject);
begin
	Self.PageLevel := plThree;
  inherited;

end;

initialization
	RegisterClass(TFrm30000);

finalization
	UnRegisterClass(TFrm30000);

end.
