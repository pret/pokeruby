@********************************************************************
@*          AgbMacro.s                                              *
@*            AGBïWèÄÉ}ÉNÉçä÷êîÅiGASópÅj                            *
@*                                                                  *
@*          Copyright (C) 1999-2001 NINTENDO Co.,Ltd.               *
@********************************************************************


@--------------------------------------------------------------------
@-                      ÉVÉXÉeÉÄÉRÅ[Éã                              -
@--------------------------------------------------------------------

    .MACRO    SystemCall16 No
        swi \No
    .ENDM
    .MACRO    SystemCall32 No
        swi \No << 16
    .ENDM

    .MACRO    Halt                Bits    @ ÇgÇ`ÇkÇs
        SystemCall\Bits 2
    .ENDM
    .MACRO    Stop                Bits    @ ÇrÇsÇnÇo
        SystemCall\Bits 3
    .ENDM


