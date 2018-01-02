#ifndef GUARD_GBASDKASSERT_H
#define GUARD_GBASDKASSERT_H

// this header is based on the
// GBA SDK IsAgbAssert.h.

#ifdef NOAGBPRN
    #define AGBPrintInit()
    #define AGBPutc(pBuf)
    #define AGBPrint(pBuf)
    #define AGBPrintf(...)
    #define AGBPrintFlush1Block()
    #define AGBPrintFlush()
    #define AGBAssert(pFile, nLine, pExpression, nStopProgram)
#else
    // without NOAGBPRN defined, this enables asserts for usage
    // on a standard GBA debugger unit or in emulators that
    // support it.

// no$gba support, due to the different method no$gba uses to print debug strings.
// currently cannot use IsNoGba due to no$gba doing a gloriously fuck up of a job and
// breaking the version identifier.
#define AGBPrint(pBuf) \
{ \
    NOGBAPrint(pBuf); \
    AGBPrint(pBuf); \
}

    void AGBPrintInit(void);
    void AGBPutc(const char pBuf);
    void AGBPrint(const char *pBuf);
    void AGBPrintf(const char *pBuf, ...);
    void AGBPrintFlush1Block(void);
    void AGBPrintFlush(void);
    void AGBAssert(const char *pFile, int nLine, const char *pExpression, int nStopProgram);
    // NOGBA PROTOTYPE FOR LIBISAGBPRN.C
    void NOGBAPrint(const char *pBuf);
#endif

// when using AGB_WARNING, be sure to flush after as AGBAssert does not flush the string to console
// immediately after usage.
#ifdef NOAGBPRN
    #define AGB_ASSERT(expression)
#else
    #define AGB_ASSERT(expression)  (expression) ? ((void *)0) : AGBAssert(__FILE__, __LINE__, #expression, 1);
#endif

#ifdef NOAGBPRN
    #define AGB_WARNING(expression)
#else
    #define AGB_WARNING(expression) (expression) ? ((void *)0) : AGBAssert(__FILE__, __LINE__, #expression, 0);
#endif

#endif
