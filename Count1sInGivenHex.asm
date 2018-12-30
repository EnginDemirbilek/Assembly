org 100h

.data           
msg db "Count of 1's is even$"
msg1 db "Count of 1's is odd$"      
      
           
.CODE
    MAIN PROC
        mov cx, 15h; LOOP COUNTER for 16 value
        mov ax, 4ABC1 ;Example given hex value
        xor bx, bx ;COUNTER for 1s, set it 0
        
        L1:
        shr ax, 1  ;Shift ax to 1 left
        JC hasCarry ;if carry flag setted 1 jump to has carry
         
        
        
        backToLoop:
        
        LOOP L1  
                       
        mov ax, bx ; Transfer count of 1s to ax
        mov cx, 02h; divider for check if count of 1s is even or odd
        div cx; divide ax by 02h
        CMP dl, 0h; if dx is zero then its even
        JE PRINTE; jump to print even 
        
        CMP dl, 0h
        JNE PRINTO                
                       
        JMP TERMINATE
          
        PRINTE:
        lea dx, msg; DISPLAY MESSAGE
        mov ah, 9; DISPLAY MESSAGE
        int 21h; DISPLAY MESSAGE
        JMP TERMINATE; TERMINTATE THE PROGRAM
        
        PRINTO:
        mov dx, offset msg1
        mov ah, 9
        int 21h 
        JMP TERMINATE  
          
          
          
        hasCarry: 
            inc bx ;INCREMENT 1 counter
            JMP backToLoop ;Back to loop
          
        TERMINATE: 
            mov ah, 2
            mov dl, bl
            int 21h
            HLT  
          
          

    MAIN ENDP
  END MAIN   
