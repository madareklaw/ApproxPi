REM Setup screen mode for graphics
SCREEN 12

REM declare variables
DIM x AS DOUBLE
DIM y AS DOUBLE
DIM ApproxPi AS DOUBLE
DIM TotalCount AS LONG
DIM InCount AS LONG
DIM currentCount AS LONG

REM initialise total count. Change this for more (or less) precise value of PI
LET TotalCount = 10000

REM make sure the random values will be random(ish)
RANDOMIZE TIMER

REM Setup screen graphics
PRINT "Pi is approximately: "
CIRCLE (50, 450), 400, 14, 0, 1.57, 1

REM Calcaulation loop
FOR i = 0 TO TotalCount
    REM Remove delay if not using QB64
    _DELAY 0.001
    REM get random X and Y coordinates
    LET x = RND(1)
    LET y = RND(1)

    REM Check if coordinates are in circle
    IF SQR((x ^ 2) + (y ^ 2)) < 1 THEN
        InCount = InCount + 1
    END IF

    REM keep track of where we are in the loop
    currentCount = currentCount + 1

    REM Calculate PI based off counters
    ApproxPi = (InCount / currentCount) * 4

    REM Show coordinate on screen. This will need to be scaled
    xInt = INT(x * 400)
    yInt = INT(y * 400)
    PSET (xInt + 50, yInt + 50), 40

    REM Print current value for PI
    LOCATE 1, 25
    PRINT ApproxPi
NEXT i

