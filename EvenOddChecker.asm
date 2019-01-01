
org 100h ; x86 

.DATA ;DATA SEGMENT
msg1 db 'its even$' ;EVEN MESSAGE
msg2 db 'its odd$'  ; ODD MESSAGE

.CODE  ;CODE SEGMENT
    MAIN PROC       
        mov ah,1 ;INPUT CODE
        int 21h  ;DISPLAY
        mov bx, 02h 
        div bx
        cmp dx, 0h
        JE EVEN   
        
        cmp dx, 0h
        JNE ODD
        
        EVEN:
        mov dx,offset msg1
        mov ah, 9 ;DISPLAY STRING CODE
        int 21h
        JMP JEVEN ; TERMINATE THE PROGRAM
        
        ODD:    
        mov dx,offset msg2
        mov ah, 9
        int 21h
        
        
        JEVEN:
      
        HLT ;TERMINATE THE PROGRAM
      
        MAIN ENDP
    END MAIN
        
