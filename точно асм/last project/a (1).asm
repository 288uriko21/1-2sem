.686
.model flat,stdcall
option casemap:none


.data

.code

SHLLN proc public
   push ebp
   mov ebp, esp
   
   push esi
   push ecx
   push ebx
   push eax
   
   mov esi, [ebp+8] 
   mov ecx, [ebp+16]
   mov ebx, [ebp+12]
   mov eax, [ebp+24]
   
   cmp byte ptr[ebp+20], 1
   JNE @m2
      shl byte ptr [esi], 1    
      shl word ptr [ebx], 1    
      shl dword ptr [ecx], 1
   jmp @kon
   @m2: 
   cmp byte ptr[ebp+20], 2
   JNE @m3
      shr byte ptr [esi], 1    
      shr word ptr [ebx], 1    
      shr dword ptr [ecx], 1
   jmp @kon	 
   @m3:   
   cmp byte ptr[ebp+20], 3
   JNE @m4
      sar byte ptr [esi], 1    
      sar word ptr [ebx], 1    
      sar dword ptr [ecx], 1
   jmp @kon
   @m4:
   cmp byte ptr[ebp+20], 4
   JNE @m5
      rol byte ptr [esi], 1    
      rol word ptr [ebx], 1    
      rol dword ptr [ecx], 1
   jmp @kon
   @m5:
   cmp byte ptr[ebp+20], 5
   JNE @m6
      ror byte ptr [esi], 1    
      ror word ptr [ebx], 1    
      ror dword ptr [ecx], 1
   jmp @kon
   @m6:
   cmp byte ptr[ebp+20], 6
   JNE @m7
      shr eax, 1
      rcl byte ptr [esi], 1 
      mov eax, [ebp+24]
      shr eax, 1	  
      rcl word ptr [ebx], 1  
      mov eax, [ebp+24]
      shr eax, 1	  
      rcl dword ptr [ecx], 1
   jmp @kon
   @m7:
      shr eax, 1
      rcr byte ptr [esi], 1 
      mov eax, [ebp+24]
      shr eax, 1	  
      rcr word ptr [ebx], 1
      mov eax, [ebp+24]
      shr eax, 1	  
      rcr dword ptr [ecx], 1
   @kon:
   
   pop eax
   pop ebx
   pop ecx
   pop esi
   
   mov esp, ebp
   pop ebp
ret 20
SHLLN endp


POSTANOVKA proc public; �������� ������ �� �����, �� ������� ���� ��������� 
   push ebp
   mov ebp, esp
   
   push esi
   push ecx
   push ebx
   push eax
   
   mov esi, [ebp+16]
   mov ecx, [ebp+20]
   
   mov ebx, 1
   shl ebx, cl
   or dword ptr[esi], ebx
   
   mov ebx, [ebp+8]
   mov al, byte ptr[esi]
   mov byte ptr[ebx],al
   
   mov ebx, [ebp+12]
   mov ax, word ptr[esi]
   mov word ptr[ebx],ax
   
   pop eax
   pop ebx
   pop ecx
   pop esi
   
   mov esp, ebp
   pop ebp
ret 16
POSTANOVKA endp


end 