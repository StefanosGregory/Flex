%{
void display(int);
int flag;
%}
%%

([A-Z]=[a-z1-9]([+-/%*][a-z1-9])+[;]){1} {
  display(1);
}

.{1,}  {
  display(0);
}

%%
void display(int flag){
if(flag==1){
printf("Acceptable");
}
if(flag==0){
printf("No");
}
}
int main() {
  printf("Enter the expression: ");
  yylex();
  return 0;
}
