%{
  void display(int);
  int check_flag;
  int  length;
  int end_flag=1;
%}
%%
(Δίνεται) {
  display(1);
}

(σημείο|ευθεία|τρίγωνο|τετράγωνο|πεντάγωνο) {
  if(0==strcmp ( "σημείο",yytext)){
    check_flag=0;
  }else if(0==strcmp ( "ευθεία",yytext)){
    check_flag=1;
  }else if(0==strcmp ( "τρίγωνο",yytext)){
    check_flag=2;
  }else if(0==strcmp ( "τετράγωνο",yytext)){
    check_flag=3;
  }else if(0==strcmp ( "πεντάγωνο",yytext)){
    check_flag=4;
  }else{
    end_flag=0;
    display(0);
  }

  printf("%s",yytext);
  display(2);
}

((Α){0,1}|(Β){0,1}|(Γ){0,1}|(Δ){0,1}|(Ε){0,1}|(Ζ){0,1}|(Η){0,1}|(Θ){0,1}) {
  length=yyleng/2;
  if(length==1 && check_flag==0){
    printf("%s",yytext);
    display(3);
  }else if(length==2 && check_flag==1){
    printf("%s",yytext);
    display(3);
  }else if(length==3 && check_flag==2){
    printf("%s",yytext);
    display(3);
  }else if(length==4 && check_flag==3){
    printf("%s",yytext);
    display(3);
  }else if(length==5 && check_flag==4){
    printf("%s",yytext);
    display(3);
  }else {
    end_flag=0;
    display(0);
  };
}
(" ") {}

[^Δίνεται][^(σημείο|ευθεία|τρίγωνο|τετράγωνο|πεντάγωνο)][^(Α|Β|Γ|Δ|Ε|Ζ|Η|Θ)] {
  end_flag=0;
  display(0);
}
%%
void display(int Flag){
    if(Flag==1){
        printf("Δίνεται: ρήμα\n");
    }else if(Flag==2){
        printf(" :γεωμετρική οντότητα\n");
    }else if(Flag==3){
        printf(" :Έιναι όνομα γεωμετρικής οντότητας\n");
    }else if(Flag==0 && end_flag==0){
        printf("Οι πληροφορίες δεν ταιριάζουν μεταξύ τους!\n");
        end_flag=1;
      };

}
int main(){
  printf("Enter the expression: ");
  yylex();
  return 0;
}
