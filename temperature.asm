;A users choice program that converts fahrenheit to celsius or celsius to fahrenheit.
;Input  :   Temperature in a particular scale from the user.
;Output :   Temperature in celsius or farenheit.
;Date   :   06-02-2013




section .data


	 message1 : db "Enter the choice",10,0
	 message2 : db "1 celsius to fahrenhiet",10,0
	 message3 : db "2 fahernhiet to celsius",10,0
         message4 : db "%d",10,0
         message5 : db "Enter the temperature in fahrenhiet",10,0
	 message6 : db "Enter the temperature in celsius",10,0
         message7 : db "Corresponding value is %d",10,0
	 message8 : db "3 exit",10,0
	 fahren: dd 0
	 celsius:dd 0
	 choice: dd 0
         formatin: db "%d" ,0
	 val1:dd 5
         val2:dd 9
 
	

section .text

	extern printf
	extern scanf
	global main
	main:
		push ebp
		mov ebp,esp

.label1:
		
		push message1
		call printf

        add esp,4

		push message2
                call printf

        add esp,4
        

		
		push message3
        call printf

        add esp,4

        
        push message8
        call printf

        add esp,4

		push choice
        push formatin
		call scanf

		mov eax,[choice]
		cmp eax,2                                   
		je .choice2
        
   cmp eax,3
        je .done



		push message6                                   ;celsius to fahrenheit conversion
		call printf

        add esp,4
		
		push celsius 
		push formatin
		call scanf

		mov eax,[celsius] ;

		                                                
		mov edx,0

        mov ebx,[val2]
        imul ebx

        mov ebx,[val1]
        idiv ebx
        
        
		add eax,32


	                                                                    
		
		push eax               
		push message7
		call printf            
		jmp .label1


        

.choice2:
                
		
		push message5                           ; fahrenheit to celsius conversion
		call printf

        add esp,4
		
		push  fahren
		push formatin
		call scanf

		mov eax,[fahren] 
		sub eax,32
		                                                
		mov edx,0

        mov ebx,[val1]
        imul ebx
        
        mov ebx,[val2]
        idiv ebx


	                                                        
		
		push eax               
		push message7
		call printf                         ;display result
		jmp .label1


	

		
	.done:	
		mov esp,ebp
		pop ebp
		ret	

