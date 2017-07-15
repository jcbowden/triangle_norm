unit Norm1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    label5: TLabel;
    Button1: TButton;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label10: TLabel;
    Button2: TButton;
    Label11: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}


procedure TForm1.Button1Click(Sender: TObject);
Var
 V1, V2, V3, S1, S2 : Array [0..2] of Single ;
 N : Array [0..3] of Single ;
 D, TempFloat : Single ;
 B, C, Ds : String ;
begin
V1[0] := StrToFloat(Edit1.Text) ;
V1[1] := StrToFloat(Edit2.Text) ;
V1[2] := StrToFloat(Edit3.Text) ;
V2[0] := StrToFloat(Edit4.Text) ;
V2[1] := StrToFloat(Edit5.Text) ;
V2[2] := StrToFloat(Edit6.Text) ;
V3[0] := StrToFloat(Edit7.Text) ;
V3[1] := StrToFloat(Edit8.Text) ;
V3[2] := StrToFloat(Edit9.Text) ;

S1[0] := V1[0]-V2[0] ;  S1[1] := V1[1]-V2[1] ; S1[2] := V1[2]-V2[2] ;
S2[0] := V3[0]-V2[0] ;  S2[1] := V3[1]-V2[1] ; S2[2] := V3[2]-V2[2] ;
//S2[0] := V2[0]-V3[0] ;  S2[1] := V2[1]-V3[1] ; S2[2] := V2[2]-V3[2] ;

N[0] := (S1[1]*S2[2])-(S1[2]*S2[1])   ;
N[1] := (S1[2]*S2[0])-(S1[0]*S2[2])   ;
N[2] := (S1[0]*S2[1])-(S1[1]*S2[0])   ;

N[3] := sqrt(sqr(N[0]) +  sqr(N[1]) + sqr(N[2]) )   ;  // this is 2× the area of the triangle between the 3 points
                                                       // and is the normalizing factor

D := {abs(}-1*((N[0]/N[3]*V1[0]) + (N[1]/N[3]*V1[1]) + (N[2]/N[3]*V1[2])){)}  ;

If N[1] < 0 Then B := '' else B := '+' ;
If N[2] < 0 Then C := '' else C := '+' ;
If    D < 0 Then Ds := ''else Ds:= '+' ;

Memo1.Lines.Add( 'V1:     '+Edit1.Text+', '+Edit2.Text+', '+Edit3.Text) ;
Memo1.Lines.Add( 'V1:     '+Edit4.Text+', '+Edit5.Text+', '+Edit6.Text) ;
Memo1.Lines.Add( 'V1:     '+Edit7.Text+', '+Edit8.Text+', '+Edit9.Text) ;
Memo1.Lines.Add( 'Area of triangle = ' + FloatToStrf(N[3]/2,ffGeneral,5,3)) ;
Memo1.Lines.Add( 'glNormal3f('+FloatToStrf(N[0],ffGeneral,5,3) + ', '+FloatToStrf(N[1],ffGeneral,5,3) + ', '+FloatToStrf(N[2],ffGeneral,5,3)+')'   )  ;
Memo1.Lines.Add( 'glNormal3f('+FloatToStrf(N[0]/N[3],ffGeneral,5,3) + ', '+FloatToStrf(N[1]/N[3],ffGeneral,5,3) + ', '+FloatToStrf(N[2]/N[3],ffGeneral,5,3)+') Unit'   )  ;
Memo1.Lines.Add( 'Plane eqation: '+FloatToStrf(N[0]/N[3],ffGeneral,5,3) +'x '+B+FloatToStrf(N[1]/N[3],ffGeneral,5,3) +'y '+C+FloatToStrf(N[2]/N[3],ffGeneral,5,3)+'z ' +Ds+ FloatToStrf(D,ffGeneral,5,3)) ;
Edit10.Text := FloatToStrf(N[0]/N[3],ffGeneral,5,3) ;
Label6.Caption := 'x ' + B ;
Edit11.Text := FloatToStrf(N[1]/N[3],ffGeneral,5,3) ;
Label7.Caption := 'y ' + C ;
Edit12.Text := FloatToStrf(N[2]/N[3],ffGeneral,5,3) ;
Label8.Caption := 'z ' + Ds ;
Edit13.Text := FloatToStrf(D,ffGeneral,5,3) ;

TempFloat := N[0]/N[3]*V2[0]+N[1]/N[3]*V2[1]+N[2]/N[3]*V2[2]+D ;
If TempFloat < 1e-7 then TempFloat := 0.0 ;
Memo1.Lines.Add( 'Test (V2[x]): '+FloatToStrf(TempFloat,ffGeneral,5,3)) ;
TempFloat := N[0]/N[3]*V3[0]+N[1]/N[3]*V3[1]+N[2]/N[3]*V3[2]+D ;
If TempFloat < 1e-7 then TempFloat := 0.0 ;
Memo1.Lines.Add( 'Test (V2[x]): '+FloatToStrf(TempFloat,ffGeneral,5,3)) ;
end;



procedure TForm1.Button2Click(Sender: TObject);
Var
S1, S2 : Array [0..3] of Single ;
Dist : Single ;
begin
S1[0] := StrToFloat(Edit10.Text) ;
S1[1] := StrToFloat(Edit11.Text) ;
S1[2] := StrToFloat(Edit12.Text) ;
S1[3] := StrToFloat(Edit13.Text) ;

S2[0] := StrToFloat(Edit14.Text) ;
S2[1] := StrToFloat(Edit15.Text) ;
S2[2] := StrToFloat(Edit16.Text) ;

Dist := S1[0]*S2[0] + S1[1]*S2[1] +S1[2]*S2[2] + S1[3] ;
Memo1.Lines.Add( 'Distance from '+Edit14.Text+', '+Edit15.Text+', '+Edit16.Text +' to plane = '+FloatToStrf(Dist,ffGeneral,5,3)) ;
end;



procedure TForm1.Button3Click(Sender: TObject);
Var
DPoint, DLight, DPointLight, DPointPlane, DRatio : Single ;
S1, S2, S3, Res : Array [0..3] of Single ;
begin
S1[0] := StrToFloat(Edit10.Text) ; // input plane equation valures
S1[1] := StrToFloat(Edit11.Text) ; // "
S1[2] := StrToFloat(Edit12.Text) ; // "
S1[3] := StrToFloat(Edit13.Text) ; // "

S2[0] := StrToFloat(Edit17.Text) ; // input light coordinates
S2[1] := StrToFloat(Edit18.Text) ;
S2[2] := StrToFloat(Edit19.Text) ;

S3[0] := StrToFloat(Edit14.Text) ; // input point coordinates
S3[1] := StrToFloat(Edit15.Text) ;
S3[2] := StrToFloat(Edit16.Text) ;

DLight := S1[0]*S2[0] + S1[1]*S2[1] +S1[2]*S2[2] + S1[3] ;  // calculate distance from light to plane
DPoint := S1[0]*S3[0] + S1[1]*S3[1] +S1[2]*S3[2] + S1[3] ; // calculate distance from point to plane
DPointLight :=  DPoint - DLight ;
DPointPlane :=  0 - DPoint      ;
If abs(DPoint) >= abs(DLight) then Exit
else
  begin
    DRatio := DPointPlane/DPointLight ;
    Res[0] := S3[0] + ((S3[0]-S2[0]) * DRatio) ;
    Res[1] := S3[1] + ((S3[1]-S2[1]) * DRatio) ;
    Res[2] := S3[2] + ((S3[2]-S2[2]) * DRatio) ;
    Memo1.Lines.Add( 'Projection of point '+Edit14.Text+', '+Edit15.Text+', '+Edit16.Text +' onto plane ') ;
    Memo1.Lines.Add( 'by light at '+Edit17.Text+', '+Edit18.Text+', '+Edit19.Text +' gives shadow at ' +FloatToStrf(Res[0],ffGeneral,5,3) + ', '+FloatToStrf(Res[1],ffGeneral,5,3) + ', '+FloatToStrf(Res[2],ffGeneral,5,3)) ;
  end ;
end;

end.
