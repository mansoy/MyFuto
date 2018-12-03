unit uFrm40000;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, uFrmBase, System.Actions, FMX.ActnList,
  FMX.TabControl, FMX.Objects;

type
  TFrm40000 = class(TFrmBase)
    ti40100: TTabItem;
    ti40300: TTabItem;
    rectPriorPage: TRectangle;
    rectNextPage: TRectangle;
    rectMainPage: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle12: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle8: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm40000: TFrm40000;

implementation

uses uGlobal;

{$R *.fmx}

procedure TFrm40000.FormCreate(Sender: TObject);
begin
	Self.PageLevel := plThree;
  inherited;
end;

initialization
	RegisterClass(TFrm40000);

finalization
	UnRegisterClass(TFrm40000);

end.
