use <phgUtils_v2.scad>

$fn=16;

// Height of the PCB aperture
pcb_h=4.5+3.5;

// Width of the PCB aperture
pcb_w=12.8;

// Thickness of the walls
thk=3;

// overall depth
depth=4.5;
// overall height
height=13+3.5;

pogoCnt=4;
pitch=2.54;
pogoDiam=1.5;

// Intermediate variables
width=pcb_w+thk*2;
h=height-thk;

tr(-width/2,0,0)
difference() {
    // 
    union() {
        trcube(0,0,h,width,depth,thk);
        trcube(0,0,0,thk,depth,h);

        trcube(width-thk,0,0,thk,depth,h);
        trcube(0,0,0,width,depth,h-pcb_h);
    }
    
    //
    for(p=[0:pogoCnt-1]) {
        tr(width/2-(pitch*(pogoCnt-1))/2+pitch*p,depth/2,-$_EPSILON) {
            trcyl(0,pogoDiam/2,0,pogoDiam,h-pcb_h+$_EPSILON*2);
            trcube(-pogoDiam/2,pogoDiam/2,0,pogoDiam,depth/2+$_EPSILON-pogoDiam/2,h-pcb_h+$_EPSILON*2);
        }
    }
    
}