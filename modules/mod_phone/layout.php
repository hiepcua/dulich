<?php global $conf;?>
<div class="quick-alo-phone quick-alo-green quick-alo-show" id="quick-alo-phoneIcon" style="right: -3%; top: -5%;">
  <a href="tel:<?php echo $conf->Tel;?>" title="Liên hệ nhanh">
  <div class="quick-alo-ph-circle"></div>
  <div class="quick-alo-ph-circle-fill"></div>
  <div class="quick-alo-ph-img-circle"></div>
  </a>
</div>

<style>

.quick-alo-phone.quick-alo-static {
  opacity:.6;
}

.quick-alo-phone.quick-alo-hover,
.quick-alo-phone:hover {
  opacity:1;
}

.quick-alo-ph-circle {
  width:160px;
  height:160px;
  top:20px;
  left:20px;
  position:absolute;
  background-color:transparent;
  -webkit-border-radius:100%;
  -moz-border-radius:100%;
  border-radius:100%;
  border:2px solid rgba(30,30,30,0.4);
  opacity:.1;
  -webkit-animation:quick-alo-circle-anim 1.2s infinite ease-in-out;
  -moz-animation:quick-alo-circle-anim 1.2s infinite ease-in-out;
  -ms-animation:quick-alo-circle-anim 1.2s infinite ease-in-out;
  -o-animation:quick-alo-circle-anim 1.2s infinite ease-in-out;
  animation:quick-alo-circle-anim 1.2s infinite ease-in-out;
  -webkit-transition:all .5s;
  -moz-transition:all .5s;
  -o-transition:all .5s;
  transition:all .5s;
  -webkit-transform-origin:50% 50%;
  -moz-transform-origin:50% 50%;
  -ms-transform-origin:50% 50%;
  -o-transform-origin:50% 50%;
  transform-origin:50% 50%;
}

.quick-alo-phone.quick-alo-active .quick-alo-ph-circle {
  -webkit-animation:quick-alo-circle-anim 1.1s infinite ease-in-out !important;
  -moz-animation:quick-alo-circle-anim 1.1s infinite ease-in-out !important;
  -ms-animation:quick-alo-circle-anim 1.1s infinite ease-in-out !important;
  -o-animation:quick-alo-circle-anim 1.1s infinite ease-in-out !important;
  animation:quick-alo-circle-anim 1.1s infinite ease-in-out !important;
}

.quick-alo-phone.quick-alo-static .quick-alo-ph-circle {
  -webkit-animation:quick-alo-circle-anim 2.2s infinite ease-in-out !important;
  -moz-animation:quick-alo-circle-anim 2.2s infinite ease-in-out !important;
  -ms-animation:quick-alo-circle-anim 2.2s infinite ease-in-out !important;
  -o-animation:quick-alo-circle-anim 2.2s infinite ease-in-out !important;
  animation:quick-alo-circle-anim 2.2s infinite ease-in-out !important;
}

.quick-alo-phone.quick-alo-hover .quick-alo-ph-circle,
.quick-alo-phone:hover .quick-alo-ph-circle {
  border-color:#75eb50;
  opacity:.5;
}

.quick-alo-phone.quick-alo-green.quick-alo-hover .quick-alo-ph-circle,
.quick-alo-phone.quick-alo-green:hover .quick-alo-ph-circle {
  border-color:#75eb50;
  opacity:.5;
}

.quick-alo-phone.quick-alo-green .quick-alo-ph-circle {
  border-color:#75eb50;
  opacity:.5;
}

.quick-alo-phone.quick-alo-gray.quick-alo-hover .quick-alo-ph-circle,
.quick-alo-phone.quick-alo-gray:hover .quick-alo-ph-circle {
  border-color:#ccc;
  opacity:.5;
}

.quick-alo-phone.quick-alo-gray .quick-alo-ph-circle {
  border-color:#75eb50;
  opacity:.5;
}

.quick-alo-ph-circle-fill {
  width:100px;
  height:100px;
  top:50px;
  left:50px;
  position:absolute;
  background-color:#000;
  -webkit-border-radius:100%;
  -moz-border-radius:100%;
  border-radius:100%;
  border:2px solid transparent;
  opacity:.1;
  -webkit-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out;
  -moz-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out;
  -ms-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out;
  -o-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out;
  animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out;
  -webkit-transition:all .5s;
  -moz-transition:all .5s;
  -o-transition:all .5s;
  transition:all .5s;
  -webkit-transform-origin:50% 50%;
  -moz-transform-origin:50% 50%;
  -ms-transform-origin:50% 50%;
  -o-transform-origin:50% 50%;
  transform-origin:50% 50%;
}

.quick-alo-phone.quick-alo-active .quick-alo-ph-circle-fill {
  -webkit-animation:quick-alo-circle-fill-anim 1.7s infinite ease-in-out !important;
  -moz-animation:quick-alo-circle-fill-anim 1.7s infinite ease-in-out !important;
  -ms-animation:quick-alo-circle-fill-anim 1.7s infinite ease-in-out !important;
  -o-animation:quick-alo-circle-fill-anim 1.7s infinite ease-in-out !important;
  animation:quick-alo-circle-fill-anim 1.7s infinite ease-in-out !important;
}

.quick-alo-phone.quick-alo-static .quick-alo-ph-circle-fill {
  -webkit-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out !important;
  -moz-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out !important;
  -ms-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out !important;
  -o-animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out !important;
  animation:quick-alo-circle-fill-anim 2.3s infinite ease-in-out !important;
  opacity:0 !important;
}

.quick-alo-phone.quick-alo-hover .quick-alo-ph-circle-fill,
.quick-alo-phone:hover .quick-alo-ph-circle-fill {
  background-color:rgba(0,175,242,0.5);
  opacity:.75 !important;
}

.quick-alo-phone.quick-alo-green.quick-alo-hover .quick-alo-ph-circle-fill,
.quick-alo-phone.quick-alo-green:hover .quick-alo-ph-circle-fill {
  background-color:rgba(117,235,80,0.5);
  opacity:.75 !important;
}

.quick-alo-phone.quick-alo-green .quick-alo-ph-circle-fill {
  background-color:rgba(0,175,242,0.5);
  opacity:.75 !important;
}

.quick-alo-phone.quick-alo-gray.quick-alo-hover .quick-alo-ph-circle-fill,
.quick-alo-phone.quick-alo-gray:hover .quick-alo-ph-circle-fill {
  background-color:rgba(204,204,204,0.5);
  opacity:.75 !important;
}

.quick-alo-phone.quick-alo-gray .quick-alo-ph-circle-fill {
  background-color:rgba(117,235,80,0.5);
  opacity:.75 !important;
}

.quick-alo-ph-img-circle {
  width:60px;
  height:60px;
  top:70px;
  left:70px;
  position:absolute;
  background:rgba(30,30,30,0.1) url("imgs/call-phone.png") no-repeat center center;
  -webkit-border-radius:100%;
  -moz-border-radius:100%;
  border-radius:100%;
  border:2px solid transparent;
  opacity:.7;
  -webkit-animation:quick-alo-circle-img-anim 1s infinite ease-in-out;
  -moz-animation:quick-alo-circle-img-anim 1s infinite ease-in-out;
  -ms-animation:quick-alo-circle-img-anim 1s infinite ease-in-out;
  -o-animation:quick-alo-circle-img-anim 1s infinite ease-in-out;
  animation:quick-alo-circle-img-anim 1s infinite ease-in-out;
  -webkit-transform-origin:50% 50%;
  -moz-transform-origin:50% 50%;
  -ms-transform-origin:50% 50%;
  -o-transform-origin:50% 50%;
  transform-origin:50% 50%;
}

.quick-alo-phone.quick-alo-active .quick-alo-ph-img-circle {
  -webkit-animation:quick-alo-circle-img-anim 1s infinite ease-in-out !important;
  -moz-animation:quick-alo-circle-img-anim 1s infinite ease-in-out !important;
  -ms-animation:quick-alo-circle-img-anim 1s infinite ease-in-out !important;
  -o-animation:quick-alo-circle-img-anim 1s infinite ease-in-out !important;
  animation:quick-alo-circle-img-anim 1s infinite ease-in-out !important;
}

.quick-alo-phone.quick-alo-static .quick-alo-ph-img-circle {
  -webkit-animation:quick-alo-circle-img-anim 0s infinite ease-in-out !important;
  -moz-animation:quick-alo-circle-img-anim 0s infinite ease-in-out !important;
  -ms-animation:quick-alo-circle-img-anim 0s infinite ease-in-out !important;
  -o-animation:quick-alo-circle-img-anim 0s infinite ease-in-out !important;
  animation:quick-alo-circle-img-anim 0s infinite ease-in-out !important;
}

.quick-alo-phone.quick-alo-hover .quick-alo-ph-img-circle,
.quick-alo-phone:hover .quick-alo-ph-img-circle {
  background-color:#75eb50;
}

.quick-alo-phone.quick-alo-green.quick-alo-hover .quick-alo-ph-img-circle,
.quick-alo-phone.quick-alo-green:hover .quick-alo-ph-img-circle {
  background-color:#75eb50;
  
}

.quick-alo-phone.quick-alo-green .quick-alo-ph-img-circle {
  background-color:#75eb50;
  
}

.quick-alo-phone.quick-alo-gray.quick-alo-hover .quick-alo-ph-img-circle,
.quick-alo-phone.quick-alo-gray:hover .quick-alo-ph-img-circle {
  background-color:#ccc;
}

.quick-alo-phone.quick-alo-gray .quick-alo-ph-img-circle {
  background-color:#75eb50;
}

@-moz-keyframes quick-alo-circle-anim {
  0% {
    -moz-transform:rotate(0) scale(.5) skew(1deg);
    opacity:.1;
    -moz-opacity:.1;
    -webkit-opacity:.1;
    -o-opacity:.1;
  }
  30% {
    -moz-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.5;
    -moz-opacity:.5;
    -webkit-opacity:.5;
    -o-opacity:.5;
  }
  100% {
    -moz-transform:rotate(0) scale(1) skew(1deg);
    opacity:.6;
    -moz-opacity:.6;
    -webkit-opacity:.6;
    -o-opacity:.1;
  }
}

@-webkit-keyframes quick-alo-circle-anim {
  0% {
    -webkit-transform:rotate(0) scale(.5) skew(1deg);
    -webkit-opacity:.1;
  }
  30% {
    -webkit-transform:rotate(0) scale(.7) skew(1deg);
    -webkit-opacity:.5;
  }
  100% {
    -webkit-transform:rotate(0) scale(1) skew(1deg);
    -webkit-opacity:.1;
  }
}

@-o-keyframes quick-alo-circle-anim {
  0% {
    -o-transform:rotate(0) kscale(.5) skew(1deg);
    -o-opacity:.1;
  }
  30% {
    -o-transform:rotate(0) scale(.7) skew(1deg);
    -o-opacity:.5;
  }
  100% {
    -o-transform:rotate(0) scale(1) skew(1deg);
    -o-opacity:.1;
  }
}

@-moz-keyframes quick-alo-circle-fill-anim {
  0% {
    -moz-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.2;
  }
  50% {
    -moz-transform:rotate(0) -moz-scale(1) skew(1deg);
    opacity:.2;
  }
  100% {
    -moz-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.2;
  }
}

@-webkit-keyframes quick-alo-circle-fill-anim {
  0% {
    -webkit-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.2;
  }
  50% {
    -webkit-transform:rotate(0) scale(1) skew(1deg);
    opacity:.2;
  }
  100% {
    -webkit-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.2;
  }
}

@-o-keyframes quick-alo-circle-fill-anim {
  0% {
    -o-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.2;
  }
  50% {
    -o-transform:rotate(0) scale(1) skew(1deg);
    opacity:.2;
  }
  100% {
    -o-transform:rotate(0) scale(.7) skew(1deg);
    opacity:.2;
  }
}

@-moz-keyframes quick-alo-circle-img-anim {
  0% {
    transform:rotate(0) scale(1) skew(1deg);
  }
  10% {
    -moz-transform:rotate(-25deg) scale(1) skew(1deg);
  }
  20% {
    -moz-transform:rotate(25deg) scale(1) skew(1deg);
  }
  30% {
    -moz-transform:rotate(-25deg) scale(1) skew(1deg);
  }
  40% {
    -moz-transform:rotate(25deg) scale(1) skew(1deg);
  }
  50% {
    -moz-transform:rotate(0) scale(1) skew(1deg);
  }
  100% {
    -moz-transform:rotate(0) scale(1) skew(1deg);
  }
}

@-webkit-keyframes quick-alo-circle-img-anim {
  0% {
    -webkit-transform:rotate(0) scale(1) skew(1deg);
  }
  10% {
    -webkit-transform:rotate(-25deg) scale(1) skew(1deg);
  }
  20% {
    -webkit-transform:rotate(25deg) scale(1) skew(1deg);
  }
  30% {
    -webkit-transform:rotate(-25deg) scale(1) skew(1deg);
  }
  40% {
    -webkit-transform:rotate(25deg) scale(1) skew(1deg);
  }
  50% {
    -webkit-transform:rotate(0) scale(1) skew(1deg);
  }
  100% {
    -webkit-transform:rotate(0) scale(1) skew(1deg);
  }
}

@-o-keyframes quick-alo-circle-img-anim {
  0% {
    -o-transform:rotate(0) scale(1) skew(1deg);
  }
  10% {
    -o-transform:rotate(-25deg) scale(1) skew(1deg);
  }
  20% {
    -o-transform:rotate(25deg) scale(1) skew(1deg);
  }
  30% {
    -o-transform:rotate(-25deg) scale(1) skew(1deg);
  }
  40% {
    -o-transform:rotate(25deg) scale(1) skew(1deg);
  }
  50% {
    -o-transform:rotate(0) scale(1) skew(1deg);
  }
  100% {
    -o-transform:rotate(0) scale(1) skew(1deg);
  }
}

.quick-alo-phone {
    position: fixed;
    background-color: transparent;
    width: 200px;
    height: 200px;
    cursor: pointer;
    z-index: 200000 !important;
    -webkit-backface-visibility: hidden;
    -webkit-transform: translateZ(0);
    -webkit-transition: visibility .5s;
    -moz-transition: visibility .5s;
    -o-transition: visibility .5s;
    transition: visibility .5s;
    right: 150px;
    top: 30px;
}
</style>