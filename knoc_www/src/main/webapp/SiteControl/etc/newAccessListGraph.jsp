<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<link class="include" rel="stylesheet" type="text/css" href="/include/js/jquery_plugin/dist/jquery.jqplot.min.css" />
<link type="text/css" rel="stylesheet" href="/include/js/jquery_plugin/dist/syntaxhighlighter/styles/shCoreDefault.min.css" />
<link type="text/css" rel="stylesheet" href="/include/js/jquery_plugin/dist/syntaxhighlighter/styles/shThemejqPlot.min.css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="/include/js/jquery_plugin/dist/excanvas.js"></script><![endif]--> 
<script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/jquery.min.js"></script>
    
	<script type="text/javascript">
	
    window.onload = function(){
    	var s1 = parent.s1;
    	var s2 = parent.s2;
    	
        plot1 = $.jqplot("chart1", [s2, s1], {
            // Turns on animatino for all series in this plot.
            animate: true,
            // Will animate plot on calls to plot1.replot({resetAxes:true})
            animateReplot: true,
            cursor: {
                show: true,
                zoom: true,
                looseZoom: true,
                showTooltip: false
            },
            series:[
                {
                    pointLabels: {
                        show: true
                    },
                    renderer: $.jqplot.BarRenderer,
                    showHighlight: false,
                    yaxis: 'y2axis',
                    rendererOptions: {
                        // Speed up the animation a little bit.
                        // This is a number of milliseconds.  
                        // Default for bar series is 3000.  
                        animation: {
                            speed: 2500
                        },
                        barWidth: 15,
                        barPadding: -15,
                        barMargin: 0,
                        highlightMouseOver: false
                    }
                }, 
                {
                    rendererOptions: {
                        // speed up the animation a little bit.
                        // This is a number of milliseconds.
                        // Default for a line series is 2500.
                        animation: {
                            speed: 2000
                        }
                    }
                }
            ],
            axesDefaults: {
                pad: 0
            },
            axes: {
                // These options will set up the x axis like a category axis.
                xaxis: {
                    tickInterval: 1,
                    drawMajorGridlines: false,
                    drawMinorGridlines: true,
                    drawMajorTickMarks: false,
                    rendererOptions: {
                    tickInset: 0.5,
                    minorTicks: 1
                	}
                },
                yaxis: {
                    tickOptions: {
                        formatString: "%'d¸í"
                    },
                    rendererOptions: {
                        forceTickAt0: true
                    }
                },
                y2axis: {
                    tickOptions: {
                        formatString: "%'d¸í"
                    },
                    rendererOptions: {
                        // align the ticks on the y2 axis with the y axis.
                        alignTicks: true,
                        forceTickAt0: true
                    }
                }
            },
            highlighter: {
                show: true, 
                showLabel: true, 
                tooltipAxes: 'y',
                sizeAdjust: 7.5 , tooltipLocation : 'ne'
            }
        });
      
    };


</script>

<div id="chart1" style="width:980px; height:300px"></div>
	<!-- Don't touch this! -->

    <script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="/include/js/jquery_plugin/dist/syntaxhighlighter/scripts/shCore.min.js"></script>
    <script type="text/javascript" src="/include/js/jquery_plugin/dist/syntaxhighlighter/scripts/shBrushJScript.min.js"></script>
    <script type="text/javascript" src="/include/js/jquery_plugin/dist/syntaxhighlighter/scripts/shBrushXml.min.js"></script>
<!-- Additional plugins go here -->

  <script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/plugins/jqplot.barRenderer.min.js"></script>
  <script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/plugins/jqplot.highlighter.min.js"></script>
  <script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/plugins/jqplot.cursor.min.js"></script> 
  <script class="include" type="text/javascript" src="/include/js/jquery_plugin/dist/plugins/jqplot.pointLabels.min.js"></script>