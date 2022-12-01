include console.inc
COMMENT *
Побитовые опреции
Замятин Андрей
Задача 13.10 а
*
.DATA 
.code
	pop1 macro reg
	mov [esp-4],eax;; сохраняем регистр eax, в двойном слове после сохраняемого
	mov eax,[esp];; выталкиваем элемент
	add esp,4
	mov reg,eax
	mov eax,[esp-4]
	endm
Start:
	mov eax,100
	push eax
	outintln ebx,,'ebx='
	push ebx
	pop1 ebx
	outintln ebx,,'ebx='
	pop eax
	outintln eax
	exit
END Start