use <phgUtils_v2.scad>

$fn=16;

pcb_h=4;
width=30;
depth=10;
height=20;
thk=5;
lip=1;

pogoCnt=4;
pitch=2.54;
pogoDiam=1.5;

tr(-width/2,0,0)
difference() {
    union() {
        trcube(0,0,height,width,depth,thk);
        trcube(0,0,0,thk,depth,height);
        trcube(thk,0,0,lip,depth,height-pcb_h);

        trcube(width-thk,0,0,thk,depth,height);
        trcube(width-thk-lip,0,0,lip,depth,height-pcb_h);
        trcube(0,0,0,width,depth,height-pcb_h);
    }
    
    for(p=[0:pogoCnt-1]) {
        tr(width/2-(pitch*(pogoCnt-1))/2+pitch*p,depth/2,-$_EPSILON) {
            trcyl(0,pogoDiam/2,0,pogoDiam,height-pcb_h+$_EPSILON*2);
            trcube(-pogoDiam/2,pogoDiam/2,0,pogoDiam,depth/2+$_EPSILON-pogoDiam/2,height-pcb_h+$_EPSILON*2);
        }
    }
    
}