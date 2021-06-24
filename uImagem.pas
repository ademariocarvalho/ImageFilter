unit uImagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VCLTee.TeeFilters,
  Vcl.ComCtrls, Vcl.ToolWin, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  VCLTee.TeeFiltersEditor, TypInfo;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ImageFiltered1: TImageFiltered;
    ImageFiltered2: TImageFiltered;
    ImageList1: TImageList;
    CheckBox1: TCheckBox;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    TabSheet3: TTabSheet;
    ListBox1: TListBox;
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  ImageFiltered1.Filters[0].Enabled := CheckBox1.Checked;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
  if ShowFiltersEditor(Self, ImageFiltered1.Picture.Graphic, ImageFiltered1.Filters) then
  begin
    ImageFiltered1.Invalidate;
  end;
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
  ImageFiltered1.Filters[1].ApplyTo(ImageFiltered1.Picture.Bitmap);
  ImageFiltered2.Picture:=ImageFiltered1.Picture;
  PageControl1.TabIndex := 1;
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
  ImageFiltered1.Filters[0].ApplyTo(ImageFiltered1.Picture.Bitmap);
  ImageFiltered2.Picture:=ImageFiltered1.Picture;
  PageControl1.TabIndex := 1;
end;

procedure TForm1.ToolButton5Click(Sender: TObject);
begin
  {ImageFiltered1.Filters[0].Enabled := CheckBox1.Checked;
  //ImageFiltered1.Filtered;
  ImageFiltered1.Refresh;
  ImageFiltered1.Invalidate;
  PageControl1.TabIndex := 0;}
  ImageFiltered1.Filters[0].ApplyTo(ImageFiltered1.Picture.Bitmap);
  ImageFiltered1.Picture := ImageFiltered1.Picture;
  PageControl1.TabIndex := 0;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
  ImageFiltered1.Filters[2].Region. Left:=96;
  ImageFiltered1.Filters[2].Region.Top:=66;
  ImageFiltered1.Filters[2].Region.Width:=1184;
  ImageFiltered1.Filters[2].Region.Height:=700;
  ImageFiltered1.Filters[2].ApplyTo(ImageFiltered1.Picture.Bitmap);
  ImageFiltered1.Picture := ImageFiltered1.Picture;
  PageControl1.TabIndex := 0;

end;

procedure TForm1.ToolButton7Click(Sender: TObject);
var
  Count, i : Integer;
  Info     : PPropInfo;
  List     : TPropList;
  //teste  : TImageFiltered;
begin
  Count := GetPropList(TypeInfo(TImageFiltered), tkProperties, @List);
  for i := 0 to Pred(Count) do
  begin
    Info := GetPropInfo(TypeInfo(TImageFiltered), List[i]^.Name);
    Listbox1.Items.Add(List[I]^.Name + ' : ' + Info^.PropType^.Name);
  end;
 end;

end.
