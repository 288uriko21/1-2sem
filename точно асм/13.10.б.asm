include console.inc
COMMENT *
��������� �������
������� ������
������ 13.10 �
*
.DATA 
.code
	pop1 macro reg
	mov [esp-4],eax;; ��������� ������� eax, � ������� ����� ����� ������������
	mov eax,[esp];; ����������� �������
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