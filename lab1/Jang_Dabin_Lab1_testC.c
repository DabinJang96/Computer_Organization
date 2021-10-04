#include <stdio.h>
#include <string.h>
// SOLUTION FILE

main()
{
  int var_int;                    // 2
  int numarr[5] = {1,2,3,4,5};

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Dabin Jang! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");

  printf("\n size of data type int = %d ", sizeof(var_int));
  printf("\n size of data type int = %d ", sizeof(numarr));
  printf("\n size of data type string = %d ", sizeof("hello"));
  printf("\n size of data type char = %d ", sizeof(char));


  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n uchar2 = %d ", uchar2);
  printf("\n schar1 = %d ", schar1);
  printf("\n schar2 = %d ", schar2);

  if (uchar1 > uchar2)
  {
    printf("\n uchar1 is greater: %d", uchar1);
  }
  else
  {
    printf("\n uchar2 is greater: %d", uchar2);
  }



  if (schar1 > schar2)
  {
    printf("\n schar1 is greater: %d", schar1);
  }
  else
  {
    printf("\n schar2 is greater: %d", schar2);
  }


  if (schar1 > uchar1)
  {
    printf("\n schar1 is greater: %d", schar1);
  }
  else
  {
    printf("\n uchar1 is greater: %d", uchar1);
  }

printf("\n schar1 + schar2 = %d", schar1 + schar2);
printf("\n uchar1 + uchar2 = %d", uchar1 + uchar2);
printf("\n uchar1 + schar1 = %d", uchar1 + schar1);



  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;
  typedef enum {false, true} Booleans;
  Booleans Test = true;
  Booleans Test2 = false;
  printf("\n value of true booleans: %d", Test);
  printf("\n value of false booleans: %d", Test2);
  printf("\n internal data type for booleans: %d", sizeof(Test));

  int f = 0x01;
  int g = 0x02;
  if (f & g)
  {
    printf("\n bitwise AND operation f & g = %d(true)", f & g);
  }
  else
  {
    printf("\n bitwise AND operation f & g = %d(false)", f & g);
  }

  if (f && g)
  {
    printf("\n logical AND operation f && g = %d(true)", f && g);
  }
  else
  {
    printf("\n logical AND operation f && g = %d(false)", f && g);
  }

  if (f != g)
  {
    printf("\n logical NOT operation f != g: %d", f != g);
  }

  if (~x == -2)
  {
    printf("\n bitwise NOT operation ~x == -2: %d", ~x == -2);
  }




  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;

  printf("\n shift_char << %d = %d", i, shift_char << i);
  printf("\n shift_char to the left %d places = %d", (i+2), shift_char << (i+2));
  printf("\n shift_char to the right %d places = %d", (i+2), shift_char >> (i+2));
  printf("\n shift_char to the right %d places = %d", (i+4), shift_char >> (i+4));
  printf("\n shift_char to the left %d places = %d", (i+4), shift_char << (i+4));
  printf("\n shift_char to the right %d places = %d", (i+7), shift_char >> (i+7));
  printf("\n shift_char to the right %d places = %d", (i+7), shift_char << (i+7));


  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d %d %d %d %d %d %d \n",
   a[0], *(ip), *(ip+1), *ip++, *ip, *(ip+3), *(ip-1));

  printf("\n size of the pointer = %d", sizeof(ip));
  printf("\n value of the pointer = %x and %x", ip, ip+1);


  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");
  int q = 9;

  printf("\n array a(input) ");
  for(int input = 0; input <10 ; input++)
  {
    printf("%d ", a[input]);
  }

  printf("\n array b ");
  for (int j=0; j<10; j++)
  {
    b[j]=a[q];
    q--;
    printf("%d ", b[j]);
  }

  int *p = a;
  int num = 0;

  for (int j = 0; j < 10; j++)
  {
    for(int k = 0; k < 10 - j; k++)
    {
      num = *(ip + 1 + k);
      *(p + 1 + k) = *(p + k);
      *(p + k) = num;
    }
  }

  printf("\n array c ");
  for (int i = 0; i < 10; i++)
  {
    printf("%d", p[i]);
  }

  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);

  for (j = 0; j < 5; j++)
  {
    printf("\n %d", AString[j]);
  }

  for (j = 0; j < 3; j++)
    AString[j] += 1;
    printf("\n Adding one integer will give %s. \n", AString);

  AString[3] += 60;
  printf("\n %s \n", AString);

  // 9 -- address calculation
  printf("\n\n PART 9 ----------\n");
  for (k = 0; k < 10; k++) b[k] = a[k];         // direct reference to array element
  {
    printf("\n address of a = %x", &a[k]);
    printf("\n address of b = %x", &b[k]);
  }

  ip = a;
  ip2 = b;
  for (k = 0; k < 10; k++) *ip2++ = *ip++;     // indirect reference to array element
  {
    printf("\n address of ip: %x", ip);
    printf("\n address of ip2: %x", ip2);
  }

  // all done
  printf("\n\n ALL DONE\n");
}
