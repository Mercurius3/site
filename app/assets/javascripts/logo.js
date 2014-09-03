$("document").ready(function() {
  
  var paper = new Raphael(document.getElementById("horizon"), "100%",0);
  var horizon = paper.path("M0,0 L0,1000 C2400,360 4000,520 4800,680 L4800,0 Z");
  paper.setViewBox(0,0,4800,1000);
  horizon.attr({
    fill: "white",
    stroke: "none"
  });
 
  // icon
  var brand_paper = new Raphael(document.getElementById("logo"),500,250);
  brand_paper.setViewBox(0,0,1500,750);
  var logo = brand_paper.set();
    var four = brand_paper.path("m485,210c0,21.164001 -17.14801,38.313004 -38.311005,38.313004c-21.161011,0 -38.309998,-17.149002 -38.309998,-38.313004c0,-21.158005 17.148987,-38.313004 38.309998,-38.313004c21.162994,0 38.311005,17.154999 38.311005,38.313004");
    var five = brand_paper.path("m582,259.786499c-44.146973,-50.876007 -102.963013,-86.057999 -167.570984,-102.234009c2.89798,-26.233994 5.814972,-52.491989 8.750977,-78.774994c77.864014,-14.777996 161.470032,-17.565987 248.075989,-3.982986c-30.083008,61.81601 -59.833008,123.481003 -89.255981,184.99202");
    var six = brand_paper.path("m400,154.798996c-65.376007,-13.597 -135.888,-8.080978 -202.565002,17.505997c-1.464005,-2.743988 -2.927994,-5.473999 -4.393997,-8.188995c64.660995,-36.896996 135.916,-65.100998 213.057999,-81.622009c-2.045013,24.119003 -4.078003,48.221008 -6.098999,72.305008");
    var one = brand_paper.path("m570,209.350906c-30.127991,-38.970001 -73.813995,-61.393997 -119.78299,-66.09201c2.75,-14.740005 5.5,-29.479996 8.248993,-44.219986c57.521973,-1.073013 116.176025,20.016998 161.937988,64.447983c-16.800964,15.287994 -33.602966,30.576004 -50.403992,45.864014");
    var two = brand_paper.path("m438,142.255997c-46.287994,-1.463989 -93.834015,14.903 -131.358002,50.281998c-4.60202,-4.186996 -9.204987,-8.375 -13.806,-12.561996c38.360992,-48.018997 93.152008,-75.165001 150.350006,-80.258011l-5.186005,42.53801z");
    var three = brand_paper.path("m455,202.939102c-4.854004,6.468002 -12.649994,8.813004 -17.406006,5.233994c-4.764008,-3.565994 -4.682983,-11.713013 0.17099,-18.172012c4.853027,-6.465988 12.642029,-8.814987 17.406006,-5.235977c4.755005,3.572998 4.681,11.707977 -0.17099,18.173996");
    one.attr({fill:"#373535"});
    two.attr({fill:"#373535"});
    three.attr({fill:"#ffffff"});
    four.attr({fill:"#373535"});
    five.attr({fill:"#e97438"});
    six.attr({fill:"#a55298"});
    logo.push(
        three,
        four,
        five,
        six,
        one,
        two
      );
    logo.attr({stroke:"none"});
    // logo.transform("T100,0");
  var svg = $('#horizon').find('svg')[0];
	// svg.setAttribute('preserveAspectRatio', 'none');
	svg.setAttribute('preserveAspectRatio', 'xMidYMid meet');
});